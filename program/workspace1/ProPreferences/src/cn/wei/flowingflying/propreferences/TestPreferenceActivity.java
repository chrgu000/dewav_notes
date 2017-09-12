package cn.wei.flowingflying.propreferences;

import android.content.Intent;
import android.os.Bundle;
import android.preference.PreferenceActivity;

public class TestPreferenceActivity extends PreferenceActivity{
	public static final String PARAM_XML_NAME="cn.wei.flowingflying.propreferences.XML_NAME";
	
	@SuppressWarnings("deprecation")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		Intent intent = getIntent();
		Bundle b = intent.getExtras();
		if(b != null ){
			int xmlId = b.getInt(PARAM_XML_NAME);
			if(xmlId > 0)
				addPreferencesFromResource(xmlId);
		}
		
	}
}
