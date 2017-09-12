package com.xiaoma.www;

import android.app.admin.DeviceAdminReceiver;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;
import android.widget.Toast;
public class AdminReceiver extends DeviceAdminReceiver {
	@Override
	public DevicePolicyManager getManager(Context context) {
		Log.i("XiaoMaGuo", "������getManager()����");
		return super.getManager(context);
	}
	@Override
	public ComponentName getWho(Context context) {
		Log.i("XiaoMaGuo", "������getWho()����");
		return super.getWho(context);
	}
	
	/**
	 * ����
	 */
	@Override
	public void onDisabled(Context context, Intent intent) {
		Log.i("XiaoMaGuo", "������onDisabled()����");
		Toast.makeText(context, "�����豸����", Toast.LENGTH_SHORT).show();
		
		super.onDisabled(context, intent);
	}
	@Override
	public CharSequence onDisableRequested(Context context, Intent intent) {
		Log.i("XiaoMaGuo", "������onDisableRequested()����");
		return super.onDisableRequested(context, intent);
	}
	
	/**
	 * ����
	 */
	@Override
	public void onEnabled(Context context, Intent intent) {
		Log.i("XiaoMaGuo", "������onEnabled()����");
		Toast.makeText(context, "�����豸����", Toast.LENGTH_SHORT).show();
		
		super.onEnabled(context, intent);
	}
	@Override
	public void onPasswordChanged(Context context, Intent intent) {
		Log.i("XiaoMaGuo", "������onPasswordChanged()����");
		super.onPasswordChanged(context, intent);
	}
	@Override
	public void onPasswordFailed(Context context, Intent intent) {
		Log.i("XiaoMaGuo", "������onPasswordFailed()����");
		super.onPasswordFailed(context, intent);
	}
	@Override
	public void onPasswordSucceeded(Context context, Intent intent) {
		Log.i("XiaoMaGuo", "������onPasswordSucceeded()����");
		super.onPasswordSucceeded(context, intent);
	}
	@Override
	public void onReceive(Context context, Intent intent) {
		Log.i("XiaoMaGuo", "������onReceive()����");
		super.onReceive(context, intent);
	}
	@Override
	public IBinder peekService(Context myContext, Intent service) {
		Log.i("XiaoMaGuo", "������peekService()����");
		return super.peekService(myContext, service);
	}
	
}
