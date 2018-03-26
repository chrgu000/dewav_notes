package com.live.aksd.util;


import com.live.aksd.bean.UserBean;

/**
 * Created by lenove on 2016/9/1.
 */
public class SpSingleInstance {
    private static SpSingleInstance sp;
    public UserBean userBean;
    private SpSingleInstance(){};
    public static synchronized SpSingleInstance  getSpSingleInstance(){
        if(sp==null){
            sp=new SpSingleInstance();
            return sp;
        }

        return  sp;
    }


    public void setUserBean(UserBean userBean) {
        this.userBean = userBean;
    }
    public  UserBean getUserBean(){
            //userBean=SPUtils.getObj1(context, Constant.USER_BEAN);
        return userBean;
    }

}
