package com.czy;

import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.URL;
import java.util.Hashtable;

import android.R.integer;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

public class client extends Activity {
	private Button conBtn = null;
	private Button setBtn = null;
	private Button qian = null;
	private Button hou = null;
	private Button zuo = null;
	private Button you = null;
	private Button ting = null;
	private Button shang = null;
	private Button xia = null;

	private CheckBox cb1, cb2, cb3, cb4, cb5, cb6;

	private Context mContext = null;
	private ImageView imView = null;
	private Handler messageHandler = null;
	private Boolean isStop = true;
	private String conStr = "http://172.16.0.134:8080/?action=stream";
	private HttpRequest http = null;
	private String cmdPid = "";

	private static final int[] SETTING_ITEMS = { R.id.device1, R.id.device2,
			R.id.device3, R.id.device4, R.id.device5, R.id.device6 };

	private class ItemViews {
		public TextView label;
		public EditText ip_address;
		public EditText port;
	}

	private ItemViews[] mItemViews = new ItemViews[SETTING_ITEMS.length];

	private class DeviceInfo {
		public String ip_address;
		public int port;
	}

	private DeviceInfo[] mDeviceInfos = new DeviceInfo[SETTING_ITEMS.length];

	private CheckBox[] mCheckBoxs = new CheckBox[6];

	/** Called when the activity is first created. */
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		SharedPreferences sp = PreferenceManager
				.getDefaultSharedPreferences(this);
		for (int i = 0; i < mDeviceInfos.length; i++) {
			//String[] infos = sp.getString("设备" + (i + 1), " : ").split(":");
			String[] infos = sp.getString("设备" + (i + 1), "0:0").split(":");
			mDeviceInfos[i] = new DeviceInfo();
			mDeviceInfos[i].ip_address = infos[0];
			mDeviceInfos[i].port = Integer.valueOf(infos[1]).intValue();
		}

		setContentView(R.layout.main);
		imView = (ImageView) findViewById(R.id.imageView1);
		conBtn = (Button) findViewById(R.id.lianjie);
		setBtn = (Button) findViewById(R.id.button1);
		qian = (Button) findViewById(R.id.qian);
		;
		hou = (Button) findViewById(R.id.hou);
		;
		zuo = (Button) findViewById(R.id.zuo);
		;
		you = (Button) findViewById(R.id.you);
		;
		ting = (Button) findViewById(R.id.ting);
		;
		shang = (Button) findViewById(R.id.shang);
		;
		xia = (Button) findViewById(R.id.xia);
		;
		System.out.println("x="+conStr);
		cb1 = (CheckBox) findViewById(R.id.CheckBox01);
		cb1.setOnCheckedChangeListener(mCheckedChangeListener);
		cb2 = (CheckBox) findViewById(R.id.CheckBox02);
		cb2.setOnCheckedChangeListener(mCheckedChangeListener);
		cb3 = (CheckBox) findViewById(R.id.CheckBox03);
		cb3.setOnCheckedChangeListener(mCheckedChangeListener);
		cb4 = (CheckBox) findViewById(R.id.CheckBox04);
		cb4.setOnCheckedChangeListener(mCheckedChangeListener);
		cb5 = (CheckBox) findViewById(R.id.CheckBox05);
		cb5.setOnCheckedChangeListener(mCheckedChangeListener);
		cb6 = (CheckBox) findViewById(R.id.CheckBox06);
		cb6.setOnCheckedChangeListener(mCheckedChangeListener);

		cb1.setTag(1);
		cb2.setTag(2);
		cb3.setTag(3);
		cb4.setTag(4);
		cb5.setTag(5);
		cb6.setTag(6);

		mCheckBoxs[0] = cb1;
		mCheckBoxs[1] = cb2;
		mCheckBoxs[2] = cb3;
		mCheckBoxs[3] = cb4;
		mCheckBoxs[4] = cb5;
		mCheckBoxs[5] = cb6;

		mContext = this;
		http = new HttpRequest();

