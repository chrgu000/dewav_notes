package cn.itcast.explorer2;

import java.io.File;

import cn.itcast.explorer2.R;
import cn.itcast.explorer2.adapter.FileExplorerAdapter;
import cn.itcast.explorer2.utils.FileUtil;
import cn.itcast.explorer2.utils.MyFileFilter;


import android.os.Bundle;
import android.os.Environment;
import android.os.Parcelable;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.util.Log;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnLongClickListener;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.support.v4.app.NavUtils;

public class MainActivity extends Activity implements OnItemClickListener,OnItemLongClickListener{

	private ListView listView;
	private Context context;
	private File[] listFiles;
	private FileExplorerAdapter adapter;
	private File parentFile;
	
	private TextView pathInfo;
	
	private int location;
	
	private String fileType = null;
	
	private static final String TAG = MainActivity.class.getSimpleName();
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        context = this;
        initUI();
        
        if (Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)) {
        	listFiles = getListFiles();
        	
        	adapter = new FileExplorerAdapter(context, listFiles,listView);
        	listView.setAdapter(adapter);
        	
        	
        } else {
        	Toast.makeText(context, getString(R.string.sdcard_error), Toast.LENGTH_LONG).show();
        }
        
        listView.setOnItemClickListener(this);
        listView.setOnItemLongClickListener(this);
        
        
    }

	private File[] getListFiles() {
		File file = Environment.getExternalStorageDirectory();
		listFiles = file.listFiles(new MyFileFilter());
		
		return listFiles = FileUtil.sort(listFiles);
	}

    private void initUI() {
    	listView = (ListView) findViewById(R.id.listview);
    	pathInfo = (TextView) findViewById(R.id.pathInfo);
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position,
			long id) {
		
		//点击文件夹的处理
		if (listFiles[position].isDirectory() ){
			
			parentFile = listFiles[position].getParentFile();
			pathInfo.append("/"+listFiles[position].getName());
			
			
			listFiles = listFiles[position].listFiles(new MyFileFilter());
			listFiles = FileUtil.sort(listFiles);
			
			adapter.update(listFiles);
			
		} else {//点击文件的处理
			
		}
		
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {

		//  /mnt/sdcard/xxxx
		
		if (keyCode == KeyEvent.KEYCODE_BACK) {
			if (parentFile != null && !parentFile.getName().equals("") && !parentFile.getName().equals("mnt") ) {
				listFiles = parentFile.listFiles(new MyFileFilter());
				listFiles = FileUtil.sort(listFiles);
				adapter.update(listFiles);
				//parentFile == mnt
				parentFile = parentFile.getParentFile();
				
				//更新路径信息
				//SDCard/Android/data/com.itcast.explorer
				
				String path = pathInfo.getText().toString();
				int indexOf = path.lastIndexOf("/");
				path = path.substring(0, indexOf);
				pathInfo.setText(path);
				
				if (adapter.state != null) {
					listView.setAdapter(adapter);
					listView.onRestoreInstanceState(adapter.state);
				}
				//通过
//				listView.setAdapter(adapter);
//				listView.setSelection(location);
				
				Log.d(TAG, "back location:" + location + " back state:" + adapter.state);
				
			} else {
				finish();
			}
		}
		
		return true;
	}
	

	@Override
	public boolean onItemLongClick(AdapterView<?> parent, View view,
			int position, long id) {
		
		if (listFiles[position].isDirectory() ) {
			fileType = getString(R.string.folder);
		} else {
			fileType = getString(R.string.file);
		}
		
		listView.setOnCreateContextMenuListener(menuList);
		return false;
	}
	ListView.OnCreateContextMenuListener menuList = new ListView.OnCreateContextMenuListener() {
		@Override
		public void onCreateContextMenu(ContextMenu menu, View v,
				ContextMenuInfo menuInfo) {
			// TODO Auto-generated method stub
			// 添加菜单项
			
			menu.setHeaderTitle("操作" + fileType);
			int resId;
			if (fileType.equals(getString(R.string.folder))) {
				resId = R.drawable.menu_folder;
			} else {
				resId = R.drawable.menu_file;
			}
			menu.setHeaderIcon(resId);
			MenuInflater inflater = getMenuInflater();
			inflater.inflate(R.menu.file_context_menu, menu);
		}
	};

	@Override
	public boolean onContextItemSelected(MenuItem item) {
		// 关键地方
		
		AdapterView.AdapterContextMenuInfo menu;
		
		menu = (AdapterContextMenuInfo) item.getMenuInfo();
		int position = menu.position;
		
		final File file = listFiles[position];
		
		switch (item.getItemId()) {
		case R.id.rename:
			rename(file);
			
			break;
		case R.id.new_create_folder:
			
			
			
			break;
		case R.id.copy:
			Toast.makeText(context, "点击了复制", Toast.LENGTH_LONG).show();
			break;
		case R.id.paste:
			Toast.makeText(context, "点击了粘贴", Toast.LENGTH_LONG).show();
			break;
		default:
			break;
		}
		
		
		return super.onContextItemSelected(item);
	}
	
	private void newCreateFolder() {
		
		AlertDialog.Builder dialog = new AlertDialog.Builder(context);
		dialog.setTitle(R.string.rename);
		
		final EditText edit = new EditText(context);
		edit.setHint(R.string.plz_input_new_name);
		edit.selectAll();
		
		dialog.setView(edit);
		
		dialog.setPositiveButton(R.string.confirm, new DialogInterface.OnClickListener() {
			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				File file = new File(edit.getText().toString());
				if (!file.exists()) {
					boolean b = file.mkdir();
					if (b) {
						Toast.makeText(context, R.string.create_folder_success, Toast.LENGTH_LONG).show();
					} else {
						Toast.makeText(context, R.string.create_folder_fail, Toast.LENGTH_LONG).show();
					}
				}
				
			}
		});
		
		dialog.setNegativeButton(R.string.cancel, null);
		
		
	}
	

	private void rename(final File file) {
		AlertDialog.Builder dialog = new AlertDialog.Builder(context);
		dialog.setTitle(R.string.rename);
		
		final EditText edit = new EditText(context);
		edit.setHint(R.string.plz_input_new_name);
		edit.setText(file.getName());
		edit.selectAll();
		
		dialog.setView(edit);
		dialog.setPositiveButton(R.string.confirm, new DialogInterface.OnClickListener() {
			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				String newName = edit.getText().toString();
				if (newName != null && !"".equals(newName)) {
					String path1 = file.getPath();
					//   /mnt/sdcard/hello
					int indexOf = path1.lastIndexOf("/");
					String path2 = path1.substring(0, indexOf);
					
					//   /mnt/sdcard/hello2
					
					boolean b = file.renameTo(new File(path2 +"/"+ newName));
					Log.d(TAG, "path:" + path1 + " new path:" + path2 +"/"+ newName);
					Log.d(TAG, "new Name:" + newName);
					if(b) {
						Toast.makeText(context, R.string.rename_success, Toast.LENGTH_LONG).show();
						adapter.update(getListFiles());
						
						if (adapter.state != null) {
							listView.onRestoreInstanceState(adapter.state);
						}
					} else {
						Toast.makeText(context, R.string.rename_fail, Toast.LENGTH_LONG).show();
					}
					
				} else {
					Toast.makeText(context, R.string.name_is_not_null, Toast.LENGTH_LONG).show();
				}
			}
		});
		dialog.setNegativeButton(R.string.cancel, new DialogInterface.OnClickListener() {
			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				// TODO Auto-generated method stub
				
			}
		});
		dialog.show();
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
//		return true;
		getMenuInflater().inflate(R.menu.app_menu, menu);
		return onCreateOptionsMenu(menu);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.create_dir:
			newCreateFolder();
			break;

		default:
			break;
		}
		return true;
	}

	

	
	
	
	
	
	
    
}
