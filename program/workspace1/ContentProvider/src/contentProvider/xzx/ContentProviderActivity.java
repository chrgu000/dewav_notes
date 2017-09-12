package contentProvider.xzx;

import android.app.Activity;
import android.content.ContentResolver;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.provider.ContactsContract.PhoneLookup;
import android.widget.EditText;
import android.widget.TextView;

public class ContentProviderActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
       // setContentView(R.layout.main);
        
        
        String string ="";
        EditText num1=(EditText)findViewById(R.id.contact1);
        EditText num2=(EditText)findViewById(R.id.contact2);
        TextView tv = new TextView(this);
        ContentResolver cr = getContentResolver();
        Cursor cursor = cr.query(ContactsContract.Contacts.CONTENT_URI, null, null, null, null);
        
        while(cursor.moveToNext())
        {
        	//��ȡ����
        	int nameFieldColumnIndex = cursor.getColumnIndex(PhoneLookup.DISPLAY_NAME);
        	String name = cursor.getString(nameFieldColumnIndex);
        	string+=(name);
        	//��ȡID
        	String contactId = cursor.getString(cursor.getColumnIndex(ContactsContract.Contacts._ID));
        	Cursor phone = cr.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
        			null, ContactsContract.CommonDataKinds.Phone.CONTACT_ID + " = "  + contactId, null, null);  
        	//��õ绰����
        	  while (phone.moveToNext())  
        	  {         
        		  String strPhoneNumber = phone.getString(phone.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER)); 
        		  string += (":" + strPhoneNumber);   
        	  }    
        	  string += "\n";    
        	  phone.close(); 
        
        }
        cursor.close();
        tv.setText(string);
        setContentView(tv);
    }
}