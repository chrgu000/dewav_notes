package com.example.testdrawline;

import java.util.Random;

import android.R;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

public class DrawLineView extends View {
	private Random random = new Random();
	//圆心坐标
	private int startX = 0;  
	private int startY = 0;;
	//画布的宽高
	private int canvasWidth;
	private int canvasHeight;
	//颜色的三色值
	private int r = 0;;
	private int g = 0;;
	private int b = 0;;
	//清空画布flag
	private boolean hasCleaned = false;
	private Canvas tempCanvas = null;
	private Bitmap mBitmap = null;
	Paint paint = new Paint();
	
	public DrawLineView(Context context, AttributeSet attrs, int defStyleAttr) {
		super(context, attrs, defStyleAttr);
	}

	public DrawLineView(Context context, AttributeSet attrs) {
		super(context, attrs);
	}

	public DrawLineView(Context context) {
		super(context);
	}

	public void clear() {
		mBitmap = null;
		hasCleaned = true;
		tempCanvas = null;
	}

	private void drawLine(Canvas canvas){
		if (hasCleaned){
			hasCleaned = false;
		}else{
			tempCanvas.drawLine(startX, startY,
					random.nextInt((int) (canvasWidth)),
					random.nextInt((int) (canvasHeight)), paint);
		}
		
		canvas.drawBitmap(mBitmap, 0, 0, paint);
	}
	
	private void initStatus(Canvas canvas){
		//设置宽高和中心点
		canvasWidth = canvas.getWidth();
		canvasHeight = canvas.getHeight();
		startX = canvasWidth/2;
		startY = canvasHeight/2;
		//设置画笔
		r = random.nextInt(256);
		g = random.nextInt(256);
		b = random.nextInt(256);
		paint.setColor(Color.rgb(r, g, b));
		paint.setStrokeWidth(2f);
		paint.setAntiAlias(true);//锯齿不显示
		//创建一个位图
		if (mBitmap == null) {
			mBitmap = Bitmap.createBitmap(canvasWidth,
					canvasHeight, Bitmap.Config.ARGB_8888);
		}
		
		//创建一个临时画布来操作位图
		if (tempCanvas == null){ 
			tempCanvas = new Canvas(mBitmap);
		}
	}
	@Override
	protected void onDraw(Canvas canvas) {
		super.onDraw(canvas);
		initStatus(canvas);
		drawLine(canvas);
	}
}