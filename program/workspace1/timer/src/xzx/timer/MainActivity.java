package xzx.timer;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import java.util.Timer;  
import java.util.TimerTask;  
  
import android.os.Bundle;  
import android.os.Handler;  
import android.os.Message;  

public class MainActivity extends Activity {
	private int i = 1;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		  timer.schedule(task, 10000);  
		  //timer.schedule(task, 10000); 
		  //timer.schedule(task, 10000); 
	}

	
	      
         Timer timer = new Timer();  
         Handler handler = new Handler(){  
      
            public void handleMessage(Message msg) {  
                switch (msg.what) {      
                case 1:      
                	if (i == 0)
                	{
                    	setTitle("hear me?");  
                    	i = 1;
                	}
                	else
                	{
                		setTitle("xzx"); 
                		i = 0;
                	}
                    break;      
                 }      
                super.handleMessage(msg);  
             }  
              
         };  
        TimerTask task = new TimerTask(){  
      
            public void run() {  
            	//setTitle("xzx");
                 Message message = new Message();      
                 message.what = 1;      
                 handler.sendMessage(message);    
             }  
              
         };  
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
