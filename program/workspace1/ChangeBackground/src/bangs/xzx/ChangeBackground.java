package bangs.xzx;

import java.io.InputStream; 

import android.app.Service; 
import android.content.Intent; 
import android.os.IBinder; 
import android.util.Log; 
  
public class ChangeBackground extends Service { 
private static final String TAG="ChangeBackground"; 
    private static int index = 0;//����Ԫ�ش�0��ʼ 
    //ͼƬ���� 
    private int[] resIds = new int[] { R.raw.one, R.raw.two, R.raw.three, 
            R.raw.four, R.raw.five, R.raw.six, R.raw.seven}; 
  
      
    @Override 
    public void onStart(Intent intent, int startId) { 
        if(index==7) 
            index=0; 
            InputStream inputStream=getResources().openRawResource(resIds[index++]);//�õ���ԴͼƬ��Ԫ�� 
            try { 
            	//setBackgroundResource();
                setWallpaper(inputStream);//��ʾͼƬ 
            } catch (Exception e) { 
                Log.i(TAG, e.toString());//�鿴������Ϣ 
            } 
          
          
          
        super.onStart(intent, startId); 
          
    } 
//���� 
  
    @Override
    public void onCreate() { 
      
        super.onCreate(); 
    } 
  
  
    @Override
    public IBinder onBind(Intent arg0) { 
  
        return null; 
    } 
  
}

