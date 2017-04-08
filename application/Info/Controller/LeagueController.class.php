<?php
namespace Info\Controller;

use Common\Controller\AdminbaseController;

class LeagueController extends AdminbaseController {

	function _initialize() {
		parent::_initialize();
	}
    
    /**
     * 信息列表页
     * @Author   eagle
     * @DateTime 2017-04-08
     * @return   [type]     [description]
     */
    function index(){
    	$admin_id = get_current_admin_id();
    	if($admin_id==1){
    		$this->error("不允许此用户操作！",U("admin/public/login"));
    		exit;
    	}
    	$dept_id = M('users')->field('dept_id')->where(array('id'=>$admin_id))->find();
    	$dept_id = isset($dept_id['dept_id']) ? $dept_id['dept_id'] : 0;
        $where['dept_id'] = $dept_id;

        // 根据条件查询   start
        $post = I('post.');
        $status = isset($post['status']) ? $post['status'] : -1;
        $start_time = isset($post['start_time']) ? $post['start_time'] : '';
        $end_time   = isset($post['end_time']) ? $post['end_time'] : '';
        $user_name  = isset($post['keyword']) ? $post['keyword'] : '';
        if($status==0 || $status==1){
            $where['status'] = $status;
        }
        if($start_time && $end_time){
            $where['join_time']  = array('between',array($start_time,$end_time));
        }
        if($user_name){
            $where['user_name'] = array('like','%'.$user_name.'%');
        }
        // 根据条件查询   end

    	$count = M('member')->where($where)->count();
    	$page = $this->page($count, 6);
    	$members = M('member')->where($where)->limit($page->firstRow , $page->listRows)->select();
    	
    	if($members){
    		foreach ($members as $key => $value) {
    			if($value['sex']==1){
    				$members[$key]['sex_name'] = '男';
    			}else if($value['sex']==2){
    				$members[$key]['sex_name'] = '女';
    			}else if($value['sex']==0){
    				$members[$key]['sex_name'] = '保密';
    			}

    			if($value['status']==1){
    				$members[$key]['status_name'] = '已审核';
    			}else if($value['status']==0){
    				$members[$key]['status_name'] = '未审核';
    			}
    		}
    	}

    	$this->assign("page", $page->show('Admin'));
    	$this->assign('info',$members);
    	$this->display();
    }


    /**
     * 添加共青团员首页
     * @Author   eagle
     * @DateTime 2017-04-08
     */
    function add(){
        $admin_id = get_current_admin_id();
        if($admin_id==1){
            $this->error("不允许此用户操作！",U("admin/public/login"));
            exit;
        }
    	$this->display();
    }

    /**
     * 提交添加的共青团员
     * @Author   eagle
     * @DateTime 2017-04-08
     */
    function add_post(){
    	$post = I('post.post');
    	$data = array();
    	$data['user_name'] = isset($post['post_name']) ? $post['post_name'] : '';
    	$data['sex']       = isset($post['sex']) ? $post['sex'] : 0;
    	$data['idcode']    = isset($post['idcode']) ? $post['idcode'] : '';
    	$data['native_place'] = isset($post['native_place']) ? $post['native_place'] : '';
    	$data['join_time']    = date('Y-m-d H:i',time());
    	$data['status']       = 0;

    	$admin_id = get_current_admin_id();
    	$dept_info = M('dept')->alias('d')->join('le_users as l ON l.dept_id= d.id')->field('d.id,d.name')->where(array('l.id'=>$admin_id))->find();
    	
    	$data['dept_id']   = isset($dept_info['id']) ? $dept_info['id'] : 0;
    	$data['dept_name'] = isset($dept_info['name']) ? $dept_info['name'] : '';
    	$result = M('member')->add($data);
    	if($result){
    		$this->success("添加成功！");
    	}else{
    		$this->error("添加失败！");
    	}
    	
    }


    /**
     * 编辑首页
     * @Author   eagle
     * @DateTime 2017-04-08
     * @return   [type]     [description]
     */
    function edit(){
        $id = I('get.id');
        $info = M('member')->where(array('id'=>$id))->find();
        
        $this->assign('info',$info);
        $this->display();
    }

    /**
     * 提交编辑
     * @Author   eagle
     * @DateTime 2017-04-08
     * @return   [type]     [description]
     */
    function edit_post(){
        $post = I('post.post');
        $id = isset($post['id']) ? $post['id'] :0;
        if(isset($post['id'])){
            unset($post['id']);
        }

        $result = M('member')->where("id=$id")->save($post);
        if($result){
            $this->success("修改成功！");
        }else{
            $this->error("修改失败！");
        }


    }

    /**
     * 删除
     * @Author   eagle
     * @DateTime 2017-04-08
     * @return   [type]     [description]
     */
    function delete(){
        // 单一删除
        if(isset($_GET['id'])){
            $id = I("get.id",0,'intval');
            if ((M('member')->where(array('id'=>$id))->delete()) !==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }
        // 批量删除
        if(isset($_POST['ids'])){
            $ids = I('post.ids');
            if (M('member')->where(array('id'=>array('in',$ids)))->delete()!==false) {
                $this->success("删除成功！");
            } else {
                $this->error("删除失败！");
            }
        }
    }

    /**
     * 批量审核
     * @Author   eagle
     * @DateTime 2017-04-08
     * @return   [type]     [description]
     */
    function audit(){
        if(isset($_POST['ids'])){
            $ids = I('post.ids');
            if (M('member')->where(array('id'=>array('in',$ids)))->save(array('status'=>1))!==false) {
                $this->success("审核成功！");
            } else {
                $this->error("审核失败！");
            }
        }
    }

    /**
     * 批量取消审核
     * @Author   eagle
     * @DateTime 2017-04-08
     * @return   [type]     [description]
     */
    function cancel_audit(){
        if(isset($_POST['ids'])){
            $ids = I('post.ids');
            if (M('member')->where(array('id'=>array('in',$ids)))->save(array('status'=>0))!==false) {
                $this->success("取消审核成功！");
            } else {
                $this->error("取消审核失败！");
            }
        }
    }

   
}