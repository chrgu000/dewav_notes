package alarm.main;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.widget.TimePicker;

public class AlarmMainActivity extends Activity implements OnClickListener{
    /** Called when the activity is first created. */
	private TextView tvAlarmRecord;
	private SharedPreferences sharedPreferences;
    
    
    public void onClick(View v)
    {
    	View view = getLayoutInflater().inflate(R.layout.alarm, null);
    	final TimePicker timePicker=(TimePicker)
    	view.findViewById(R.id.timepicker);
    	timePicker.setIs24HourView(true);
    	 //  ��ʾ����ʱ���ĶԻ���  
    	new AlertDialog.Builder(this).setTitle("��������ʱ��").setView(view)
    	.setPositiveButton("ȷ��",
    	new	DialogInterface.OnClickListener() 
    	{
			
			public void onClick(DialogInterface dialog, int which) 
			{
				String timeStr =String.valueOf(timePicker
						.getCurrentHour())+":"
						+String.valueOf(timePicker.getCurrentMinute()
				);
				 //  ��ʱ�����ӵ�TextView�����  
				tvAlarmRecord.setText
				(tvAlarmRecord.getText().toString()+"\n"+timeStr);
			//  ����ʱ���  
				sharedPreferences.edit().
				putString(timeStr, timeStr).commit();
			}
		}).setNegativeButton("ȡ��",null).show();	
    			
 
    }
    
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        Button btnAddAlarm=(Button)findViewById(R.id.btnAddAlarm);
        tvAlarmRecord=(TextView)findViewById(R.id.tvAlarmRecord);
        btnAddAlarm.setOnClickListener(this);
        sharedPreferences=getSharedPreferences("alarm_record",
        		Activity.MODE_PRIVATE);
        AlarmManager alarmManager=(AlarmManager)
        getSystemService(Context.ALARM_SERVICE);
        Intent intent = new Intent(this,AlarmReceiver.class);
    //  ������װBroadcastReceiver��pendingIntent����  
        PendingIntent pendingIntent=PendingIntent.getBroadcast(this, 0, intent, 0);
        //  ��ʼ��ʱ����ÿ1����ִ��һ��  
        alarmManager.setRepeating(AlarmManager.RTC, 0, 10*1000, pendingIntent);
    }
}