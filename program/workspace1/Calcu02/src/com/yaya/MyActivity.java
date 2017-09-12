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
	private Button[]Btn= new Button[10];	//����10�����ְ�ť	
	private Button BtnClr,BtnSub,BtnAdd,BtnMul,BtnDiv,BtnDot,BtnEqual;		//������������ź��������
	private EditText c1;		//������������ı���
	private int[] B = new int[10];		//������һ���������������������ְ�ť��ID��
	private float[] sum=new float[100];		//������һ�����������������������������������
	private String[] oprater=new String[100];		//������һ���ַ����͵��������������������	
	private int k=0,j=0;	
	private String prebtn ="";			//��������ǰһ����ť����
	DecimalFormat df;		
	DecimalFormat df1;
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);			
		//����ʾ�����
		
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
		//�ֱ�������ÿ�����ְ�ť
		
		BtnClr = (Button)findViewById(R.id.BtnClr);
		BtnAdd = (Button)findViewById(R.id.BtnAdd);
		BtnSub = (Button)findViewById(R.id.BtnSub);
		BtnMul = (Button)findViewById(R.id.BtnMul);
		BtnDiv = (Button)findViewById(R.id.BtnDiv);
		BtnDot = (Button)findViewById(R.id.BtnDot);
		BtnEqual = (Button)findViewById(R.id.BtnEqual);
		//�ֱ�������ÿ�����Ű�ť
		
		c1 = (EditText)findViewById(R.id.c1);
		//����������ı���
		
		for(int i = 0;i<10;i++){
			Btn[i].setOnClickListener(this);		//��ÿ�����ְ�ť���м���
		}
		
		BtnClr.setOnClickListener(this);
		BtnAdd.setOnClickListener(this);
		BtnSub.setOnClickListener(this);
		BtnMul.setOnClickListener(this);
		BtnDiv.setOnClickListener(this);
		BtnDot.setOnClickListener(this);
		BtnEqual.setOnClickListener(this);
		//��ÿ�����Ű�ť���м���
		
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
		//�����ְ�ť��ID��ֵ������B
		
		df = new DecimalFormat("0.#####");
		df1 = new DecimalFormat("0.###E00000");
		
	}


	public void onClick(View v) {
		int sourse = v.getId();//��ð�����Ӧ��ID
		
		//������µ����ݰ�ť�������µİ�ť׷�ӵ���ǰ�ı����ַ���֮��
		for(int i = 0; i<=9; i++){
			if(sourse == B[i]){			//ͨ�������ֵ�ѭ���ж����������������
				if(prebtn.equals("operation")){		//�ж���һ����������ʲô��operation��ʾ���ţ�data��ʾ���֣�dot��ʾС����
					c1.setText(Integer.toString(i));	//������һ�������˷��Ų������������ְ�ť��Ӧ��Ҫ���¼���
					Editable ea= c1.getText();
			    	Selection.setSelection(ea, ea.length());
				}
				else if(c1.getText().equals("0")){			//ȥ��������ײ���
					c1.setText(Integer.toString(i));	
					Editable ea= c1.getText();  //etEditΪEditText
			    	Selection.setSelection(ea, ea.length());
				}		
				else
				{
					if(c1.getText().length()<=13){			//���������Ϊ13λ
						c1.setText(c1.getText()+Integer.toString(i));
						Editable ea= c1.getText();  //etEditΪEditText'
				    	Selection.setSelection(ea, ea.length());
					}
					//�����������ֵ������		
				}
				prebtn = "data";
			}
		}
		
		//���¡�.����ťʱ���жϵ�ǰ���ı������ַ����к�������.������������������ٲ��롰.��
		if(sourse == R.id.BtnDot ){
			boolean isInclude = false;			//��ֵΪfalseʱ�������롰.������Ϊtrueʱ��������
			if(c1.getText().length() == 0)
				isInclude = true;
				for(int i = 0; i<c1.getText().length();i++)
					if(c1.getText().charAt(i)=='.'){
						isInclude = true;
						break;
				}
				if(isInclude == false){
					c1.setText(c1.getText()+".");
					Editable ea= c1.getText();  //etEditΪEditText
		    		Selection.setSelection(ea, ea.length());
				}
				prebtn = "dot";
		}
		
		//�����·��Ű�ť��ʱ�򣬽�ÿ����ť׷�ӵ���ǰ���ı���֮��
		if((sourse == R.id.BtnAdd||sourse == R.id.BtnSub||sourse == R.id.BtnMul||sourse == R.id.BtnDiv)){
			sum[j++]=Float.parseFloat(c1.getText().toString());
			if(sourse == R.id.BtnAdd ){			//+����
				c1.setText("+");	
				oprater[k++]="+";		//�����ű��浽�����У�k++
				prebtn = "operation";	//��prebtn��ֵ������¼��һ������ʲô
			}
					
			if(sourse == R.id.BtnSub){			//-����
				c1.setText("-");	
				oprater[k++]="-";
				prebtn = "operation";
			}
					
			if(sourse == R.id.BtnMul){			//*����
				c1.setText("*");	
				oprater[k++]="*";
				prebtn = "operation";
			}
					
			if(sourse == R.id.BtnDiv){			// /����
				c1.setText("/");	
				oprater[k++]="/";
				prebtn = "operation";
			}
			Editable ea= c1.getText();
	    	Selection.setSelection(ea, ea.length());
		}
				
		if(sourse == R.id.BtnEqual ) {	//=����
			sum[j++]=Float.parseFloat(c1.getText().toString());		//�����¡�=��ʱҪ���������������ֽ�����������
			c1.setText("");						//Ҫ���ı������
			oprater[k++]="=";					//���������š�=�����浽��������
			for(int i=0;i<j;i++){
				c1.setText(c1.getText().toString()+sum[i]+oprater[i]);
			}									//���ı�������ʾ����������ͷ�������Ķ���
			
			//�������һ�����޷�ʵ�����ȼ����������㣬ֻ���԰�˳�����
			/*float s = 0;
			s=sum[0];
			for(int i=1;i<j;i++){				
				if(oprater[i-1].equals("*")) s=s*sum[i];
				else if(oprater[i-1].equals("/")) s=s/sum[i];
				else if(oprater[i-1].equals("+")) s=s+sum[i];
				else if(oprater[i-1].equals("-")) s=s-sum[i];
			}
			c1.setText(c1.getText().toString()+s);*/
				
			//���ڼ�������Ķ���ʽ�������ȼ���������
			for(int i=0;i<j;){							//�����������е���ѭ���鿴
				if(oprater[i].equals("*")) {			//��ʹ��ͬ���ı���i�������������еķ����Ƿ������ȼ����*��/
					sum[i]=sum[i]*sum[i+1];				//��������ȼ����*��/�ͽ����������ж�Ӧ���������Ƚ���Ԫ��
					for(int m=i+1;m<j;m++) {			//��ѭ�����������������ͷ���������������
						sum[m]=sum[m+1];
						oprater[m-1]=oprater[m];
					}
					j--;								//ÿ������һ�ξͻ���һ����������j--
				}											
				else if(oprater[i].equals("/")) {
					sum[i]=sum[i]/sum[i+1];
					for(int m=i+1;m<j;m++) {
						sum[m]=sum[m+1];
						oprater[m-1]=oprater[m];
					}
					j--;
				}
				else {i++;}								//ֻ�����ַ����鲻Ϊ*��/��ʱ��Ŷ�i�����ۼ�
			}
		
			/*for(int i=0;i<j;i++){					//�������*��/��˼·һ�������������Ѿ��������ȼ�������
				if(oprater[i].equals("+")) {		//�����ھ���û����һ�ξ�����������������
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
			c1.setText(c1.getText().toString()+"\n"+s);			//������Ľ���Ͷ���ʽ������ʾ���ı���
		}
		
		if(sourse == R.id.BtnClr){					//����������ģ��ֱ�ѱ��������鶼���
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
