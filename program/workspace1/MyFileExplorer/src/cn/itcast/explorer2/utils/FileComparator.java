package cn.itcast.explorer2.utils;

import java.io.File;
import java.util.Comparator;

public class FileComparator implements Comparator<File> {

	@Override
	public int compare(File f1, File f2) {
		//1.�ȱȽ��ļ��У����ļ��������б����ǰ�ߣ�������A-Z���ֵ�˳������
		if (f1.isDirectory() && f2.isDirectory()) {
			return f1.getName().compareToIgnoreCase(f2.getName());
		} else {
			//2.�Ƚ��ļ��к��ļ�
			if (f1.isDirectory() && f2.isFile()) {
				return -1;
			} else if (f1.isFile() && f2.isDirectory()) {//3.�Ƚ��ļ����ļ���
				return 1;
			} else {
				//4.�Ƚ��ļ�
				return f1.getName().compareToIgnoreCase(f2.getName());
			}
			
		}
		
	}

}
