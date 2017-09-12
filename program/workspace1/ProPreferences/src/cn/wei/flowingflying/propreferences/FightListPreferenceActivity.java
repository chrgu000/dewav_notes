package cn.wei.flowingflying.propreferences;

import android.os.Bundle;
import android.preference.PreferenceActivity;

/** 这是老的使用方式，是API level 11之前，尚未引入fragment时的使用方式，本例仅用于学习一些preferences的基础概念，相关的
 * XML语法*/
public class FightListPreferenceActivity extends PreferenceActivity{

	@SuppressWarnings("deprecation")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.fightoptions);
/*		Preference p = findPreference("flight_option_preference");
		showInfo("summary: " + p.getSummary());
		showInfo("title: " + p.getTitle());
		
		ListPreference lp = (ListPreference)findPreference("selected_flight_sort_option");
		showInfo("lp = " + lp);
		showInfo("entry = " + lp.getEntry());
		showInfo("value = " + lp.getValue());*/
	}
	
/*
	private void showInfo(String s){
		Log.d(MainActivity.TAG + getLocalClassName(),s);
	}*/
}
