package com.example.testdrawline;



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
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

public class MainActivity extends ActionBarActivity {
	Button buttonDarwLines = null;
	 private int mov_x;//声明起点坐标
	 private int mov_y;
	 private Paint paint;//声明画笔
	 private Canvas canvas;//画布
	 private Bitmap bitmap;//位图
	 private int blcolor;
	 private LinearLayout mylayout;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		buttonDarwLines = (Button)findViewById(R.id.drawLines);
		 mylayout = (LinearLayout)findViewById(R.id.myLayout);
		buttonDarwLines.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				//Drawl();
				 Intent intent = new Intent(); 
		         intent.setClass(MainActivity.this, DrawLinesActivity2.class);
		         MainActivity.this.startActivity(intent);
			}
		});
	}

	 public void Drawl() {
		 
		  paint=new Paint(Paint.DITHER_FLAG);//创建一个画笔
		  bitmap = Bitmap.createBitmap(480, 854, Bitmap.Config.ARGB_8888); //设置位图的宽高
		  canvas=new Canvas();
		  canvas.setBitmap(bitmap);
		 
		  paint.setStyle(Style.STROKE);//设置非填充
		  paint.setStrokeWidth(5);//笔宽5像素
		  paint.setColor(Color.RED);//设置为红笔
		  paint.setAntiAlias(true);//锯齿不显示
		  canvas.drawLine(1,3,100,600,paint);
		  
		  Drawable drawable = new BitmapDrawable(bitmap) ;  
		  mylayout.setBackgroundDrawable(drawable);
	 }
}
