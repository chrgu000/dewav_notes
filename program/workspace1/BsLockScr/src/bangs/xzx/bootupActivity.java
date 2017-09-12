package bangs.xzx;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class bootupActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TextView tv = new TextView(this);
        tv.setText("Hello.11111!");
        setContentView(tv);
        
       //startService(new Intent(bootupActivity.this,BitmapLockService.class));
       // this.finish();
    }
}