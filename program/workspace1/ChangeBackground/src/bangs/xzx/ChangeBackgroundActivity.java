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
	        stopImage.setEnabled(false);//�տ�ʼ��ʾΪfalse 
	        startImage.setOnClickListener(this);//���� 
	        stopImage.setOnClickListener(this); 
	    } 
	  
	    @Override
	    public void onClick(View v) { 
	        //��÷��� 
	        AlarmManager alarmManager = (AlarmManager) getSystemService(Context.ALARM_SERVICE); 
	        //���� 
	        PendingIntent pendingIntent = PendingIntent.getService(this, 0, 
	                new Intent(this, ChangeBackground.class), 0); 
	          
	        switch (v.getId()) 
	        {   //��ť�¼� ��ʼ��������ͼƬ 
	            case R.id.statrImage: 
	                alarmManager.setRepeating(AlarmManager.RTC, 0, 5000, 
	                        pendingIntent);              
	                startImage.setEnabled(false); 
	                stopImage.setEnabled(true); 
	                break; 
	                //��ť�¼�ֹͣͼƬ���� 
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