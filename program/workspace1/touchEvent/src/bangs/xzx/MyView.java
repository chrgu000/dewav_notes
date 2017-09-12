package bangs.xzx;

import android.content.Context;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.Button;

public class MyView extends Button{

	public MyView(Context context){
		super(context);
	}
	
	public boolean onTouchEvent(MotionEvent event){
	      Log.e(TouchEventActivity.TAG, "MyView onTouchEvent.");  
	        Log.e(TouchEventActivity.TAG,"MyView onTouchEvent default return "   
	        + super.onTouchEvent(event));  
	        return super.onTouchEvent(event);  

	}
}
