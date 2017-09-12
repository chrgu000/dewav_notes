package com.example.testdrawline;



import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;
import android.support.v7.app.ActionBarActivity;
import android.app.Service;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.Display;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

public class DrawLinesActivity2 extends ActionBarActivity {
	private DrawLineView drawLineView;
	private boolean isExitActivity = false;
	private int countNumber = 0; //计算画了多少条线
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.draw_lines_activity2);
	
		drawLineView = (DrawLineView) findViewById(R.id.drawLineView);
		isExitActivity = false;
		countNumber = 0;
		
		new DrawLinesThread().start();
	}

	
    private class DrawLinesThread extends Thread {  
        @Override  
        public void run() {  
        	super.run();
            while (true){
            	countNumber++;
            	if (countNumber == 1000){  //画满一千条,休眠一秒后重新画
            		drawLineView.clear();
            		countNumber = 0;
            		try {
    					Thread.sleep(1000);
    				} catch (InterruptedException e) {
    					// TODO Auto-generated catch block
    					e.printStackTrace();
    				}
            	}
            	
            	drawLineView.postInvalidate();
            	
            	try {
					Thread.sleep(10);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	
            	if (isExitActivity){
            		return;
            	}
            }
            
        }  
    }  
    
    protected void onDestroy() {
		// TODO Auto-generated method stub
		super.onDestroy();
		isExitActivity = true;
	}
}
