package bangs.xzx;




import java.text.DecimalFormat;


import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.TextView;


public class galleryImage extends Activity {
	private Gallery gallery;
	private int galleryImageIndex=0;
	ImageView imageView=null;
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		 //��title     
    	requestWindowFeature(Window.FEATURE_NO_TITLE);    
    	 //ȫ��     
    	getWindow().setFlags(WindowManager.LayoutParams. FLAG_FULLSCREEN ,      
    	               WindowManager.LayoutParams. FLAG_FULLSCREEN);  
		
		setContentView(R.layout.gallery);
		gallery = (Gallery) findViewById(R.id.gallery);
		gallery.setAdapter(new ImageAdapter(this));
		gallery.setSpacing(-21);
		imageView=(ImageView)findViewById(R.id.imageview1);
			if(imageIndex<0)
			imageIndex=0;
		imageView.setImageResource(myLImageIds[imageIndex]);
		
	    Button button1=(Button)findViewById(R.id.setWallPaper);
        button1.setOnClickListener(calcBMI);
        button1.setText(getString(R.string.activate_lockscreen_bg));
        button1.setTextSize(12);
		//imageView.setScaleType(ImageView.ScaleType.CENTER);
		// ����һ��itemClicklistener��Toast������ͼƬ��λ��
		gallery.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> arg0, View v, int position,
					long id) {
				// TODO Auto-generated method stub
				imageView.setImageResource(myLImageIds[position]);
				galleryImageIndex=position;
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
		// ����һ������
		int mGalleryItemBackGround;
		private Context mContext;
		public ImageAdapter(Context c) {
			mContext = c;
			

			// ʵ�ò����ļ��е�Gallery����
			TypedArray a = obtainStyledAttributes(R.styleable.Gallery);
			// ȡ��gallery���Զ�index id
			mGalleryItemBackGround = a.getResourceId(
					R.styleable.Gallery_android_galleryItemBackground, 0);
			// �ö����styleable�����ܷ���ʵ��
			a.recycle();
			

		}
		public int getCount() {//�������鳤��
			// TODO Auto-generated method stub
			return myImageIds.length;
		}
		public Object getItem(int position) {
			return position;
		}
		public long getItemId(int position) {//�õ�ͼƬID
			imageIndex=position;
			return position;
		}
		public View getView(int position, View converView, ViewGroup parent) {
			
			ImageView i = new ImageView(mContext);
			i.setImageResource(myImageIds[position]);
			i.setScaleType(ImageView.ScaleType.FIT_XY);//��������ͼƬ�Ŀ��
			i.setLayoutParams(new Gallery.LayoutParams(180,130));//����layout�Ŀ��
			i.setBackgroundResource(mGalleryItemBackGround);//���ñ���
			return i;//���ض���
			
			/*
			ImageView i = new ImageView(mContext);

	            i.setImageResource(myImageIds[position]);
	            i.setAdjustViewBounds(true);
	            i.setLayoutParams(new Gallery.LayoutParams(20, 160));
	            
	            i.setBackgroundResource(R.drawable.picture_frame);
	            return i;
	            */
		}
  
	}
	
	private OnClickListener calcBMI = new OnClickListener()
    {
    	public void onClick(View v)
    	{
    		
    		BitmapLockScrActivity.imageIndex=galleryImageIndex;
    		galleryImage.this.finish();

    	}
    };
	
	private int  imageIndex=0;
	private Integer[] myImageIds = { R.drawable.i1, R.drawable.i2,
			R.drawable.i3, R.drawable.i4, R.drawable.i5, R.drawable.i6, 
			R.drawable.i7, R.drawable.i8, R.drawable.i9, R.drawable.i10, 
			
	};
	
	private Integer[] myLImageIds = { R.drawable.wall1, R.drawable.wall2,
			R.drawable.wall3, R.drawable.wall4,R.drawable.wall5,R.drawable.wall6,
			R.drawable.wall7,R.drawable.wall8,R.drawable.wall9,R.drawable.wall10,
	};

		public void onAttachedToWindow() {
		this.getWindow().setType(WindowManager.LayoutParams.TYPE_KEYGUARD_DIALOG);
	    super.onAttachedToWindow();
  }
}