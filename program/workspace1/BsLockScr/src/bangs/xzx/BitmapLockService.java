package bangs.xzx;


import android.app.KeyguardManager;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.IBinder;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Log;

public class BitmapLockService extends Service {
	TelephonyManager manager ;
	private int  isInCall=0;
	private static String TAG = "ZdLockService";
	private Intent zdLockIntent = null ;
	private Handler mainHandler = null; //与主Activity通信的Handler对象
	@Override
	public IBinder onBind(Intent arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void onCreate(){
		super.onCreate();
		
		
		zdLockIntent = new Intent(BitmapLockService.this , BitmapLockScrActivity.class);
		zdLockIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		
		/*注册广播*/
		IntentFilter mScreenOnFilter = new IntentFilter("android.intent.action.SCREEN_ON");
		BitmapLockService.this.registerReceiver(mScreenOnReceiver, mScreenOnFilter);
		
		/*注册广播*/
		IntentFilter mScreenOffFilter = new IntentFilter("android.intent.action.SCREEN_OFF");
		BitmapLockService.this.registerReceiver(mScreenOffReceiver, mScreenOffFilter);
		
		  //获取电话服务
        manager = (TelephonyManager) this.getSystemService(TELEPHONY_SERVICE);
        // 手动注册对PhoneStateListener中的listen_call_state状态进行监听
        manager.listen(new MyPhoneStateListener(), PhoneStateListener.LISTEN_CALL_STATE);
		
	}

	@Override
	public int onStartCommand(Intent intent , int flags , int startId){
		
		return Service.START_STICKY;
		
	}
	
	@Override
	public void onDestroy(){
		super.onDestroy();
		BitmapLockService.this.unregisterReceiver(mScreenOnReceiver);
		BitmapLockService.this.unregisterReceiver(mScreenOffReceiver);
		//在此重新启动
		startService(new Intent(BitmapLockService.this, BitmapLockService.class));
	}
	
	private KeyguardManager mKeyguardManager = null ;
	private KeyguardManager.KeyguardLock mKeyguardLock = null ;
	//屏幕变亮的广播,我们要隐藏默认的锁屏界面
	private BroadcastReceiver mScreenOnReceiver = new BroadcastReceiver(){

		@Override
		public void onReceive(Context context , Intent intent) {
			
            Log.i(TAG, intent.getAction());

			if(intent.getAction().equals("android.intent.action.SCREEN_ON")){
				Log.i(TAG, "----------------- android.intent.action.SCREEN_ON------");
//				mKeyguardManager = (KeyguardManager)context.getSystemService(Context.KEYGUARD_SERVICE);
//				mKeyguardLock = mKeyguardManager.newKeyguardLock("zdLock 1"); 
//				mKeyguardLock.disableKeyguard();
			}
		}
		
	};
	

	//屏幕变暗/变亮的广播 ， 我们要调用KeyguardManager类相应方法去解除屏幕锁定
	private BroadcastReceiver mScreenOffReceiver = new BroadcastReceiver(){
		@Override
		public void onReceive(Context context , Intent intent) {
			String action = intent.getAction() ;
			
		    Log.i(TAG, intent.toString());
		    
		     if (action.equals(Intent.ACTION_TIME_TICK)
		    	|| action.equals(Intent.ACTION_TIMEZONE_CHANGED)) 
		     {
		    	 mainHandler.obtainMessage(1).sendToTarget(); 
		     }

		    
		    
			if(action.equals("android.intent.action.SCREEN_OFF")
					|| action.equals("android.intent.action.SCREEN_ON") ){
				mKeyguardManager = (KeyguardManager)context.getSystemService(Context.KEYGUARD_SERVICE);
				mKeyguardLock = mKeyguardManager.newKeyguardLock("zdLock 1"); 
				mKeyguardLock.disableKeyguard();
				if(isInCall==0)
				startActivity(zdLockIntent);
			}
		}
		
	};

	
	
	
	 class MyPhoneStateListener extends PhoneStateListener{

	        @Override
	        public void onCallStateChanged(int state, String incomingNumber) {
	            switch (state) {
	            case TelephonyManager.CALL_STATE_IDLE:
	              //  result+=" 手机空闲起来了 ";
	                break;
	            case TelephonyManager.CALL_STATE_RINGING:
	               // result+=" 手机铃声响了，来电号码:"+incomingNumber;
	                break;
	            case TelephonyManager.CALL_STATE_OFFHOOK:
	               // result+=" 电话被挂起了 ";
	            	 break;
	            default:
	                break;
	            }
	          //  textView.setText(result);
	            if(state==TelephonyManager.CALL_STATE_IDLE)
	            {
	            	isInCall=0;
	            }
	            else
	            {
	            	isInCall=1;
	            }
	            super.onCallStateChanged(state, incomingNumber);
	        }
	        
	    }
	
	
	
	
	
	
}
