package cn.itcast.explorer2.utils;

import java.io.File;
import java.io.FileFilter;

public class MyFileFilter implements FileFilter {

	@Override
	public boolean accept(File pathname) {
		if (!pathname.getName().startsWith(".")) {
			return true;
		} else {
			return false;
		}
	}

}
