package cn.wei.flowingflying.propreferences;

import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.util.Log;

public class ListPreferenceFragment extends PreferenceFragment {

	@Override
	public void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		Bundle bundle = getArguments();
		Log.i("PRO args", "ListPreferenceFragment: " + bundle);
		if(bundle != null){
			String testCase = bundle.getString("testCase");
			Log.i("PRO args", "testMode: " + testCase);
			if(testCase == null){
				return;
			}
			if(testCase.equals("codeForListEntries")){
				testForListEntries();
			}else if(testCase.equals("codeForAll")){
				codeForAll();
			}
		}



	}
	
	private void codeForAll(){	
		PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(getActivity());
	
		PreferenceCategory inlinePrefCat = new PreferenceCategory(getActivity());
		inlinePrefCat.setTitle("Hello");
		screen.addPreference(inlinePrefCat);
		
		ListPreference listpref = new ListPreference(getActivity());
		listpref.setKey("my_list_pref");
		listpref.setTitle("Code For list preference");
		listpref.setSummary("完全用代码编写的首选项测试");
		listpref.setEntries(new String[]{"Entry 1","Entry 2","Entry 3"});
		listpref.setEntryValues(new String[]{"0","1","2"});
		screen.addPreference(listpref);
		setPreferenceScreen(screen);
	}

	
	private void testForListEntries(){
		addPreferencesFromResource(R.xml.fightoptions);
		ListPreference listpref = (ListPreference) findPreference("selected_flight_sort_option");
		listpref.setEntries(new String[]{"Entry 1","Entry 2","Entry 3"});
		listpref.setEntryValues(new String[]{"0","1","2"});
	}

}
