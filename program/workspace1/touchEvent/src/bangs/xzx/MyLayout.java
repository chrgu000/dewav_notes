package bangs.xzx;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.FrameLayout;

public class MyLayout extends FrameLayout{

	public MyLayout(Context context){
	super(context);
	}
	
	public MyLayout(Context context,AttributeSet attrs){
		super(context,attrs);
	}
	
	
	public boolean onInterceptTouchEvent(MotionEvent ev){
		Log.e(TouchEventActivity.TAG, "MyLayout onInterceptTouchEvent.");  
        Log.e(TouchEventActivity.TAG,"MyLayout onInterceptTouchEvent default return "   
        + super.onInterceptTouchEvent(ev));  
        return super.onInterceptTouchEvent(ev);  
	}
	
    public boolean onTouchEvent(MotionEvent event) {  
        Log.e(TouchEventActivity.TAG, "MyLayout onTouchEvent.");  
        Log.e(TouchEventActivity.TAG,"MyLayout onTouchEvent default return "   
        + super.onTouchEvent(event));  
        return super.onTouchEvent(event);  
    }  

}
