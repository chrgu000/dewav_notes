package dial.call;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Vibrator;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class DialCallActivity extends Activity {
    /** Called when the activity is first created. */
	private EditText phone=null;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

		ConnectivityManager connManager = (ConnectivityManager) getSystemService(CONNECTIVITY_SERVICE);
        phone=(EditText)this.findViewById(R.id.phone);
        Button button=(Button)this.findViewById(R.id.button);

button.setOnClickListener(new View.OnClickListener(){
			public void onClick(View v) {
			String tel=phone.getText().toString();
			//����һ�� ʹ��IntentĿ�ģ�  ����android���
			//Intent intent=new Intent();
			//intent.setAction("android.intent.action.CALL");
			//intent.setData(Uri.parse("tel:"+tel));
			//������
			if(tel.length()==0)
			{
				
				Toast.makeText(DialCallActivity.this,"������绰����",Toast.LENGTH_SHORT).show();
				return;
				
			}
		    AudioManager mAudioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
			int statusFlag = (mAudioManager.getRingerMode() == AudioManager.RINGER_MODE_SILENT) ? 1: 0; 
                    if(statusFlag==0)
                    	{
                    			mAudioManager.setRingerMode(AudioManager.RINGER_MODE_SILENT);
					Vibrator vibrator = (Vibrator) DialCallActivity.this.getSystemService(Context.VIBRATOR_SERVICE);
					vibrator.vibrate(200);
					Toast.makeText(DialCallActivity.this,"xzx SILENT", 2000).show();
						
                    	}
			else
			{
					mAudioManager.setRingerMode(AudioManager.RINGER_MODE_NORMAL);
					Vibrator vibrator = (Vibrator) DialCallActivity.this.getSystemService(Context.VIBRATOR_SERVICE);
					vibrator.vibrate(200);
					Toast.makeText(DialCallActivity.this,"NO SILENT", 2000).show();
			}
			//Intent intent=new Intent("android.intent.action.CALL", Uri.parse("tel:"+tel));
			//�������ڲ����Զ�Ϊintent�����������:android.intent.category.DEFAULT
			//Intent intent=new Intent("android.intent.action.DIAL", Uri.parse("tel:"+tel));
			//startActivity(intent);
                    
              	 
			}
});


    }
}