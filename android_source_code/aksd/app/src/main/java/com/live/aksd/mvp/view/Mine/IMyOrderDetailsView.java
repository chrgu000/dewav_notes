package com.live.aksd.mvp.view.Mine;

import com.live.aksd.bean.OrderBeanNew;
import com.live.aksd.mvp.base.BaseView;

/**
 * @author Created by stone
 * @since 17/8/30
 */

public interface IMyOrderDetailsView extends BaseView {


    void onOneOrderDetail(OrderBeanNew data);

    void onCancelOrder(String data);

    void onConfirmOrder(String data);

    void onPayRealOrders(String data);
}
