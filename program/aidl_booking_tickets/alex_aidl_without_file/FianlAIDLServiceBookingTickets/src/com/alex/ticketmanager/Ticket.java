package com.alex.ticketmanager;

import android.os.Messenger;
import android.widget.Button;
import android.widget.TextView;

public class Ticket {
	private static final int MAX_NUM_OF_SALED = 3;  //一个座位最多卖几张票
	private int carrage = 0;   //车厢号
	private int seatNumber = 0; //座位号
	private int[] startArray = {0,0,0}; //始发站
	private int[] destination = {0,0,0}; //终点站
	private int numOfSaled = 0; //此座位卖了几次(max:3)
	
	//车厢
	public void setCarrage(int carrage){
		this.carrage = carrage;
	}
	
	public int getCarrage(){
		return this.carrage;
	}
	
	//座位号
	public void setSeatNumber(int seatNumber){
		this.seatNumber = seatNumber;
	}
	
	public int getSeatNumber(){
		return this.seatNumber;
	}
	
	//卖了几次
	public void setNumOfSaled(int numOfSaled){
		this.numOfSaled = numOfSaled;
	}
	
	public int getNumOfSaled(){
		return this.numOfSaled;
	}
	
	
	//起始站
	public boolean setStartStation(int startStation, int i){
		if ((i > (MAX_NUM_OF_SALED - 1)) || (i < 0)){
			return false;
		} else {
			startArray[i] = startStation;
			return true;
		}
	
	}
	
	public int[] getStartStation(){
		return startArray;
	}
	
	//终点站
	public boolean setDesStation(int desStation, int i){
		if ((i > (MAX_NUM_OF_SALED - 1)) || (i < 0)){
			return false;
		} else {
			destination[i] = desStation;
			return true;
		}
	}
	
	public int[] getDesStation(){
		return destination;
	}
	
}