package com.yaya;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.text.Editable;
import android.text.Selection;
import java.text.*;

public class MyActivity extends Activity implements OnClickListener{
/** Called when the activity is first created. */
	private Button[]Btn= new Button[10];	//定义10个数字按钮	
	private Button BtnClr,BtnSub,BtnAdd,BtnMul,BtnDiv,BtnDot,BtnEqual;		//定义了运算符号和清除符号
	private EditText c1;		//定义了输出的文本框
	private int[] B = new int[10];		//定义了一个整型数组用来保存数字按钮的ID的
	private float[] sum=new float[100];		//定义了一个浮点数的数组用来保存用于运算的数字
	private String[] oprater=new String[100];		//定义了一个字符串型的数组用来保存运算符号	
	private int k=0,j=0;	
	private String prebtn ="";			//用来保存前一个按钮操作
	DecimalFormat df;		
	DecimalFormat df1;
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);			
		//不显示软键盘
		
		Btn[1] = (Button)findViewById(R.id.Btn1);
		Btn[2] = (Button)findViewById(R.id.Btn2);
		Btn[3] = (Button)findViewById(R.id.Btn3);
		Btn[4] = (Button)findViewById(R.id.Btn4);
		Btn[5] = (Button)findViewById(R.id.Btn5);
		Btn[6] = (Button)findViewById(R.id.Btn6);
		Btn[7] = (Button)findViewById(R.id.Btn7);
		Btn[8] = (Button)findViewById(R.id.Btn8);
		Btn[9] = (Button)findViewById(R.id.Btn9);
		Btn[0] = (Button)findViewById(R.id.Btn0);
		//分别声明了每个数字按钮
		
		BtnClr = (Button)findViewById(R.id.BtnClr);
		BtnAdd = (Button)findViewById(R.id.BtnAdd);
		BtnSub = (Button)findViewById(R.id.BtnSub);
		BtnMul = (Button)findViewById(R.id.BtnMul);
		BtnDiv = (Button)findViewById(R.id.BtnDiv);
		BtnDot = (Button)findViewById(R.id.BtnDot);
		BtnEqual = (Button)findViewById(R.id.BtnEqual);
		//分别声明了每个符号按钮
		
		c1 = (EditText)findViewById(R.id.c1);
		//声明了输出文本框
		
		for(int i = 0;i<10;i++){
			Btn[i].setOnClickListener(this);		//对每个数字按钮进行监听
		}
		
		BtnClr.setOnClickListener(this);
		BtnAdd.setOnClickListener(this);
		BtnSub.setOnClickListener(this);
		BtnMul.setOnClickListener(this);
		BtnDiv.setOnClickListener(this);
		BtnDot.setOnClickListener(this);
		BtnEqual.setOnClickListener(this);
		//对每个符号按钮进行监听
		
		B[0] = R.id.Btn0;
		B[1] = R.id.Btn1;
		B[2] = R.id.Btn2;
		B[3] = R.id.Btn3;
		B[4] = R.id.Btn4;
		B[5] = R.id.Btn5;
		B[6] = R.id.Btn6;
		B[7] = R.id.Btn7;
		B[8] = R.id.Btn8;
		B[9] = R.id.Btn9;
		//将数字按钮的ID赋值给数组B
		
		df = new DecimalFormat("0.#####");
		df1 = new DecimalFormat("0.###E00000");
		
	}


	public void onClick(View v) {
		int sourse = v.getId();//获得按键响应的ID
		
		//如果按下的数据按钮，将按下的按钮追加到当前文本框字符串之后
		for(int i = 0; i<=9; i++){
			if(sourse == B[i]){			//通过对数字的循环判断来获得所按的数字
				if(prebtn.equals("operation")){		//判断上一步操作的是什么，operation表示符号，data表示数字，dot表示小数点
					c1.setText(Integer.toString(i));	//由于上一步进行了符号操作，所以数字按钮响应后要重新计数
					Editable ea= c1.getText();
			    	Selection.setSelection(ea, ea.length());
				}
				else if(c1.getText().equals("0")){			//去掉输入的首部零
					c1.setText(Integer.toString(i));	
					Editable ea= c1.getText();  //etEdit为EditText
			    	Selection.setSelection(ea, ea.length());
				}		
				else
				{
					if(c1.getText().length()<=13){			//输入数字最长为13位
						c1.setText(c1.getText()+Integer.toString(i));
						Editable ea= c1.getText();  //etEdit为EditText'
				    	Selection.setSelection(ea, ea.length());
					}
					//设置输入数字的最大极限		
				}
				prebtn = "data";
			}
		}
		
		//按下“.“按钮时，判断当前的文本框内字符串中含不含“.”，如果含，则不允许再插入“.”
		if(sourse == R.id.BtnDot ){
			boolean isInclude = false;			//当值为false时可以输入“.”，当为true时不可输入
			if(c1.getText().length() == 0)
				isInclude = true;
				for(int i = 0; i<c1.getText().length();i++)
					if(c1.getText().charAt(i)=='.'){
						isInclude = true;
						break;
				}
				if(isInclude == false){
					c1.setText(c1.getText()+".");
					Editable ea= c1.getText();  //etEdit为EditText
		    		Selection.setSelection(ea, ea.length());
				}
				prebtn = "dot";
		}
		
		//当按下符号按钮的时候，将每个按钮追加到当前的文本框之后
		if((sourse == R.id.BtnAdd||sourse == R.id.BtnSub||sourse == R.id.BtnMul||sourse == R.id.BtnDiv)){
			sum[j++]=Float.parseFloat(c1.getText().toString());
			if(sourse == R.id.BtnAdd ){			//+操作
				c1.setText("+");	
				oprater[k++]="+";		//将符号保存到数组中，k++
				prebtn = "operation";	//给prebtn赋值用来记录上一操作是什么
			}
					
			if(sourse == R.id.BtnSub){			//-操作
				c1.setText("-");	
				oprater[k++]="-";
				prebtn = "operation";
			}
					
			if(sourse == R.id.BtnMul){			//*操作
				c1.setText("*");	
				oprater[k++]="*";
				prebtn = "operation";
			}
					
			if(sourse == R.id.BtnDiv){			// /操作
				c1.setText("/");	
				oprater[k++]="/";
				prebtn = "operation";
			}
			Editable ea= c1.getText();
	    	Selection.setSelection(ea, ea.length());
		}
				
		if(sourse == R.id.BtnEqual ) {	//=操作
			sum[j++]=Float.parseFloat(c1.getText().toString());		//当按下“=”时要保存最后的运算数字进入数字数组
			c1.setText("");						//要将文本框清空
			oprater[k++]="=";					//将操作符号“=”保存到符号数组
			for(int i=0;i<j;i++){
				c1.setText(c1.getText().toString()+sum[i]+oprater[i]);
			}									//在文本框中显示在数字数组和符号数组的东西
			
			//这下面的一部分无法实现优先级的四则运算，只可以按顺序计算
			/*float s = 0;
			s=sum[0];
			for(int i=1;i<j;i++){				
				if(oprater[i-1].equals("*")) s=s*sum[i];
				else if(oprater[i-1].equals("/")) s=s/sum[i];
				else if(oprater[i-1].equals("+")) s=s+sum[i];
				else if(oprater[i-1].equals("-")) s=s-sum[i];
			}
			c1.setText(c1.getText().toString()+s);*/
				
			//用于计算输入的多项式，按优先级进行运算
			for(int i=0;i<j;){							//对数字数组中的量循环查看
				if(oprater[i].equals("*")) {			//并使用同样的变量i来检查符号数组中的符号是否是优先级大的*和/
					sum[i]=sum[i]*sum[i+1];				//如果是优先级大的*和/就将数字数组中对应的两个数先进行元算
					for(int m=i+1;m<j;m++) {			//用循环语句来将数字数组和符号数组重新排序
						sum[m]=sum[m+1];
						oprater[m-1]=oprater[m];
					}
					j--;								//每运行完一次就会少一个量，所以j--
				}											
				else if(oprater[i].equals("/")) {
					sum[i]=sum[i]/sum[i+1];
					for(int m=i+1;m<j;m++) {
						sum[m]=sum[m+1];
						oprater[m-1]=oprater[m];
					}
					j--;
				}
				else {i++;}								//只有在字符数组不为*或/的时候才对i进行累计
			}
		
			/*for(int i=0;i<j;i++){					//与上面的*和/的思路一样，不过由于已经进行优先级的运算
				if(oprater[i].equals("+")) {		//了现在就是没计算一次就重新排序两个数组
					sum[i]=sum[i]+sum[i+1];
					for(int m=i+1;m<j;m++) {
						sum[m]=sum[m+1];
						oprater[m-1]=oprater[m];
					}
					j--;
				}
				if(oprater[i].equals("-")) {
					sum[i]=sum[i]-sum[i+1];
					for(int m=i+1;m<j;m++) {
						sum[m]=sum[m+1];
						oprater[m-1]=oprater[m];
					}
					j--;
				}		
			}*/
			float s = 0;
			s=sum[0];
			for(int i=1;i<j;i++){				
				if(oprater[i-1].equals("+")) s=s+sum[i];
				else if(oprater[i-1].equals("-")) s=s-sum[i];
			}
			c1.setText(c1.getText().toString()+"\n"+s);			//将计算的结果和多项式整体显示在文本框
		}
		
		if(sourse == R.id.BtnClr){					//用来对清除的，分别把变量和数组都清空
			prebtn = "";
			k=j=0;
			for(int i=0;i<sum.length;i++)
				sum[i]=0;
			for(int i=0;i<oprater.length;i++)
				oprater[i]="";
			c1.setText("");
		}
	}
}
