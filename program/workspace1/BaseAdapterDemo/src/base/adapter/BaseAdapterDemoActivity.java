package base.adapter;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;

public class BaseAdapterDemoActivity extends Activity {
    /** Called when the activity is first created. */
	private Spinner mSpinner;  
    private ListView mListView;  
    private GridView mGridView;  
    private MyAdapter mMyAdapter;  

	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        setupViews();  

    }
	
	public void setupViews(){  
        mMyAdapter = new MyAdapter();  
        mSpinner = (Spinner)findViewById(R.id.spinner);  
        mSpinner.setAdapter(mMyAdapter);  
        mListView = (ListView)findViewById(R.id.listview);  
        mListView.setAdapter(mMyAdapter);  
        mGridView = (GridView)findViewById(R.id.gridview);  
        mGridView.setAdapter(mMyAdapter);  
        mGridView.setNumColumns(2);  
      
    }  

	//定义自己的适配器,注意getCount和getView方法   
    private class MyAdapter extends BaseAdapter{  
        @Override  
        public int getCount() {  
            // 这里我就返回10了，也就是一共有10项数据项   
            return 10;  
        }  
        @Override  
        public Object getItem(int arg0) {  
            return arg0;  
        }  
        @Override  
        public long getItemId(int position) {  
            return position;  
        }  
        @Override  
        public View getView(int position, View convertView, ViewGroup parent) {  
            // position就是位置从0开始，convertView是Spinner,ListView中每一项要显示的view   
            //通常return 的view也就是convertView   
            //parent就是父窗体了，也就是Spinner,ListView,GridView了.  
        	
        	if(parent==mSpinner)
        	{
        		int i=0;
        		i=1;
        	}
            TextView mTextView = new TextView(getApplicationContext());  
            mTextView.setText("BaseAdapterDemo");  
            mTextView.setTextColor(Color.RED);  
            return mTextView;  
           
            /*
        		convertView = LayoutInflater.from(getApplicationContext()).inflate  
                    (R.layout.baseadapter_provider1,null);  
                      
                    TextView mTextView = (TextView)convertView.findViewById(R.id.textview);  
                    mTextView.setText("BaseAdapterDemo" + position);  
                    mTextView.setTextColor(Color.RED);  
                    return convertView;  
             */
        	
        }  
          
    }  

	
}