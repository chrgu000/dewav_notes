package xzx.xzx;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.util.Log;

public class MyService extends Service {

	private static final String TAG ="Service";
	


   public void onCreate()
   {
	   Log.v(TAG,"on create");
	   super.onCreate();
   }
	
   public void onDestroy()
   {
	   Log.v(TAG,"on Destroy");
	   super.onDestroy();
   }
	
   public void onStart(Intent intent,int startId)
   {
	   Log.v(TAG,"on Start");
	   super.onStart(intent,startId);
   }
   
   private MyBinder myBinder = new MyBinder();
	public IBinder onBind(Intent arg0) {
		return null;
	}
	 public void onRebind(Intent intent){
		   Log.v(TAG,"onUnbind");
		   super.onRebind(intent);
	   }
   public boolean onUnbind(Intent intent){
	   Log.v(TAG,"onUnbind");
	   return super.onUnbind(intent);
   }
   
   public class MyBinder extends Binder
   {
	   MyService getService()
	   {
		   return MyService.this;
	   }
   }
   
}
