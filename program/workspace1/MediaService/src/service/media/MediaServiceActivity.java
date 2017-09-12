package service.media;



import android.app.Activity;
import android.view.View.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MediaServiceActivity extends Activity implements OnClickListener{
    /** Called when the activity is first created. */
	private static final String TAG = "PlayMusic";    
	private Button playBtn;     private Button stopBtn;   
	private Button pauseBtn;     private Button exitBtn;    
	private Button closeBtn; 
	

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        
        Button playBtn=(Button)findViewById(R.id.play);
        Button stopBtn=(Button)findViewById(R.id.stop);
        Button pauseBtn=(Button)findViewById(R.id.pause);
        Button closeBtn=(Button)findViewById(R.id.close);
        Button exitBtn=(Button)findViewById(R.id.exit);
        
        playBtn.setOnClickListener(this);
        stopBtn.setOnClickListener(this);
        pauseBtn.setOnClickListener(this);
        closeBtn.setOnClickListener(this);
        exitBtn.setOnClickListener(this);
        
    }
    
    public void onClick(View v)
	{
		int op = -1;
		//Intent intent = new Intent("org.allin.android.musicService");
		Intent serviceIntent =new Intent(this,MusicService.class);
		switch(v.getId())
		{
		case R.id.play:
			op=1;
			break;
		case R.id.stop:
			op=2;
			break;	
		case R.id.pause:
			op=3;
			break;		
		case R.id.close:
			this.finish();
			op=5;
			break;		
		case R.id.exit:
			op=4;
			stopService(serviceIntent);
			this.finish();
			break;		
		
		}
		
        Bundle bundle  = new Bundle();     
        bundle.putInt("op", op);    
        serviceIntent.putExtras(bundle);       
        startService(serviceIntent); 
	}
    
}