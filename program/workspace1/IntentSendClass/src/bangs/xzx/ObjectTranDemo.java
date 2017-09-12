package bangs.xzx;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class ObjectTranDemo extends Activity implements OnClickListener{
	
	
	private Button sButton,pButton;
	public final static String SER_KEY ="bangs.xzx.ser";
	public final static String PAR_KEY ="bangs.xzx.par";
	

    public void onCreate(Bundle savedInstanceState) {  
        super.onCreate(savedInstanceState);  
        setContentView(R.layout.main);     
        setupViews();  
    }  
    
    public void setupViews(){  
        sButton = (Button)findViewById(R.id.button1);  
        pButton = (Button)findViewById(R.id.button2);  
        sButton.setOnClickListener(this);  
        pButton.setOnClickListener(this);  
    }
    
    
    public void SerializeMethod(){
    	Person mPerson = new Person();
    	mPerson.setName("XiaoZX");
    	mPerson.setAge(29);
    	Intent mIntent=new Intent(this,ObjectTranDemo1.class);
    	Bundle mBundle =new Bundle();
    	mBundle.putSerializable(SER_KEY, mPerson);
    	mIntent.putExtras(mBundle);
    	
    	startActivity(mIntent);
    }
    
    
    
    public void PacelableMethod(){
    	Book mBook = new Book();
    	mBook.setBookName("GoldGame");
    	mBook.setAuthor("xiao");
    	mBook.setPublishTime(2012);
    	
    	Intent mIntent = new Intent(this,ObjectTranDemo2.class);
    	Bundle mBundle = new Bundle();
    	mBundle.putParcelable(PAR_KEY,mBook);
    	mIntent.putExtras(mBundle);
    	
    	startActivity(mIntent);
    }
    
    public void onClick(View v){
              if(v == sButton)
              {
            	  SerializeMethod();
              }
              else
              {
            	  PacelableMethod();
              }
    }
	
}
