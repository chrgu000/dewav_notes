package service.media;

import java.io.IOException;

import android.app.Service;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.IBinder;

public class MusicService extends Service {

	private static final String TAG = "MyService";   
	private MediaPlayer mediaPlayer; 
	
	public IBinder onBind(Intent intent) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void onCreate()
	{
		if(mediaPlayer==null)
		{
			mediaPlayer = MediaPlayer.create(this,R.raw.tmp);
			mediaPlayer.setLooping(false);
		}
	}
	
	public void onDestroy()
	{
		if(mediaPlayer!=null)
		{
			
			mediaPlayer.stop();
			mediaPlayer.release();
		}
	}
	
	public void onStart(Intent intent ,int startId)
	{
		
		if(intent!=null)
		{
			Bundle bundle =intent.getExtras();
			if(bundle!=null)
			{
				int op = bundle.getInt("op");
				switch(op)
				{
				case 1:
					play();
					break;
				case 2:
					stop();
					break;
				case 3:
					pause();
					break;	
				}
			}
			
		}
	}
	
	public void play()
	{
		if(!mediaPlayer.isPlaying())
		{
			mediaPlayer.start();
		}
		
		
	}
	
	public void stop()
	{
		 if (mediaPlayer != null) 
		 { 
			 mediaPlayer.stop(); 
			 try 
			 { 
				 mediaPlayer.prepare(); 
			 }
			 catch (IOException ex) 
			 { 
				 ex.printStackTrace(); 
			 }
			 
		 }
		
	}
	
	public void pause()
	{
		
		 if (mediaPlayer != null && mediaPlayer.isPlaying())
		 {           
			 mediaPlayer.pause();   
		 } 
		
	}
	
}
