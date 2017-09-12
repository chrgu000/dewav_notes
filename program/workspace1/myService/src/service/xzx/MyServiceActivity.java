package service.xzx;


import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MyServiceActivity extends Activity implements OnClickListener{
    /** Called when the activity is first created. */

    Intent serviceIntent;
    
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        Button btnStart=(Button)findViewById(R.id.btnStart);
        Button btnStop=(Button)findViewById(R.id.btnStop);
        Button btnBind=(Button)findViewById(R.id.btnBind);
        Button btnUnbind=(Button)findViewById(R.id.btnUnbind);
        btnStart.setOnClickListener(this);
        btnStop.setOnClickListener(this);
        btnBind.setOnClickListener(this);
        btnUnbind.setOnClickListener(this);
        serviceIntent =new Intent(this,MyService.class);
        
        
    }
    
    public void onClick(View view)
    {
    	switch(view.getId())
    	{
    	case R.id.btnStart:
    		startService(serviceIntent);
    		break;
    	case R.id.btnStop:
    		stopService(serviceIntent);
    		break;
    	case R.id.btnBind:
    	    bindService(serviceIntent,serviceConnection,Context.BIND_AUTO_CREATE);
    		break;
    	case R.id.btnUnbind:
        	unbindService(serviceConnection);
    		break;	
    	}
    	
 
    }
    
    private MyService myService;
	private ServiceConnection serviceConnection = new ServiceConnection()
	{
		public void onServiceDisconnected(ComponentName name)
		{
			myService = null;
			Toast.makeText(MyServiceActivity.this, "service failed.", Toast.LENGTH_LONG)
			.show();
		}
		
		public void onServiceConnected(ComponentName name,IBinder service)
		{
			myService =((MyService.MyBinder)service).getService();
			Toast.makeText(MyServiceActivity.this, "service connected", Toast.LENGTH_LONG)
			.show();
		}
	};
}