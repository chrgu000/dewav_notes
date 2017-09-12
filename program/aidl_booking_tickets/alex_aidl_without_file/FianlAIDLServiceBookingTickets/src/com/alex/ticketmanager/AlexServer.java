package com.alex.ticketmanager;

import java.util.ArrayList;
import java.util.List;
import com.alex.ticketmanager.Ticket;
import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.util.Log;
import android.widget.Toast;
import android.app.Activity;

public class AlexServer extends Service {
	 private static final int SEATS_OF_CARRIAGE = 50;  //车厢座位数
	 private static final int CARRIAGES_OF_TRAIN = 10;  //车厢数
	 private static final int TOTAL_TICKETS = SEATS_OF_CARRIAGE*CARRIAGES_OF_TRAIN; //总票数
	 private List<Ticket> myTickets = null; 
	 private IBinder binder = new AlexBookTicketsBinder();
	 private boolean ifRemoteCall = true;
	@Override
	public IBinder onBind(Intent intent) {
		 return binder;
	}
	
    private final class AlexBookTicketsBinder extends ITicketManager.Stub{
    	
    	public boolean buy(int number,String departureStation,String terminus){
    		    boolean result = false;
    		    int start = 0;
    		    int des   = 0;
    		    
    		    if(number == 888){
    		    	ifRemoteCall = true;
    		    }else if(number == 999){
    		    	ifRemoteCall = false;
    		    }
    		    
    		    if (ifRemoteCall){
    		    	return remoteBuy( number, departureStation, terminus);
    		    }
    		    
    		    
    		    if ((departureStation == null) || (terminus == null)){
    		    	Toast.makeText(getApplicationContext(), "请输入起始车站", Toast.LENGTH_LONG).show();
    		    } else {
    		    	try {
    		    		start = Integer.parseInt(departureStation);
            			des   = Integer.parseInt(terminus);
    		    	} catch (Exception e) {
    		    		Toast.makeText(getApplicationContext(), "请输入数字1-13!", Toast.LENGTH_LONG).show();
    		    		return result;
    		    	}
    		    	
    		    }
    		 
    		    Log.i("alex111","number:"+number+" start:"+start+" des:"+des);
    		    if ((start > 13) || (start<1) || (des > 13) || (des < 1)){
    		    	Toast.makeText(getApplicationContext(), "Wrong or unknow station", Toast.LENGTH_LONG).show();
    		    }else if(number>500){
    		    	initTickets();
    		    	Toast.makeText(getApplicationContext(), "车票限购500张", Toast.LENGTH_LONG).show();
    		    }else if(number==0){
    		    	Toast.makeText(getApplicationContext(), "Are you kidding me???", Toast.LENGTH_LONG).show();
    		    }else if(start>=des){
    		    	Toast.makeText(getApplicationContext(), "Start station can't be the same to End station or > End station", Toast.LENGTH_LONG).show();
    		    }else{
    		    	 synchronized (myTickets){
    		    		 result = buyTickets(number,start,des);
    		    	 }
    		    }
    		    return result;
    		    
    	}
    
    }
    
    public void onCreate() {  
        super.onCreate();  
        Log.i("alexaidl","onCreate");
        if (myTickets == null){
        	Log.i("alexaidl","initTickets()");
        	initTickets();
        }
    }  
    
   
    public void onDestroy() {
    	super.onDestroy(); 
    	Log.i("alexaidl","onDestroy");
    	
    	//myTickets.clear();
    	//myTickets = null;
    }
    
    
    //初始化所有车票
    public void initTickets(){
    	int i =0,j=0;
    	myTickets = new ArrayList<Ticket>();
        for (i=0;i<500;i++){
        	myTickets.add(new Ticket());
        }
        int indexOfticket = 0;
        for (i=1;i<=CARRIAGES_OF_TRAIN;i++){
        	for (j=1;j<=SEATS_OF_CARRIAGE;j++){
        		Ticket ticket = myTickets.get(indexOfticket);
        		ticket.setCarrage(i);   //车厢号
        		ticket.setSeatNumber(j);  //座位号
        		ticket.setNumOfSaled(0);  //此座位卖出次数
        		ticket.setStartStation(0, 0);  //起始站数组和终点站数组初始化(一座最多卖三张票)
        		ticket.setStartStation(0, 1);
        		ticket.setStartStation(0, 2);
        		
        		ticket.setDesStation(0, 0);
        		ticket.setDesStation(0, 1);
        		ticket.setDesStation(0, 2);
        		
        		indexOfticket+=1;
        	}
        }
    }
    
