package com.live.aksd.mvp.adapter.Mine;

import android.content.Context;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.jude.easyrecyclerview.adapter.BaseViewHolder;
import com.jude.easyrecyclerview.adapter.RecyclerArrayAdapter;
import com.live.aksd.R;
import com.live.aksd.bean.UserMessageBean;

import java.util.List;

/**
 * @author Created by stone
 * @since 17/8/24
 */

public class OrderMessageAdapter extends RecyclerArrayAdapter<UserMessageBean> {


    public OrderMessageAdapter(Context context, List<UserMessageBean> objects) {
        super(context, objects);
    }

    @Override
    public BaseViewHolder OnCreateViewHolder(ViewGroup parent, int viewType) {
        return new ListBeanViewHolder(parent);
    }

    public class ListBeanViewHolder extends BaseViewHolder<UserMessageBean> {

        TextView create_time,msg_desc,order_no,order_goods_name;
        ImageView img_order;

        public ListBeanViewHolder(ViewGroup parent) {
            super(parent, R.layout.item_order_message);

            create_time = $(R.id.create_time);
            msg_desc = $(R.id.msg_desc);
            order_no = $(R.id.order_no);
            img_order = $(R.id.img_order);
            order_goods_name = $(R.id.order_goods_name);

        }

        @Override
        public void setData(UserMessageBean data) {
            super.setData(data);
            if(data.getMsg_type().equals("system")){
            }
            create_time.setText(data.getCreate_time().substring(0,19));
            msg_desc.setText(data.getMsg_desc());
            order_no.setText("运单号："+data.getOrder_no());



        }
    }
}
