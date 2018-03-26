package com.live.aksd.mvp.presenter.Mine;

import com.live.aksd.App;
import com.live.aksd.bean.TrainingListBean;
import com.live.aksd.http.HttpResult;
import com.live.aksd.mvp.base.BasePresenter;
import com.live.aksd.mvp.view.Mine.ITrainingClassView;

import java.util.List;
import java.util.Map;

import io.reactivex.Observer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.schedulers.Schedulers;

/**
 * @author Created by stone
 * @since 17/10/10
 */

public class TrainingClassPresenter  extends BasePresenter<ITrainingClassView>{
    public TrainingClassPresenter(App app) {
        super(app);
    }

    public void getTrainingList(Map<String, String> map) {
        getAppComponent().getAPIService()
                .getTrainingList(map)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(new Observer<HttpResult<List<TrainingListBean>>>() {

                    @Override
                    public void onError(Throwable e) {
                        if (isViewAttached())
                            getView().onError(e);
                    }

                    @Override
                    public void onComplete() {

                    }

                    @Override
                    public void onSubscribe(Disposable d) {

                    }

                    @Override
                    public void onNext(HttpResult<List<TrainingListBean>> userBeanHttpResult) {
                        if (userBeanHttpResult != null) {
                            if (isViewAttached()) {
                                getView().onGetTrainingList(userBeanHttpResult.getData());
                            }
                        }
                    }
                });
    }
}
