package bangs.xzx;

import java.io.InputStream; 

import android.app.Service; 
import android.content.Intent; 
import android.os.IBinder; 
import android.util.Log; 
  
public class ChangeBackground extends Service { 
private static final String TAG="ChangeBackground"; 
    private static int index = 0;//数组元素从0开始 
    //图片数组 
    private int[] resIds = new int[] { R.raw.one, R.raw.two, R.raw.three, 
            R.raw.four, R.raw.five, R.raw.six, R.raw.seven}; 
  
      
    @Override 
    public void onStart(Intent intent, int startId) { 
        if(index==7) 
            index=0; 
            InputStream inputStream=getResources().openRawResource(resIds[index++]);//得到资源图片的元素 
            try { 
            	//setBackgroundResource();
                setWallpaper(inputStream);//显示图片 
            } catch (Exception e) { 
                Log.i(TAG, e.toString());//查看错误信息 
            } 
          
          
          
        super.onStart(intent, startId); 
          
    } 
//创建 
  
    @Override
    public void onCreate() { 
      
        super.onCreate(); 
    } 
  
  
    @Override
    public IBinder onBind(Intent arg0) { 
  
        return null; 
    } 
  
}

