package com.xiaoma.www;

import com.xiaoma.www.R;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;


/**  
* @Title: DevicePolicyManagerDemoActivity.java
* @Package com.xiaoma.www
* @Description: 屏幕锁测试
* @author MZH
* @version V2.2
*/
public class DevicePolicyManagerDemoActivity extends Activity {
	
	private Button startPermissionBtn;
	private Button stopPermissionBtn;
	private Button sysLockBtn;
	
	private DevicePolicyManager dpm;
	private ComponentName componentName ;
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        //初始化
        init();
    }
    
    /**
     * 初始化实现
     */
    private void init(){
    	//资源声明定位
    	startPermissionBtn = (Button)findViewById(R.id.button1);
    	stopPermissionBtn = (Button)findViewById(R.id.button2);
    	sysLockBtn = (Button)findViewById(R.id.button3);
    	
    	startPermissionBtn.setOnClickListener(listener);
    	stopPermissionBtn.setOnClickListener(listener);
    	sysLockBtn.setOnClickListener(listener);
    	
    	//取得系统服务
    	dpm  = (DevicePolicyManager)getSystemService(Context.DEVICE_POLICY_SERVICE);
    	componentName = new ComponentName(this, AdminReceiver.class);
    	
    }
    
    
    /**
     * 按钮监听器的实现,此处小马讲下，在实现监听的时候不要在一个分支里面写太多逻辑处理
     * 分支只负责分支，不负责处理，要处理的话可以模块化，处理函数抽出去就可以了
     * 小马希望大家从一开始就养成个好习惯，吼吼。。
     */
    private OnClickListener listener = new OnClickListener() {
		@Override
		public void onClick(View v) {
			//以下是三个按钮分别处理的事件实现
			switch (v.getId()) {
			case R.id.button1:
				//开启设备权限
				startDeviceManager();
				break;
			case R.id.button2:
				//停止设备权限
				stopDeviceManager();
				break;
			case R.id.button3:
				//调用系统锁
				sysLock();
				break;
			default:
				break;
			}
		}
	};
	
	/**
	 * 启动设备管理权限
	 */
	private void startDeviceManager(){
		//添加一个隐式意图，完成设备权限的添加 
		//这个Intent (DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN)跳转到 权限提醒页面
		//并传递了两个参数EXTRA_DEVICE_ADMIN 、 EXTRA_ADD_EXPLANATION
		Intent intent = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
		
		//权限列表
		//EXTRA_DEVICE_ADMIN参数中说明了用到哪些权限， 
        intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, componentName);
        
        //描述(additional explanation)
        //EXTRA_ADD_EXPLANATION参数为附加的说明
        intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "--小马坏，小马爱，小马瓜瓜怪--");
        
        startActivityForResult(intent, 0);
        
		}
	
	/**
	 * 禁用设备管理权限方法实现
	 */
	private void stopDeviceManager(){
		Log.i("XiaoMaGuo","------ unActiveManage ------");
		boolean active = dpm.isAdminActive(componentName);
        if (active) {
        	dpm.removeActiveAdmin(componentName);
        }
	}
	
	/**
	 * 调用系统锁方法实现
	 */
	private void sysLock(){
        boolean active = dpm.isAdminActive(componentName);
        if (active) {
        	dpm.lockNow();
        }
	}
	
}
