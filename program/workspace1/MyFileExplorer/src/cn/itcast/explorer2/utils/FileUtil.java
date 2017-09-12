package cn.itcast.explorer2.utils;

import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class FileUtil {

	public static File[] sort(File[] listFiles) {
		
		List<File> list = Arrays.asList(listFiles);
		
		Collections.sort(list, new FileComparator());
		
		File[] array = list.toArray(new File[list.size()]);
		
		return array;
	}
	
}
