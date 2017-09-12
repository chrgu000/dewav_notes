package com.example.alexremotecallservice;



import  com.alex.ticketmanager.ITicketManager;


import android.support.v7.app.ActionBarActivity;
import android.app.Service;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends ActionBarActivity {
	Button button1 = null;
	Button button2 = null;
	TextView result = null;
	
	EditText value2 = null;
	EditText value3 = null;
	EditText value4 = null;
	private ITicketManager iTicketManager;
	boolean isBinded = false;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		button1=(Button)findViewById(R.id.bindService);
		button2=(Button)findViewById(R.id.buyTickets);
		result = (TextView)findViewById(R.id.result);
		
		 value2 = (EditText)findViewById(R.id.value2);
		 value3 = (EditText)findViewById(R.id.value3);
		 value4 = (EditText)findViewById(R.id.value4);
		 
		button1.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent();
				intent.setAction("com.dewav.ticket.buy");
				intent.setPackage("com.alex.ticketmanager");
			    isBinded = bindService(intent, serConn, Service.BIND_AUTO_CREATE);
			    if (isBinded){
			    	Toast.makeText(getApplicationContext(), "Bind success", Toast.LENGTH_LONG).show();
			    }
			}
		});
		
		button2.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
					if ((isBinded)&&(iTicketManager != null)){
						buyTicket();
					}else{
						Toast.makeText(getApplicationContext(), "Bind service first!!!", Toast.LENGTH_LONG).show();
					}
				
			}
		});
	}

	
	public void buyTicket(){

		try{
			if (iTicketManager != null){
				int  mum=Integer.parseInt(value2.getText().toString()); 
				boolean hadBuyed  = iTicketManager.buy(mum, value3.getText().toString(), value4.getText().toString());
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
			//iTicketManager = null;
		}
		
		@Override
		public void onServiceConnected(ComponentName name, IBinder service) {
			int i = 0;
		
			iTicketManager = ITicketManager.Stub.asInterface((IBinder)service);
			
		
			
		}
	};
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
