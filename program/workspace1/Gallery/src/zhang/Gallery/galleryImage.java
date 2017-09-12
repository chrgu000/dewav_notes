package zhang.Gallery;


import android.content.Context;
import android.content.res.TypedArray;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;

public class galleryImage extends Activity {
	private Gallery gallery;
	ImageView imageView=null;
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		 //无title     
    	requestWindowFeature(Window.FEATURE_NO_TITLE);    
    	 //全屏     
    	getWindow().setFlags(WindowManager.LayoutParams. FLAG_FULLSCREEN ,      
    	               WindowManager.LayoutParams. FLAG_FULLSCREEN);  
		
		setContentView(R.layout.gallery);
		gallery = (Gallery) findViewById(R.id.gallery);
		gallery.setAdapter(new ImageAdapter(this));
		
		imageView=(ImageView)findViewById(R.id.imageview1);
			if(imageIndex<0)
			imageIndex=0;
		imageView.setImageResource(myLImageIds[imageIndex]);
		// 设置一个itemClicklistener并Toast被单击图片的位置
		gallery.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> arg0, View v, int position,
					long id) {
				// TODO Auto-generated method stub
				imageView.setImageResource(myLImageIds[position]);
				/*
				Toast.makeText(
						galleryImage.this,
						getString(R.string.my_gallery) + position
								+ getString(R.string.my_gallery_text),
						Toast.LENGTH_SHORT).show();
						*/
			}

		});
	}
	public class ImageAdapter extends BaseAdapter {
		// 声明一个变量
		int mGalleryItemBackGround;
		private Context mContext;
		public ImageAdapter(Context c) {
			mContext = c;
			// 实用布局文件中的Gallery属性
			TypedArray a = obtainStyledAttributes(R.styleable.Gallery);
			// 取得gallery属性饿index id
			mGalleryItemBackGround = a.getResourceId(
					R.styleable.Gallery_android_galleryItemBackground, 0);
			// 让对象的styleable属性能反复实用
			a.recycle();
		}
		public int getCount() {//返回数组长度
			// TODO Auto-generated method stub
			return myImageIds.length;
		}
		public Object getItem(int position) {
			return position;
		}
		public long getItemId(int position) {//得到图片ID
			imageIndex=position;
			return position;
		}
		public View getView(int position, View converView, ViewGroup parent) {
			ImageView i = new ImageView(mContext);
			i.setImageResource(myImageIds[position]);
			i.setScaleType(ImageView.ScaleType.FIT_XY);//重新设置图片的宽高
			i.setLayoutParams(new Gallery.LayoutParams(130, 80));//设置layout的宽高
			i.setBackgroundResource(mGalleryItemBackGround);//设置背景
			return i;//返回对象
		}

	}
	private int  imageIndex=0;
	private Integer[] myImageIds = { R.drawable.i1, R.drawable.i2,
			R.drawable.i3, R.drawable.i4, };
	
	private Integer[] myLImageIds = { R.drawable.wall1, R.drawable.wall2,
			R.drawable.wall3, R.drawable.wall4, };

}