		qian.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				SendCmd("w");
			}
		});
		hou.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				SendCmd("x");
			}
		});
		shang.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				SendCmd("z");
			}
		});
		xia.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				SendCmd("c");
			}
		});
		zuo.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				SendCmd("a");
			}
		});
		you.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				SendCmd("d");
			}
		});
		ting.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				SendCmd("s");
			}
		});

		setBtn.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				Setting();
			}
		});
		conBtn.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				connect("c");
			}
		});
	}

	public void connect(final String device) {
		if (isStop) {
			isStop = false;
			conBtn.setText("Clo");
			new Thread() {
				@SuppressWarnings("unchecked")
				public void run() {
					Looper.prepare();
					try {
						URL url = new URL(device);
						Toast.makeText(mContext,url.getHost()+url.getPort(),
								Toast.LENGTH_SHORT).show();
						Socket server = new Socket(url.getHost(), url.getPort());
						OutputStream os = server.getOutputStream();
						InputStream is = server.getInputStream();

						StringBuffer request = new StringBuffer();
						request.append("GET " + url.getFile() + " HTTP/1.0\r\n");
						request.append("Host: " + url.getHost() + "\r\n");
						request.append("\r\n");
						os.write(request.toString().getBytes(), 0,
								request.length());

						StreamSplit localStreamSplit = new StreamSplit(
								new DataInputStream(new BufferedInputStream(is)));
						Hashtable localHashtable = localStreamSplit
								.readHeaders();

						String str3 = (String) localHashtable
								.get("content-type");
						int n = str3.indexOf("boundary=");
						Object localObject2 = "--";
						if (n != -1) {
							localObject2 = str3.substring(n + 9);
							str3 = str3.substring(0, n);
							if (!((String) localObject2).startsWith("--"))
								localObject2 = "--" + (String) localObject2;
						}
						if (str3.startsWith("multipart/x-mixed-replace")) {
							localStreamSplit
									.skipToBoundary((String) localObject2);
						}
						Message message1 = Message.obtain();
						message1.arg1 = 1;
						messageHandler.sendMessage(message1);
						do {
							if (localObject2 != null) {
								localHashtable = localStreamSplit.readHeaders();
								if (localStreamSplit.isAtStreamEnd())
									break;
								str3 = (String) localHashtable
										.get("content-type");
								if (str3 == null)
									throw new Exception("No part content type");
							}
							if (str3.startsWith("multipart/x-mixed-replace")) {
								n = str3.indexOf("boundary=");
								localObject2 = str3.substring(n + 9);
								localStreamSplit
										.skipToBoundary((String) localObject2);
							} else {
								byte[] localObject3 = localStreamSplit
										.readToBoundary((String) localObject2);
								if (localObject3.length == 0)
									break;

								Message message = Message.obtain();
								message.arg1 = 0;
								message.obj = BitmapFactory.decodeByteArray(
										localObject3, 0, localObject3.length);
								messageHandler.sendMessage(message);
							}
							try {
								Thread.sleep(10L);
							} catch (InterruptedException localInterruptedException) {

							}
						} while (!isStop);
						server.close();
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("调试");
						Toast.makeText(mContext, "连接不到IPCAMERA!",
								Toast.LENGTH_SHORT).show();
						Message message = Message.obtain();
						message.arg1 = 1;
						messageHandler.sendMessage(message);
					}
					Looper.loop();
				}
			}.start();
		} else {
			isStop = true;
			conBtn.setText("Con");
		}
		Looper looper = Looper.myLooper();
		messageHandler = new MessageHandler(looper);
}

	

	public void SendCmd(final String cmd) {
		new Thread() {
			public void run() {
				try {
					String httpStr = "http://" + (new URL(conStr)).getHost()
							+ "/cgi/action.cgi?cmd=";
					if (cmdPid == "") {
						String result = http.doGet(httpStr + "p");
						cmdPid = (result.substring(result.indexOf(">") + 1,
								result.lastIndexOf("<"))).trim();
					}
					if (cmdPid.equals("")) {
						return;
					}
					http.doGet(httpStr + cmd + "&pid=" + cmdPid);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}.start();
	}

	class MessageHandler extends Handler {
		public MessageHandler(Looper looper) {
			super(looper);
		}

		public void handleMessage(Message msg) {
			switch (msg.arg1) {
			case 0:
				imView.setImageBitmap((Bitmap) msg.obj);
				break;
			default:
				break;
			}
		}
	}

	public void Setting() {
		LayoutInflater factory = LayoutInflater.from(mContext);
		final View v1 = factory.inflate(R.layout.setting, null);
		for (int i = 0; i < SETTING_ITEMS.length; i++) {
			View item = v1.findViewById(SETTING_ITEMS[i]);
			mItemViews[i] = new ItemViews();
			mItemViews[i].label = (TextView) item.findViewById(R.id.label);
			mItemViews[i].label.setText("设备" + (i + 1));
			mItemViews[i].ip_address = (EditText) item
					.findViewById(R.id.ip_address);
			mItemViews[i].ip_address.setText(mDeviceInfos[i].ip_address);
			mItemViews[i].port = (EditText) item.findViewById(R.id.port);
			mItemViews[i].port.setText(mDeviceInfos[i].port + "");
		}
		AlertDialog.Builder dialog = new AlertDialog.Builder(mContext);
		dialog.setTitle("IPCAMERA");
		dialog.setView(v1);
		dialog.setPositiveButton("保存设置", new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int whichButton) {
				SharedPreferences sp = PreferenceManager
						.getDefaultSharedPreferences(client.this);
				Editor editor = sp.edit();
				for (int i = 0; i < mItemViews.length; i++) {
					ItemViews view = mItemViews[i];
					mDeviceInfos[i].ip_address = view.ip_address.getText()
							.toString();
					mDeviceInfos[i].port = Integer.valueOf(
							view.port.getText().toString()).intValue();
					editor.putString(view.label.getText().toString(),
							mDeviceInfos[i].ip_address + ":"
									+ mDeviceInfos[i].port);
				}
				editor.commit();
				Toast.makeText(mContext, "设置成功!", Toast.LENGTH_SHORT).show();
			}
		});
		dialog.setNegativeButton("取消", new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int which) {

			}
		});
		dialog.show();
	}

	private OnCheckedChangeListener mCheckedChangeListener = new OnCheckedChangeListener() {
		@Override
		public void onCheckedChanged(CompoundButton buttonView,
				boolean isChecked) {
			System.out.println("x="+conStr);
			if (isChecked) {
				cleanOtherChecks(buttonView);
				// TODO 这里通过tag 取到ip port
				int tag = (Integer) buttonView.getTag();
				DeviceInfo info = mDeviceInfos[tag - 1];
				conStr = "http://"+info.ip_address + ":" +info.port +"/?action=stream";
				Toast.makeText(mContext, "连接"+conStr,
						Toast.LENGTH_SHORT).show();
				//System.out.println("x="+conStr);
				connect(conStr);
			}
		}
	};

	private void cleanOtherChecks(final CompoundButton buttonView) {
		for (int i = 0; i < mCheckBoxs.length; i++) {
			if (((Integer) mCheckBoxs[i].getTag()).intValue() == ((Integer) buttonView
					.getTag()).intValue()) {
				continue;
			}
			mCheckBoxs[i].setChecked(false);
		}
	}
}