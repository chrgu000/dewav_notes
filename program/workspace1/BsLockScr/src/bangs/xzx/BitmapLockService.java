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
	private Handler mainHandler = null; //����Activityͨ�ŵ�Handler����
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
		
		/*ע��㲥*/
		IntentFilter mScreenOnFilter = new IntentFilter("android.intent.action.SCREEN_ON");
		BitmapLockService.this.registerReceiver(mScreenOnReceiver, mScreenOnFilter);
		
		/*ע��㲥*/
		IntentFilter mScreenOffFilter = new IntentFilter("android.intent.action.SCREEN_OFF");
		BitmapLockService.this.registerReceiver(mScreenOffReceiver, mScreenOffFilter);
		
		  //��ȡ�绰����
        manager = (TelephonyManager) this.getSystemService(TELEPHONY_SERVICE);
        // �ֶ�ע���PhoneStateListener�е�listen_call_state״̬���м���
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
		//�ڴ���������
		startService(new Intent(BitmapLockService.this, BitmapLockService.class));
	}
	
	private KeyguardManager mKeyguardManager = null ;
	private KeyguardManager.KeyguardLock mKeyguardLock = null ;
	//��Ļ�����Ĺ㲥,����Ҫ����Ĭ�ϵ���������
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
	

	//��Ļ�䰵/�����Ĺ㲥 �� ����Ҫ����KeyguardManager����Ӧ����ȥ�����Ļ����
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
	              //  result+=" �ֻ����������� ";
	                break;
	            case TelephonyManager.CALL_STATE_RINGING:
	               // result+=" �ֻ��������ˣ��������:"+incomingNumber;
	                break;
	            case TelephonyManager.CALL_STATE_OFFHOOK:
	               // result+=" �绰�������� ";
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
