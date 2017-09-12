package check.box;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;

public class CheckboxActivity extends Activity {
    /** Called when the activity is first created. */
	
	CheckBox beijing=null;  
	CheckBox shanghai=null;    
	CheckBox shenzhen=null;   
	EditText editText1=null; 
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        Button button1=(Button)findViewById(R.id.reset);
        beijing=(CheckBox)findViewById(R.id.beijing);      
        shanghai=(CheckBox)findViewById(R.id.shanghai);      
        shenzhen=(CheckBox)findViewById(R.id.shenzhen);     
        editText1=(EditText)findViewById(R.id.editText1); 
    //北京    
        beijing.setOnCheckedChangeListener
        (new CompoundButton.OnCheckedChangeListener(){
       	 public void onCheckedChanged(CompoundButton buttonView,
       	boolean isChecked	)
       	 {
       		 if(isChecked)
       		 {
       			 editText1.setText(buttonView.getText()+"选中");
       		 }
       		 else
       		 {
       			 
       			 editText1.setText(buttonView.getText()+"未选中");
       		 }
       	 }
          }	 		 
         );
           
        
  //上海
     shanghai.setOnCheckedChangeListener
     (new CompoundButton.OnCheckedChangeListener(){
    	 public void onCheckedChanged(CompoundButton buttonView,
    	boolean isChecked	)
    	 {
    		 if(isChecked)
    		 {
    			 editText1.setText(buttonView.getText()+"选中");
    		 }
    		 else
    		 {
    			 
    			 editText1.setText(buttonView.getText()+"未选中");
    		 }
    	 }
       }	 		 
      );
        
     //深圳
     shenzhen.setOnCheckedChangeListener
     (new CompoundButton.OnCheckedChangeListener(){
    	 public void onCheckedChanged(CompoundButton buttonView,
    	boolean isChecked	)
    	 {
    		 if(isChecked)
    		 {
    			 editText1.setText(buttonView.getText()+"选中");
    		 }
    		 else
    		 {
    			 
    			 editText1.setText(buttonView.getText()+"未选中");
    		 }
    	 }
       }	 		 
      );
     
     
    }
}