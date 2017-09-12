package handler.runnable;


import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class HandlerActivity extends Activity implements OnClickListener{
    /** Called when the activity is first created. */
  
    Handler handler = new Handler();
    RunToast  runToast;
    private  static int countNum =0;
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        TextView count =(TextView)findViewById(R.id.textCount);
        count.setText(Integer.toString(countNum));
        Button btnStart=(Button)findViewById(R.id.btnStart);
        Button btnStop=(Button)findViewById(R.id.btnStop);
        btnStart.setOnClickListener(this);
        btnStop.setOnClickListener(this);
        runToast=new RunToast(this);
    }
    
    public void onClick(View view)
    {
    	switch(view.getId())
    	{
    	case R.id.btnStart:
    		handler.postAtTime(runToast
    		, (android.os.SystemClock.uptimeMillis()+15*1000));
    		countNum++;
    		 TextView count =(TextView)findViewById(R.id.textCount);
    		 count.setText(Integer.toString(countNum));
    		break;
    	case R.id.btnStop:
    		handler.removeCallbacks(runToast);
    		break;
    	}
    	
 
    }
    
    class RunToast implements Runnable
    {
    	private Context context;
    	public RunToast(Context context)
    	{
    		
    		this.context=context;
    		
    	}
    	public void run()
    	{
    		Toast.makeText(context, "15秒后显示Toast信息", Toast.LENGTH_LONG).show();
    	}
    	
    }
    
    
}