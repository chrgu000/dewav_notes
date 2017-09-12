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

public class DrawLinesActivity extends ActionBarActivity {
	Button buttonDarwLines = null;
	 private int start_x;//声明起点坐标
	 private int start_y;
	 private Paint paint;//声明画笔
	 private Canvas canvas;//画布
	 private Bitmap bitmap;//位图
	 private int blcolor;
	 private LinearLayout mylayout;
	 private int heightOfContent;
	 private int WidthOfContent;
	 Drawable drawable = null;
	 private Set<Integer> setX = null; 
	 private Set<Integer> setY = null; 
	 private Set<Integer> setC = null; 
	 private Iterator<Integer> itX = null;
	 private Iterator<Integer> itY = null;
	 private Random randomC = new Random(5);
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		 setContentView(R.layout.draw_lines_activity);
		 mylayout = (LinearLayout)findViewById(R.id.DrawLinesLayout);
		 Display display = getWindowManager().getDefaultDisplay();
		 WindowManager wm = (WindowManager) getApplicationContext()
                 .getSystemService(getApplicationContext().WINDOW_SERVICE);
		 heightOfContent = wm.getDefaultDisplay().getHeight();
		 WidthOfContent = wm.getDefaultDisplay().getWidth();
		 Log.i("alex","heightOfContent"+heightOfContent);
		 Log.i("alex","WidthOfContent"+WidthOfContent);
		 start_x = WidthOfContent/2;
		 start_y = heightOfContent/2 + heightOfContent/4;
		 setRandomXYC();
		 initCanvas(); 
		 new WorkThread().start(); 

		 new WorkThread2().start(); 
	}

	 public void setRandomXYC(){
		 int i = 0;
		 Random randomX = new Random(5);
		 Random randomY = new Random(6);
		 setX = new HashSet<Integer>();
		 for (i = 0; i<50000; i++){
			 setX.add(randomX.nextInt(WidthOfContent));
			 if (setX.size() == 1000) {
				 Log.i("alex","break1");
				 break;
			 }
		 }
		 
		 setY = new HashSet<Integer>();
		 for (i = 0; i<50000; i++){
			 setY.add(randomY.nextInt(heightOfContent));
			 if (setY.size() == 1000) {
				 Log.i("alex","setY"+setY);
				 break;
			 }
		 }
		 
	 }
	 public void initCanvas(){
		  paint=new Paint(Paint.DITHER_FLAG);//创建一个画笔
		  bitmap = Bitmap.createBitmap(WidthOfContent, heightOfContent, Bitmap.Config.ARGB_8888); //设置位图的宽高
		  canvas=new Canvas();
		  canvas.setBitmap(bitmap);
		 
		  paint.setStyle(Style.STROKE);//设置非填充
		  paint.setStrokeWidth(1);//笔宽1像素
		  paint.setColor(Color.RED);//设置为红笔
		  paint.setAntiAlias(true);//锯齿不显示
		  drawable = new BitmapDrawable(bitmap) ;
	 }
	 

	 public void DrawLines() {
		 itX = setX.iterator();
		 itY = setY.iterator();
	
		 for (int i = 0; i<500; i++){
			 Integer x = itX.next();
			 Integer y = itY.next();
			 DrawLine(x.intValue(), y.intValue());
		 }
		 mylayout.setBackgroundDrawable(drawable);
	 }
	 
	 private int [] color = {Color.BLACK, Color.DKGRAY, Color.GRAY, Color.GREEN, Color.BLUE, Color.YELLOW,
			 Color.CYAN,  Color.MAGENTA,  Color.RED
	 };
			 
	 public void DrawLines_ext() {
		 itX = setX.iterator();
		 itY = setY.iterator();
		 Integer x = null;
		 Integer y = null;
		 int i = 0;
		 for (i = 0; i<500; i++){
			 if (itX.hasNext()) {
				 x = itX.next();
			 }
			 
			 if (itY.hasNext()) {
				 y = itY.next();
			 }
			 if (i >= 500){
				 paint.setStrokeWidth(5);//笔宽1像素
				 DrawLine(x.intValue(), y.intValue()); 
			 }
		 }
		 
		 mylayout.setBackgroundDrawable(drawable);
	 }			 
	

	 
	 public void DrawLine(int x, int y) {
		  int index = randomC.nextInt(9);
		  Log.i("alex","index:"+index);
		  paint.setColor(color[index]);
		  canvas.drawLine(start_x,start_y,x,y,paint);
	 }
	 
	 
     private Handler handler = new Handler() {  
         @Override  
         public void handleMessage(Message msg) {  
             if (msg.what == 0) {  
            	 DrawLines();
             } else if (msg.what == 1) {
            	 DrawLines_ext();
            	 //DrawLines();
             }
         }  
     };  
		
     private class WorkThread extends Thread {  
         @Override  
         public void run() {  
             Message msg = new Message();  
             msg.what = 0;  
             handler.sendMessage(msg);  
         }  
     }  
     
     private class WorkThread2 extends Thread {  
         @Override  
         public void run() {    
             Message msg = new Message();  
             msg.what = 1;  
             handler.sendMessage(msg);  
         }  
     } 
     
     protected void onDestroy() {
    	    super.onDestroy();
    	    bitmap.recycle();
    }
}
