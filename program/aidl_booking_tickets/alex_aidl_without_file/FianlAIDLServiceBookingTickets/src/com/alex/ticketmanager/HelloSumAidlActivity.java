package com.alex.ticketmanager;


import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import android.app.Activity;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;

public class HelloSumAidlActivity extends Activity {

	private ITicketManager iTicketManager;
	TextView result = null;
	EditText value2 = null;
	EditText value3 = null;
	EditText value4 = null;
	Button buttonCalc = null;
	Button button2 = null;
	boolean isBinded = false;
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		 result = (TextView)findViewById(R.id.result);
		 value2 = (EditText)findViewById(R.id.value2);
		 value3 = (EditText)findViewById(R.id.value3);
		 value4 = (EditText)findViewById(R.id.value4);
		 
		 buttonCalc = (Button)findViewById(R.id.buttonCalc);
		  button2=(Button)findViewById(R.id.button2);
		buttonCalc.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent();
				intent.setAction("com.dewav.ticket.buy");
				intent.setPackage("com.alex.ticketmanager");
			    isBinded = bindService(intent, serConn, Service.BIND_AUTO_CREATE);
				
			}
		});
		
		button2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
					if (isBinded){
						buyTicket();
					} else {
						Toast.makeText(getApplicationContext(), "Bind service first!!!", Toast.LENGTH_LONG).show();
					}
			}
		});
	}
	
	public void buyTicket(){
		int mum = 0;
		
	try{ 

             mum=Integer.parseInt(value2.getText().toString()); 

     }catch (Exception e){ 

         e.printStackTrace(); 

     }
		try{
			if (iTicketManager != null){
				boolean hadBuyed = iTicketManager.buy(mum, value3.getText().toString(), value4.getText().toString());
				if (hadBuyed){
					result.setText("Buy ticket successfull!");
				} else {
					result.setText("Failed to buy ticket!");
				}
			}
		}catch(RemoteException e){
			
		}
		
	}
	
		private ServiceConnection serConn = new ServiceConnection() {
		
		@Override
		public void onServiceDisconnected(ComponentName name) {
			iTicketManager = null;
		}
		
		@Override
		public void onServiceConnected(ComponentName name, IBinder service) {
			int i = 0;
			iTicketManager = ITicketManager.Stub.asInterface((IBinder)service);

		}
	};
	@Override
	protected void onDestroy() {
		super.onDestroy();
		//unbindService(serConn);
	}
	
}
