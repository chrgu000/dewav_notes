package bangs.xzx;


import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;


public class ChangeBackgroundActivity extends Activity implements OnClickListener{
	 private Button startImage; 
	    private Button stopImage; 
	      
	      
	    @Override
	    public void onCreate(Bundle savedInstanceState) { 
	        super.onCreate(savedInstanceState); 
	        setContentView(R.layout.main); 
	          
	          
	        startImage=(Button)findViewById(R.id.statrImage); 
	        stopImage=(Button)findViewById(R.id.stopImage); 
	        stopImage.setEnabled(false);//刚开始显示为false 
	        startImage.setOnClickListener(this);//绑定器 
	        stopImage.setOnClickListener(this); 
	    } 
	  
	    @Override
	    public void onClick(View v) { 
	        //获得服务 
	        AlarmManager alarmManager = (AlarmManager) getSystemService(Context.ALARM_SERVICE); 
	        //启动 
	        PendingIntent pendingIntent = PendingIntent.getService(this, 0, 
	                new Intent(this, ChangeBackground.class), 0); 
	          
	        switch (v.getId()) 
	        {   //按钮事件 开始更换背景图片 
	            case R.id.statrImage: 
	                alarmManager.setRepeating(AlarmManager.RTC, 0, 5000, 
	                        pendingIntent);              
	                startImage.setEnabled(false); 
	                stopImage.setEnabled(true); 
	                break; 
	                //按钮事件停止图片更换 
	            case R.id.stopImage: 
	                alarmManager.cancel(pendingIntent); 
	                startImage.setEnabled(true); 
	                stopImage.setEnabled(false); 
	                changeBackground();
	                break; 
	        }    
	          
	          
	          
	    } 
	    
	   public void  changeBackground(){
		    Context mContext =ChangeBackgroundActivity.this;
	    	//LayoutInflater inflater =getLayoutInflater();
	    	LayoutInflater inflater=(LayoutInflater)
	    	mContext.getSystemService(LAYOUT_INFLATER_SERVICE);
	    	View layout = inflater.inflate(R.layout.main,null);
	    	layout.setBackgroundResource(R.raw.six);
	    	 setContentView(R.layout.main); 
	   }
	    

}