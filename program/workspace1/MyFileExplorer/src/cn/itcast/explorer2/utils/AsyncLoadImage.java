package cn.itcast.explorer2.utils;

import java.util.concurrent.ConcurrentLinkedQueue;

import cn.itcast.explorer2.R;
import cn.itcast.explorer2.domain.CacheImg;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.util.Log;
import android.widget.ImageView;

public class AsyncLoadImage {
	
	private static final String TAG = AsyncLoadImage.class.getSimpleName();

	private Context context;
	private Handler handler;
	
	private Object lock = new Object();
	private boolean isAllow = true;
	
	private ConcurrentLinkedQueue<CacheImg> imageCache;
	
	public AsyncLoadImage(Context context,Handler handler) {
		this.context = context;
		this.handler = handler;
		imageCache = new ConcurrentLinkedQueue<CacheImg>();
	}
	
	//1.���̼߳���ͼƬ
	public void loadImage(ImageView imageView) {
		String path = (String) imageView.getTag();
		
		imageView.setImageResource(R.drawable.format_picture);
		new LoadImageThread(imageView).start();
		
	}
	
	
	// 
	public void loadImage2(ImageView imageView) {
		String path = (String) imageView.getTag();
		imageView.setImageResource(R.drawable.format_picture);
		
		//1.�ڻ�����ʱ�������̵߳Ĺ�����ͣ�����䴦�ڵȴ�״̬����һ��Ĭ��ͼƬ��ʾ
		
		//2.������ֹͣʱ����֪ͨ���߳̿�ʼ����ͼƬ��������Ϻ���֪ͨ���̸߳���UI
		new LoadImageThread2(imageView).start();
	}
	
	public void loadImage3(ImageView imageView) {
		String path = (String) imageView.getTag();
		imageView.setImageResource(R.drawable.format_picture);
		
		//1.����·�����ڴ���ȡ�Ѿ����ع���ͼƬ������У�ֱ�Ӵ��ڴ��з���
		
		
		for(CacheImg img : imageCache){
			if (path.equals(img.getPath())) {
				Bitmap bitmap = img.getBitmap();
				imageView.setImageBitmap(bitmap);
				return;
			}
		}
		//2.���û�У���ȥ���߳���ȥȡ
		new LoadImageThread3(imageView).start();
		
	}
	
	class LoadImageThread3 extends Thread {
		private ImageView imageView;
		private String path;
		
		public LoadImageThread3(ImageView imageView) {
			this.imageView = imageView;
			this.path = (String) imageView.getTag();
		}
		
		@Override
		public void run() {
			
			//����ͼƬ
			if (!isAllow) {
				synchronized (lock) {
					try {
						lock.wait();
					} catch (InterruptedException e) {
						Log.e(TAG, "", e);
					}
				}
			}
			BitmapFactory.Options options = new BitmapFactory.Options();
			options.inSampleSize = 4;
			final Bitmap bitmap = BitmapFactory.decodeFile(path, options);
			CacheImg img = new CacheImg();
			img.setPath(path);
			img.setBitmap(bitmap);
			
			//�ѵõ�bitmap��·����CacheImage������뵽�ڴ���ߣ��������Ҫ��Ļ��������ڣ��Ͱѻ��浱�еĵ�һ��Ԫ��ɾ����
			if (imageCache.size() >= 100) {
				imageCache.poll();
			}
			imageCache.add(img);
			
			//2.���֮��ͨ��handler���̸߳���
			handler.post(new Runnable() {
				
				@Override
				public void run() {
					imageView.setImageBitmap(bitmap);
				}
			});
			
		}
	}
	
	public void lock() {
		isAllow = false;
	}
	
	public void unLock() {
		isAllow = true;
		synchronized (lock) {
			lock.notifyAll();
		}
	}
	
	class LoadImageThread2 extends Thread {
		private ImageView imageView;
		private String path;
		
		public LoadImageThread2(ImageView imageView) {
			this.imageView = imageView;
			this.path = (String) imageView.getTag();
		}
		
		@Override
		public void run() {
			
			//����ͼƬ
			if (!isAllow) {
				synchronized (lock) {
					try {
						lock.wait();
					} catch (InterruptedException e) {
						Log.e(TAG, "", e);
					}
				}
			}
			BitmapFactory.Options options = new BitmapFactory.Options();
			options.inSampleSize = 4;
			final Bitmap bitmap = BitmapFactory.decodeFile(path, options);
			//2.���֮��ͨ��handler���̸߳���
			handler.post(new Runnable() {
				
				@Override
				public void run() {
					imageView.setImageBitmap(bitmap);
				}
			});
			
		}
	}
	
	class LoadImageThread extends Thread {

		private ImageView imageView;
		private String path;
		
		public LoadImageThread(ImageView imageView) {
			this.imageView = imageView;
			this.path = (String) imageView.getTag();
		}
		@Override
		public void run() {
			//����ͼƬ
			
			BitmapFactory.Options options = new BitmapFactory.Options();
			options.inSampleSize = 4;
			final Bitmap bitmap = BitmapFactory.decodeFile(path, options);
			//2.���֮��ͨ��handler���̸߳���
			handler.post(new Runnable() {
				
				@Override
				public void run() {
					imageView.setImageBitmap(bitmap);
				}
			});
			
		}
		
	}
	
	
	
}
