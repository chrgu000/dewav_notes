package bangs.xzx;



import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TabHost;
import android.widget.TabHost.TabSpec;
  
public class TabActivityActivity extends TabActivity {  
    private TabHost m_tabHost;  
    /** Called when the activity is first created. */  
    @Override  
    public void onCreate(Bundle savedInstanceState) {  
        super.onCreate(savedInstanceState);  
        
        //��title     
    	requestWindowFeature(Window.FEATURE_NO_TITLE);    
    	 //ȫ��     
    	getWindow().setFlags(WindowManager.LayoutParams. FLAG_FULLSCREEN ,      
    	               WindowManager.LayoutParams. FLAG_FULLSCREEN);  
        setContentView(R.layout.main);  
          
        //getTabHost���ص�TabHost����װ��tabs  
        m_tabHost = getTabHost();  
          
        //add tabs,����������Ӿ����Tabs,����Tab������Ӧ��Activity  
        addOneTab();  
        addTwoTab();  
        addThreeTab();  
        addFourTab();  
    }  
      
    public void addOneTab(){  
        Intent intent = new Intent();  
        intent.setClass(TabActivityActivity.this, OneActivity.class);  
          
        TabSpec spec = m_tabHost.newTabSpec("One");  
        spec.setIndicator(getString(R.string.one), null);  
        spec.setContent(intent);          
        m_tabHost.addTab(spec);  
    }  
      
    public void addTwoTab(){  
        Intent intent = new Intent();  
        intent.setClass(TabActivityActivity.this, TwoActivity.class);  
          
        TabSpec spec = m_tabHost.newTabSpec("Two");  
        spec.setIndicator(getString(R.string.two), null);  
        spec.setContent(intent);          
        m_tabHost.addTab(spec);  
    }  
    public void addThreeTab(){  
        Intent intent = new Intent();  
        intent.setClass(TabActivityActivity.this, ThreeActivity.class);  
          
        TabSpec spec = m_tabHost.newTabSpec("Three");  
        spec.setIndicator(getString(R.string.three), null);  
        spec.setContent(intent);          
        m_tabHost.addTab(spec);  
    }  
    public void addFourTab(){  
        Intent intent = new Intent();  
        intent.setClass(TabActivityActivity.this, FourActivity.class);  
          
        TabSpec spec = m_tabHost.newTabSpec("Four");  
        spec.setIndicator(getString(R.string.four), null);  
        spec.setContent(intent);          
        m_tabHost.addTab(spec);  
    }  
}  