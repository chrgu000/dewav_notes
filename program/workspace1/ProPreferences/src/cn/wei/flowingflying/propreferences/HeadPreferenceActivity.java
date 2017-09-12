package cn.wei.flowingflying.propreferences;

import java.util.List;

import android.os.Bundle;
import android.preference.PreferenceActivity;
import android.preference.PreferenceFragment;
import android.util.Log;
import android.widget.Button;

public class HeadPreferenceActivity extends PreferenceActivity{
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		if(hasHeaders()){
			showInfo("hasHeaders() is true.");  //对于平板为true，对于phone也为true
			Button button = new Button(this);
			button.setText("Some Action");
			setListFooter(button);
		}else{
			showInfo("hasHeaders() is false."); 
		}
	}

	@Override
	public void onBuildHeaders(List<Header> target) {
		showInfo("onBuildHeaders() is called");
		loadHeadersFromResource(R.xml.header, target);
	}
	
	
	public static class Pref1Fragment extends PreferenceFragment{

		@Override
		public void onCreate(Bundle savedInstanceState) {
			// TODO Auto-generated method stub
			super.onCreate(savedInstanceState);
			Log.i("PRO args", "Pref1Fragment Arguments: " + getArguments());
			addPreferencesFromResource(R.xml.sound);
		}
		
	}

	
	public static class Pref2Fragment extends PreferenceFragment{

		@Override
		public void onCreate(Bundle savedInstanceState) {
			// TODO Auto-generated method stub
			super.onCreate(savedInstanceState);
			Log.i("PRO args", "savedInstanceState: " + savedInstanceState);
			Log.i("PRO args", "Pref2Fragment Arguments: " + getArguments());
			addPreferencesFromResource(R.xml.complex);
		}
		
	}
	
	private void showInfo(String s){
		Log.d("PRO " + getLocalClassName(),s);
	}
}