    //买票
    public  boolean buyTickets(int number,int start, int des) {
    	int i = 0;
    	 Log.i("alex111","buyTickets");
    	if(number > getNumOfRestTicket(start,des)){
    		 if (!ifRemoteCall){
    			 Toast.makeText(getApplicationContext(), "Not enough tickets", Toast.LENGTH_LONG).show();
    		 }else{
    			 Message msg = new Message();
				 msg.what = 0;
				 msg.obj = "Not enough tickets";
				 myHandler.sendMessage(msg);
    		 }
    		return false;
    	}else if(number < getNumOfRestTicket(start,des)){
    		for (i = 0; i < number; i++){
    			buyOneTicket(start, des);
    		}
    		 if (!ifRemoteCall){
	    		String popString;
	    		popString="已经卖出的票总数:";
	    		popString += Integer.toString(getNumOfSaledTicket());
	    		popString += "\n";
	    		popString += "剩余的票(一次没卖过的票总数):";
	    		popString += Integer.toString(getNumOfRestTicket(1,13));
	    		Toast.makeText(getApplicationContext(), popString, Toast.LENGTH_LONG).show();
    		 }else{
    			String popString;
				popString="已经卖出的票总数:";
				popString += Integer.toString(getNumOfSaledTicket());
				popString += "\n";
				popString += "剩余的票(一次没卖过的票总数):";
				popString += Integer.toString(getNumOfRestTicket(1,13));
 	    		
				 Message msg = new Message();
				 msg.what = 0;
				 msg.obj = popString;
				 myHandler.sendMessage(msg);
    		 }
    		return true;
    	}
    	return false;
    }
    
    //买一张票
    public void buyOneTicket(int start, int des){
    	int i = 0;
    	for (i=0;i<TOTAL_TICKETS;i++){
    		Ticket ticket = myTickets.get(i);
    		int startOfTicket = ticket.getStartStation()[0];
    		int desOfTicket = ticket.getDesStation()[0];
    		
    		int startOfTicket2 = ticket.getStartStation()[1];
    		int desOfTicket2 = ticket.getDesStation()[1];
    		
    		if(ticket.getNumOfSaled()==0){//此票未售
    			ticket.setStartStation(start, 0);
    			ticket.setDesStation(des, 0);
    			ticket.setNumOfSaled(1);
    			return;
    		}else if(ticket.getNumOfSaled() == 1){//此票售出一次
    			if ((des <= startOfTicket) || (start >= desOfTicket)) {//始末站都比已卖出的此车票的始发站小
    				ticket.setStartStation(start, 1);
        			ticket.setDesStation(des, 1);
        			ticket.setNumOfSaled(2); //此座位卖出两张票
        			return;
    			} 
    		}else if(ticket.getNumOfSaled() == 2){//此票售出二次
    			if( (des < startOfTicket) && (des < startOfTicket2)){//始末站都比已卖出的此车票的始发站小
    				ticket.setStartStation(start, 2);
        			ticket.setDesStation(des, 2);
        			ticket.setNumOfSaled(3);
        			return;
    			} else if ((start >= desOfTicket) && (start >= desOfTicket2)){//始末站都比已卖出的此车票的终点站大
    				ticket.setStartStation(start, 2);
        			ticket.setDesStation(des, 2);
        			ticket.setNumOfSaled(3); //此座位卖出两张票
        			return;
    			}	
    		}else{//每个特定座位最多卖三张票
    			continue;
    		}
    	}
    }
    
