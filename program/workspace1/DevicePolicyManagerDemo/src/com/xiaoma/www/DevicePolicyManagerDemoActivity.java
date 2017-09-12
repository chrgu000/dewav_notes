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
* @Description: ��Ļ������
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
        //��ʼ��
        init();
    }
    
    /**
     * ��ʼ��ʵ��
     */
    private void init(){
    	//��Դ������λ
    	startPermissionBtn = (Button)findViewById(R.id.button1);
    	stopPermissionBtn = (Button)findViewById(R.id.button2);
    	sysLockBtn = (Button)findViewById(R.id.button3);
    	
    	startPermissionBtn.setOnClickListener(listener);
    	stopPermissionBtn.setOnClickListener(listener);
    	sysLockBtn.setOnClickListener(listener);
    	
    	//ȡ��ϵͳ����
    	dpm  = (DevicePolicyManager)getSystemService(Context.DEVICE_POLICY_SERVICE);
    	componentName = new ComponentName(this, AdminReceiver.class);
    	
    }
    
    
    /**
     * ��ť��������ʵ��,�˴�С���£���ʵ�ּ�����ʱ��Ҫ��һ����֧����д̫���߼�����
     * ��ֻ֧�����֧����������Ҫ����Ļ�����ģ�黯�����������ȥ�Ϳ�����
     * С��ϣ����Ҵ�һ��ʼ�����ɸ���ϰ�ߣ���𡣡�
     */
    private OnClickListener listener = new OnClickListener() {
		@Override
		public void onClick(View v) {
			//������������ť�ֱ�����¼�ʵ��
			switch (v.getId()) {
			case R.id.button1:
				//�����豸Ȩ��
				startDeviceManager();
				break;
			case R.id.button2:
				//ֹͣ�豸Ȩ��
				stopDeviceManager();
				break;
			case R.id.button3:
				//����ϵͳ��
				sysLock();
				break;
			default:
				break;
			}
		}
	};
	
	/**
	 * �����豸����Ȩ��
	 */
	private void startDeviceManager(){
		//���һ����ʽ��ͼ������豸Ȩ�޵���� 
		//���Intent (DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN)��ת�� Ȩ������ҳ��
		//����������������EXTRA_DEVICE_ADMIN �� EXTRA_ADD_EXPLANATION
		Intent intent = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
		
		//Ȩ���б�
		//EXTRA_DEVICE_ADMIN������˵�����õ���ЩȨ�ޣ� 
        intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, componentName);
        
        //����(additional explanation)
        //EXTRA_ADD_EXPLANATION����Ϊ���ӵ�˵��
        intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "--С����С����С��ϹϹ�--");
        
        startActivityForResult(intent, 0);
        
		}
	
	/**
	 * �����豸����Ȩ�޷���ʵ��
	 */
	private void stopDeviceManager(){
		Log.i("XiaoMaGuo","------ unActiveManage ------");
		boolean active = dpm.isAdminActive(componentName);
        if (active) {
        	dpm.removeActiveAdmin(componentName);
        }
	}
	
	/**
	 * ����ϵͳ������ʵ��
	 */
	private void sysLock(){
        boolean active = dpm.isAdminActive(componentName);
        if (active) {
        	dpm.lockNow();
        }
	}
	
}
