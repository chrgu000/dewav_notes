package bangs.xzx;




import android.app.Activity;  
import android.os.Bundle;  
import android.util.Log;  
import android.view.GestureDetector;  
import android.view.GestureDetector.OnGestureListener;  
import android.view.MotionEvent;  
import android.widget.ViewFlipper;  
  
public class ViewFlipperActivity extends Activity implements OnGestureListener{  
    private static final String TAG = "ViewFlipperActivity";  
    private ViewFlipper viewFlipper;  
    private GestureDetector detector;  
    @Override  
    public void onCreate(Bundle savedInstanceState) {  
        super.onCreate(savedInstanceState);  
        setContentView(R.layout.main);  
        detector = new GestureDetector(this);  
        viewFlipper = (ViewFlipper) findViewById(R.id.viewFlipper1);  
    }  
  
    @Override  
    public boolean onTouchEvent(MotionEvent event) {  
        Log.v(TAG, "touched");  
        return this.detector.onTouchEvent(event);   
    }  
    public boolean onDown(MotionEvent e) {  
        // TODO Auto-generated method stub  
        return false;  
    }  
  
    public void onShowPress(MotionEvent e) {  
        // TODO Auto-generated method stub  
          
    }  
  
    public boolean onSingleTapUp(MotionEvent e) {  
        // TODO Auto-generated method stub  
        return false;  
    }  
  
    public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX,  
            float distanceY) {  
        // TODO Auto-generated method stub  
        return false;  
    }  
  
    public void onLongPress(MotionEvent e) {  
        // TODO Auto-generated method stub  
          
    }  
  
    public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX,  
            float velocityY) {  
        Log.i(TAG, "fling¡­");   
        if(e1.getX()>e2.getX()){  
            viewFlipper.showNext();  
        }else if(e1.getX()<e2.getX()){  
            viewFlipper.showPrevious();  
        }else {  
            return false;  
        }  
        return true;  
    }  
}  