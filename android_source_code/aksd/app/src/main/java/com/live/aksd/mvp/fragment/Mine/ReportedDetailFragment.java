package com.live.aksd.mvp.fragment.Mine;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.jude.easyrecyclerview.adapter.RecyclerArrayAdapter;
import com.king.base.util.ToastUtils;
import com.live.aksd.R;
import com.live.aksd.bean.ReportedBean;
import com.live.aksd.bean.UserBean;
import com.live.aksd.mvp.adapter.Home.ImageAdapter;
import com.live.aksd.mvp.base.BaseFragment;
import com.live.aksd.mvp.fragment.image.ShowPictureActivity;
import com.live.aksd.mvp.presenter.Mine.ReportedDetailPresenter;
import com.live.aksd.mvp.view.Mine.IReportedDetailView;
import com.live.aksd.util.CustomDialog;
import com.live.aksd.util.SpSingleInstance;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import butterknife.BindView;
import butterknife.OnClick;


/**
 * @author Created by stone
 * @since 17/8/24
 */

public class ReportedDetailFragment extends BaseFragment<IReportedDetailView, ReportedDetailPresenter> implements IReportedDetailView {


    @BindView(R.id.tvTitle)
    TextView tvTitle;
    @BindView(R.id.tvName)
    TextView tvName;
    @BindView(R.id.tvPhone)
    TextView tvPhone;
    @BindView(R.id.tvAddress)
    TextView tvAddress;
    @BindView(R.id.tvAddressDetail)
    TextView tvAddressDetail;
    @BindView(R.id.recyclerView)
    RecyclerView recyclerView;
    @BindView(R.id.btnDelete)
    Button btnDelete;


    private Map<String, String> map = new HashMap<>();
    private UserBean userBean;
    private ImageAdapter adapter;
    private List<String> list;

    private String reportedId;

    public static ReportedDetailFragment newIntance(String reportedId) {
        Bundle args = new Bundle();
        ReportedDetailFragment fragment = new ReportedDetailFragment();
        fragment.reportedId = reportedId;
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public int getRootViewId() {
        return R.layout.fragment_reported_detail;
    }

    @Override
    public void initUI() {
        tvTitle.setText("报备详情");
        final LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getContext());
        linearLayoutManager.setOrientation(LinearLayoutManager.HORIZONTAL);
        recyclerView.setLayoutManager(linearLayoutManager);
        list = new ArrayList<>();
        adapter = new ImageAdapter(getContext(), list);
        recyclerView.setAdapter(adapter);
        adapter.setOnItemClickListener(new RecyclerArrayAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(int position) {
                Intent intent = new Intent(getContext(), ShowPictureActivity.class);
                intent.putExtra("imagelist", (Serializable) adapter.getAllData());
                intent.putExtra("position", position);
                getContext().startActivity(intent);
            }
        });


    }

    @Override
    public void initData() {
        userBean = SpSingleInstance.getSpSingleInstance().getUserBean();
        map.put("member_id", userBean.getMember_id());
        map.put("member_token", userBean.getMember_token());
        map.put("reported_id", reportedId);
        getPresenter().getReportedDetail(map);

    }


    @Override
    public void onGetReportedDetail(ReportedBean data) {

        if ("success".equals(data.getReported_state())) {
            btnDelete.setVisibility(View.VISIBLE);
        } else {
            btnDelete.setVisibility(View.GONE);
        }

        tvName.setText(data.getReported_name());
        tvPhone.setText(data.getReported_phone());
        tvAddress.setText(data.getProvince() + " " + data.getCity() + " " + data.getDistrict());
        tvAddressDetail.setText(data.getDetail());
        adapter.clear();
        if (!data.getReported_img1().isEmpty()) {
            adapter.add(data.getReported_img1());
        }
        if (!data.getReported_img2().isEmpty()) {
            adapter.add(data.getReported_img2());
        }
        if (!data.getReported_img3().isEmpty()) {
            adapter.add(data.getReported_img3());
        }
        adapter.notifyDataSetChanged();

    }



    @Override
    public void onDeleteReported(String data) {
        ToastUtils.showToast(context.getApplicationContext(), data);
        finish();
    }

    @Override
    public void showProgress() {

    }

    @Override
    public void onCompleted() {

    }

    @Override
    public void onError(Throwable e) {

    }

    @Override
    public ReportedDetailPresenter createPresenter() {
        return new ReportedDetailPresenter(getApp());
    }


    @OnClick({R.id.ivLeft, R.id.btnDelete})
    public void onViewClicked(View view) {
        switch (view.getId()) {
            case R.id.ivLeft:
                finish();
                break;

            case R.id.btnDelete:
                final CustomDialog.Builder builder = new CustomDialog.Builder(context);
                builder.setMessage("是否确认删除此条报备");
                builder.setPositiveButton("是", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        getPresenter().deleteReported(map);
                        dialog.dismiss();
                    }
                });
                builder.setNegativeButton("否", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
                builder.onCreate().show();

                break;


        }
    }


}
