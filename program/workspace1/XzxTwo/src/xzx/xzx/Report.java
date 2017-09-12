package xzx.xzx;

import java.text.DecimalFormat;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;


public class Report extends Activity {
	private static final String TAG ="Bmi";
	

	public void onCreate()
	{
	//	super.onCreate(...);
		Log.v(TAG,"on create");
	}
	public void onStart()
	{
		super.onStart();
		Log.v(TAG,"on start");
	}
	
	public void onResume()
	{
		super.onStart();
		Log.v(TAG,"on resume");
	}
	
	public void onPause()
	{
		super.onStart();
		Log.v(TAG,"on pause");
	}
	
	public void onStop()
	{
		super.onStart();
		Log.v(TAG,"on stop");
	}
	
	public void onRestart()
	{
		super.onStart();
		Log.v(TAG,"on start");
	}
	
	
	public void onDestroy()
	{
		super.onStart();
		Log.v(TAG,"on destroy");
	}
	
	 Intent serviceIntent;	
public void onCreate(Bundle savedInstanceState)
{
	super.onCreate(savedInstanceState);
	setContentView(R.layout.report);
	
	serviceIntent = new Intent(this,MyService.class);
	bindService(serviceIntent, serviceConnection, Context.BIND_AUTO_CREATE); 
	startService(serviceIntent);
	
	findViews();
	showResults();
	setListensers();
}


private TextView view_result;
private TextView view_suggest;
private Button button_back;
private Button button_startService;
private Button button_stopService;
private void setListensers(){
	button_back.setOnClickListener(backMain);
	button_startService.setOnClickListener(startService);
	button_stopService.setOnClickListener(stopService);
}

AlarmManager alarmManager;
PendingIntent pendingActivityIntent;
private void AlarmManagerFunction()
{
	Intent intent =new Intent(this 	,XzxTwoActivity.class);
	 pendingActivityIntent=PendingIntent.getActivity(this, 0, intent, 0);
     alarmManager=(AlarmManager)
     getSystemService(Context.ALARM_SERVICE);
     alarmManager.setRepeating(AlarmManager.RTC,0,10000,pendingActivityIntent);
     alarmManager.cancel(pendingActivityIntent);
}

private void StopAlarmManager()
{
	
}

private Button.OnClickListener startService = new Button.OnClickListener()
{
	
	public void onClick(View v)
	{
		
		AlarmManagerFunction();
	}
};


private Button.OnClickListener stopService = new Button.OnClickListener()
{
	public void onClick(View v)
	{
		StopAlarmManager();
	}
};


private Button.OnClickListener backMain = new Button.OnClickListener()
{
	public void onClick(View v)
	{
		//stopService(serviceIntent);
		Report.this.finish();
	}
};

private void findViews()
{
	button_back=(Button)findViewById(R.id.report_back);
	button_startService=(Button)findViewById(R.id.btnStartService);
	button_stopService=(Button)findViewById(R.id.btnStopService);
	view_result=(TextView)findViewById(R.id.result);
	view_suggest=(TextView)findViewById(R.id.suggest);
}







private void showResults(){
	DecimalFormat nf = new DecimalFormat("0.00");
	
	Bundle bunde = this.getIntent().getExtras();
	double height =Double.parseDouble(bunde.getString("KEY_HEIGHT"))/100;
	double weight =Double.parseDouble(bunde.getString("KEY_WEIGHT"))/100;
	double BMI=weight/(height*height);
	view_result.setText(getString(R.string.bmi_result)+nf.format(BMI));
	
	//Give health advice
	if(BMI>25){
	view_suggest.setText(R.string.advice_heavy);
	}else if(BMI<20){
		view_suggest.setText(R.string.advice_light);	
	}else{
		view_suggest.setText(R.string.advice_average);	
	}


}

private MyService myService;
	private ServiceConnection serviceConnection = new ServiceConnection()
	{
		public void onServiceDisconnected(ComponentName name)
		{
			myService = null;
			Toast.makeText(Report.this, "service failed.", Toast.LENGTH_LONG)
			.show();
		}
		
		public void onServiceConnected(ComponentName name,IBinder service)
		{
			myService =((MyService.MyBinder)service).getService();
			Toast.makeText(Report.this, "servoce connected", Toast.LENGTH_LONG)
			.show();
		}
	};

}
