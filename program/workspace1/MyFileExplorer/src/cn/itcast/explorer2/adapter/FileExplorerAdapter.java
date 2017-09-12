package cn.itcast.explorer2.adapter;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import cn.itcast.explorer2.R;
import cn.itcast.explorer2.utils.ApkUtil;
import cn.itcast.explorer2.utils.AsyncLoadImage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Parcelable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class FileExplorerAdapter extends BaseAdapter implements OnScrollListener{

	private static final String TAG = "FileExplorerAdapter";
	
	private Context context;
	private File[] listFiles;
	private LayoutInflater inflater;
	private AsyncLoadImage asyncLoadImage;
	private ListView listView;
	public static  Parcelable state;
	private Map<Integer,Boolean> isSelected;
	
	public FileExplorerAdapter(Context context,File[] listFiles,ListView listView) {
		this.context = context;
		this.listFiles = listFiles;
		inflater = LayoutInflater.from(context);
		asyncLoadImage = new AsyncLoadImage(context, new Handler());
		listView.setOnScrollListener(this);
		this.listView = listView;
		
		init();
	}
	
	public void init(){
		isSelected = new HashMap<Integer, Boolean>();
		for (int i = 0;i< listFiles.length ; i ++ ) {
			isSelected.put(i, false);
		}
		
	}
	
	public void update(File[] listFiles) {
		this.listFiles = listFiles;
		notifyDataSetChanged();
	}
	
	@Override
	public int getCount() {
		return this.listFiles == null ? 0 : this.listFiles.length;
	}

	@Override
	public Object getItem(int position) {
		return position;
	}

	@Override
	public long getItemId(int position) {
		return position;
	}

	@Override
	public View getView(final int position, View convertView, ViewGroup parent) {
		
		ViewHolder holder = null;
		
		if (convertView == null) {
			holder = new ViewHolder();
			convertView = inflater.inflate(R.layout.file_item, null);
			holder.fileIcon = (ImageView) convertView.findViewById(R.id.file_icon);
			holder.fileName = (TextView) convertView.findViewById(R.id.file_name);
			holder.cb = (CheckBox) convertView.findViewById(R.id.checkbox);
			convertView.setTag(holder);
		} else {
			holder = (ViewHolder) convertView.getTag();
		}
		//具体如何展示数据
		//目录的显示处理
		 if (listFiles[position].isDirectory()) {
			 //1.文件夹有两种情况，空文件夹和非空文件夹
			 if (listFiles[position].listFiles().length == 0 && listFiles[position].listFiles() == null) {
				 holder.fileIcon.setImageResource(R.drawable.folder);
				 holder.fileName.setText(listFiles[position].getName());
			 } else {//有文件的文件夹
				 holder.fileIcon.setImageResource(R.drawable.folder_);
				 holder.fileName.setText(listFiles[position].getName());
			 }
		 } else {//文件的处理
			 String fileName = listFiles[position].getName().toLowerCase();
			 
			 if (listFiles[position].getName().endsWith(".txt")) {//文本的显示
				 
				 holder.fileIcon.setImageResource(R.drawable.text);
				 holder.fileName.setText(fileName);
				 
			 } else if (fileName.endsWith(".html") || fileName.endsWith(".xml")){
				 holder.fileIcon.setImageResource(R.drawable.html);
				 holder.fileName.setText(fileName);
			 } else if (fileName.endsWith(".xls")){
				 holder.fileIcon.setImageResource(R.drawable.excel);
				 holder.fileName.setText(fileName);
			 } else if (fileName.endsWith(".3gp") 
					 || fileName.endsWith(".mp4")){
				 holder.fileIcon.setImageResource(R.drawable.format_media);
				 holder.fileName.setText(fileName);
				 
			 }else if (fileName.endsWith(".flv")){
				 holder.fileIcon.setImageResource(R.drawable.format_flash);
				 holder.fileName.setText(fileName);
			 }  else if (fileName.endsWith(".apk")){//加载APK的图标
				 Drawable drawable = ApkUtil.loadApkIcon(context, listFiles[position].getAbsolutePath());
				 holder.fileIcon.setImageDrawable(drawable);
				 holder.fileName.setText(fileName);
			 } else if (fileName.endsWith(".mp3")
					 || fileName.endsWith(".ogg")
					 || fileName.endsWith(".wma")
					 || fileName.endsWith(".ape")){
				 
				 holder.fileIcon.setImageResource(R.drawable.excel);
				 holder.fileName.setText(fileName);
				 
			 }else if (fileName.endsWith(".jpg")
			 
					 || fileName.endsWith(".jpeg")
					 || fileName.endsWith(".png")) {
				 
				 //1.直接在主线程加载图片显示，可能会造成内存溢出
//				 long start = System.currentTimeMillis();
//				 Bitmap bitmap = BitmapFactory.decodeFile(listFiles[position].getAbsolutePath());
//				 long end = System.currentTimeMillis();
//				 Log.d(TAG, "加载图片耗时：" + (end -start));
				 //2.压缩一下图片，降低内存的占用，可以规避这个内存溢出问题
//				 BitmapFactory.Options options = new BitmapFactory.Options();
//				 options.inSampleSize = 2;
//				 Bitmap bitmap = BitmapFactory.decodeFile(listFiles[position].getAbsolutePath(), options);
				 
				 //3.在子线程当中加载图片，加载完毕主线程更新
				 holder.fileIcon.setTag(listFiles[position].getAbsolutePath());
				 
				 //4.
//				 asyncLoadImage.loadImage(holder.fileIcon);
				 
//				 asyncLoadImage.loadImage2(holder.fileIcon);
				 
				 asyncLoadImage.loadImage3(holder.fileIcon);
				 
				 
				 holder.fileName.setText(fileName);
				 
				 
			 } else {
				 holder.fileIcon.setImageResource(R.drawable.file);
				 holder.fileName.setText(listFiles[position].getName());
			 }
		 }
		 final CheckBox myCb = holder.cb;
		 myCb.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Boolean b = isSelected.get(position);
				if (b) {
					isSelected.put(position, false);
					myCb.setChecked(false);
				} else {
					isSelected.put(position, true);
					myCb.setChecked(true);
					File file = listFiles[position];
					
				}
			}
		});
		 
		holder.cb.setChecked(isSelected.get(position));
		return convertView;
	} 
	
	private static final class ViewHolder {
		private ImageView fileIcon;
		private TextView fileName;
		private CheckBox cb;
	}

	@Override
	public void onScrollStateChanged(AbsListView view, int scrollState) {
		switch (scrollState) {
		case OnScrollListener.SCROLL_STATE_FLING://这个滑动中
			//锁住  isAllow = false
			asyncLoadImage.lock();
			break;
		case OnScrollListener.SCROLL_STATE_IDLE://滑动停止
//			isAllow = true;
			state = listView.onSaveInstanceState();
			asyncLoadImage.unLock();
			Log.d(TAG,  "state:" + state);
			break;
		case OnScrollListener.SCROLL_STATE_TOUCH_SCROLL://手指还在屏幕上
//			isAllow = false
			asyncLoadImage.lock();
			break;
		default:
			break;
		}
		
	}
	@Override
	public void onScroll(AbsListView view, int firstVisibleItem,
			int visibleItemCount, int totalItemCount) {
		// TODO Auto-generated method stub
		
	}

}
