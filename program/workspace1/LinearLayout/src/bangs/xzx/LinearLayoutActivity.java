package bangs.xzx;


import android.app.Activity;
import android.content.Intent;  
import android.os.Bundle;  
import android.view.View;  
import android.view.View.OnClickListener;  
import android.widget.Button;  
import android.widget.LinearLayout;  
import android.widget.TextView;  
public class LinearLayoutActivity extends Activity {  
    /** Called when the activity is first created. */  
    @Override  
    public void onCreate(Bundle savedInstanceState) {  
        super.onCreate(savedInstanceState);  
        TextView textView = new TextView(this);  
        textView.setText(this + "");  
        Button button = new Button(this);  
        button.setText("go LinearLayoutActivity");  
        button.setOnClickListener(new OnClickListener() {  
            @Override  
            public void onClick(View v) {  
                Intent intent = new Intent();  
                intent.setClass(LinearLayoutActivity.this, LinearLayoutActivity.class);  
                startActivity(intent);  
            }  
        });  
        LinearLayout layout = new LinearLayout(this);  
        layout.setOrientation(LinearLayout.VERTICAL);  
        layout.addView(textView);  
        layout.addView(button);  
        this.setContentView(layout);  
    }  
}  
