package phonestate.xzx;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.widget.Toast;

public class PhonestateActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        TelephonyManager tm =(TelephonyManager)
        getSystemService(Context.TELEPHONY_SERVICE);
        MyPhoneCallListener myPhoneCallListener=new
        MyPhoneCallListener();
        
        tm.listen(myPhoneCallListener, PhoneStateListener.LISTEN_CALL_STATE);
        
        
        
    }
    
    

}
  class MyPhoneCallListener extends PhoneStateListener
{
	public void onCallStateChanged(int state,String incomingNumber)
	{
		switch(state)
		{
		case TelephonyManager.CALL_STATE_OFFHOOK:
		//	Toast.makeText(Main.this, "����ͨ��...", Toast.LENGTH_SHORT).show();
			break;
		case TelephonyManager.CALL_STATE_RINGING:
		//	Toast.makeText(Main.this, incomingNumber, Toast.LENGTH_SHORT).show();
			break;
		}
		super.onCallStateChanged(state,incomingNumber);
	}

}