    //获取一共卖了多少票
    public int getNumOfSaledTicket(){
    	int sumSaled = 0;
    	int i = 0;
    	for (i=0;i<TOTAL_TICKETS;i++){
    		Ticket ticket = myTickets.get(i);
    		sumSaled += ticket.getNumOfSaled();
    	}
    	return sumSaled;
    }
    //获取符合始末站条件的车票数量
    public int getNumOfRestTicket(int start,int des){
    	int sumRest = 0;
    	int i = 0;
    	
    	for (i = 0; i < TOTAL_TICKETS; i++){
    		Ticket ticket = myTickets.get(i);
    		int startOfTicket = ticket.getStartStation()[0];
    		int desOfTicket = ticket.getDesStation()[0];
    		
    		int startOfTicket2 = ticket.getStartStation()[1];
    		int desOfTicket2 = ticket.getDesStation()[1];
    		
    		if(ticket.getNumOfSaled() == 0){ //此座位未售车票
    			sumRest += 1;
    		} else if (ticket.getNumOfSaled() == 1) {
    			if((start >= desOfTicket) || (des <= startOfTicket)) {//始末站都比已卖出的此车票的始发站小
    				sumRest += 1;
    			} 
    		} else if (ticket.getNumOfSaled()==2) {
    			if((start >= desOfTicket) && (start >= desOfTicket2)) {//始末站都比已卖出的此车票的始发站小
    				sumRest += 1;
    			} else if ((des <= startOfTicket) && (des <= startOfTicket2)) {//始末站都比已卖出的此车票的终点站大
    				sumRest += 1;
    			}	
    		}else{//每个特定座位最多卖三张票
    			continue;
    		}
    	}
    	
    	return sumRest;
    }
    
    //--------------------------------------------------------------------------
	public boolean remoteBuy(int number,String departureStation,String terminus){
		boolean result = false;
		int start = 0;
		int	 des   = 0;
		
		Message msg = new Message();
    	msg.what = 0;
    	
		if ((departureStation == null) || (terminus == null)){
			msg.obj = "请输入起始站和终点站.";
	    	myHandler.sendMessage(msg);
	    	return false;
	    } else {
	    	try {
	    		start = Integer.parseInt(departureStation);
    			des   = Integer.parseInt(terminus);
	    	} catch (Exception e) {
	    		msg.obj = "请输入起始站和终点站,并且需输入数字";
		    	myHandler.sendMessage(msg);
	    		return false;
	    	}
	    }
	 
	    if ((start > 13) || (start<1) || (des > 13) || (des < 1)){
	    	msg.obj = "始末站必须在1--13内";
	    	myHandler.sendMessage(msg);
	    	return false;
	    }else if(number>500){
	    	msg.obj = "限购票500张内!!!";
	    	myHandler.sendMessage(msg);
	    	initTickets();
	    	return false;
	    }else if(number<=0){
	    	msg.obj = "请输入正确的票数!!!";
	    	myHandler.sendMessage(msg);
	    	return false;
	    }else if(start>=des){
	    	msg.obj = "终点站必须大于始发站!!!";
	    	myHandler.sendMessage(msg);
	    	return false;
	    }else{
	    	 synchronized (myTickets){
	    		 result = buyTickets(number,start,des);
	    	 }
	    }
	    return result;
	}
	
	
	
		
	Handler myHandler = new Handler() {
	    @Override
	    public void handleMessage(Message msg) {
	        super.handleMessage(msg);
	        switch(msg.what) {
	        case 0:
	            Toast.makeText(getApplicationContext(), msg.obj.toString(), Toast.LENGTH_LONG).show();
	            break;
	        }
	 
	    }
	};
    
}
