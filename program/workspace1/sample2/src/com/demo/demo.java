package com.demo;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class demo extends Activity implements OnClickListener{
    /** Called when the activity is first created. */
	
	private Button bt = null;
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        bt = (Button)findViewById(R.id.bt);
        bt.setOnClickListener(this);
    }

	public void onClick(View v) {
		// TODO Auto-generated method stub
		  switch (v.getId()) {
		  	case R.id.bt:
		  		Intent intent = new Intent(this,com.demo.ImageSwitcher1.class);
		  		startActivity(intent);
		  		
		  		break;
		  }
	}
    
    
}