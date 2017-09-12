package cn.wei.flowingflying.propreferences;

import java.util.Set;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;

public class MainActivity extends Activity {
	public static final int REQ_CODE_FIGHTE_LIST	 = 1000;
	public static final String TAG = "PRO ";
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		PreferenceManager.setDefaultValues(this, R.xml.fightoptions, false);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// TODO Auto-generated method stub
		showInfo("onOptionsItemSelected() is called.." + item.getItemId());
		
		int itemId = item.getItemId();

		if(itemId == R.id.test_list_preferences){
			Intent i0 = new Intent(getApplicationContext(),FightListPreferenceActivity.class);
			startActivityForResult(i0, REQ_CODE_FIGHTE_LIST);
			return true;
		}else if(itemId == R.id.test_header_pref){
			Intent i1 = new Intent(getApplicationContext(),HeadPreferenceActivity.class);
			startActivity(i1);
			return true;
		}

		int xmlId = -1;
		Intent intent = new Intent(this,TestPreferenceActivity.class);
		
		if(itemId == R.id.test_check_preferences){
			xmlId = R.xml.checkbox;
		}else if(itemId == R.id.test_edit_pref){
			xmlId = R.xml.edittext;
		}else if(itemId == R.id.test_complex_pref){
			xmlId = R.xml.complex;
		}else if(itemId == R.id.test_category_pref){
			xmlId = R.xml.category;
		}else if(itemId == R.id.test_child_pref){
			xmlId = R.xml.child;
		}
		intent.putExtra(TestPreferenceActivity.PARAM_XML_NAME, xmlId);
		startActivity(intent);
		
		return super.onOptionsItemSelected(item);
	}


	
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		// TODO Auto-generated method stub
		super.onActivityResult(requestCode, resultCode, data);
		showInfo("requestCode = " + requestCode + ",resultCode = " + resultCode + ", data = " + data);

		switch(requestCode){
		case REQ_CODE_FIGHTE_LIST:
			getListPref();
			break;
		default:
			break;
		}
				
	}


	
	
	@Override
	protected void onResume() {
		// TODO Auto-generated method stub
		super.onResume();
		getListPref();
		getCheckPref();
		getEditTextPref();
		getMultiSelectPref();
		dataStore();
	}

	private void getMultiSelectPref(){
		SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
		Set<String>options = prefs.getStringSet("fruits", null);
		showInfo("Multi Select: " + options);
		String[] fruits = getResources().getStringArray(R.array.fruit);
		if(options != null ){
			for(String f: options){
				showInfo("select " + fruits[Integer.parseInt(f)]);
			}
		}
	}
	
	private void getCheckPref(){
		SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
		boolean option = prefs.getBoolean("show_airline_column_pref", false);
		showInfo("Show Airline column : " +  option);
		showInfo("Show Departure column : " +  prefs.getBoolean("show_departure_column_pref", false));
		showInfo("Show Arrival column : " +  prefs.getBoolean("show_arrival_column_pref", false));
		showInfo("Show Total Travel Time column : " +  prefs.getBoolean("show_total_travel_time_column_pref", false));
		showInfo("Show Price column : " +  prefs.getBoolean("show_price_column_pref", false));
	}
	
	private void getListPref(){
		SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
		//另一获取方式。
		//SharedPreferences prefs = getSharedPreferences("cn.wei.flowingflying.propreferences", 0);
		String option = prefs.getString("selected_flight_sort_option", null);
		String[] optionText = getResources().getStringArray(R.array.flight_sort_options);
		showInfo("option = " + option + ",select : " + optionText[Integer.parseInt(option)]);
	} 
	
	private void getEditTextPref(){
		SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
		String option = prefs.getString("package_name_pref", null);
		showInfo("Package name : " + option);

				
	}
	
	private final String INITIALIZER = "initialized";
	private final String CALLNUM = "call_number";

	private void dataStore(){
		SharedPreferences prefs = getPreferences(MODE_PRIVATE);
		boolean hasPreferences = prefs.getBoolean(INITIALIZER, false);
		int num = prefs.getInt(CALLNUM, 0);
		if(hasPreferences){
			showInfo("We've been called " + num + " times before. ");
		}else{
			showInfo("First time ever being called.");
		}
		
		Editor editor = prefs.edit();
		editor.putBoolean(INITIALIZER, true);
		num ++;
		editor.putInt(CALLNUM, num);
		editor.commit();
	}
	
	private void showInfo(String s){
		Log.d(TAG + getLocalClassName(),s);
	}
	
}
