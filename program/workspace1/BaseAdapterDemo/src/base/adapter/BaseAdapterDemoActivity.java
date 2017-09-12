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

	//�����Լ���������,ע��getCount��getView����   
    private class MyAdapter extends BaseAdapter{  
        @Override  
        public int getCount() {  
            // �����Ҿͷ���10�ˣ�Ҳ����һ����10��������   
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
            // position����λ�ô�0��ʼ��convertView��Spinner,ListView��ÿһ��Ҫ��ʾ��view   
            //ͨ��return ��viewҲ����convertView   
            //parent���Ǹ������ˣ�Ҳ����Spinner,ListView,GridView��.  
        	
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