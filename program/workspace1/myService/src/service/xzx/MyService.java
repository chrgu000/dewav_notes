package service.xzx;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;

public class MyService extends Service {


	private MyBinder myBinder = new MyBinder();
	public IBinder onBind(Intent arg0) {
		// TODO Auto-generated method stub

		return myBinder;
	}
public void onRebind(Intent intent)
{
	super.onRebind(intent);

}
	
public boolean onUnbind(Intent intent)
{
	return super.onUnbind(intent);

}

public void onCreate()
{
	super.onCreate();

}
public void onDestroy()
{
	super.onDestroy();

}

public void onStart(Intent intent,int startId)
{
	super.onStart(intent, startId);
}

public class MyBinder extends Binder
{
	MyService getService()
	{
		
		return MyService.this;
	}
}

}
