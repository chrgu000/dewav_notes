package com.live.aksd.mvp.view.WordOrder;

import com.live.aksd.bean.WorkOrderBean;
import com.live.aksd.mvp.base.BaseView;

import java.util.List;

/**
 * Created by sh-lx on 2017/8/21.
 */

public interface IAWordView extends BaseView {
    void onOrderListByState(List<WorkOrderBean> data);
}
