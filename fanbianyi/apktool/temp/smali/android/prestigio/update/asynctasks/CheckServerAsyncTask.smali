.class public Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;
.super Landroid/os/AsyncTask;
.source "CheckServerAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Landroid/prestigio/update/asynctasks/CheckNewVersionResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CheckServerAsyncTask"


# instance fields
.field private mActivity:Landroid/prestigio/update/activity/SettingsActivity;

.field public mProgressDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 2
    .parameter "activity"

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 26
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 22
    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    .line 23
    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 27
    iput-object p1, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    .line 28
    invoke-virtual {p1}, Landroid/prestigio/update/activity/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    if-ne v0, v1, :cond_0

    .line 29
    invoke-virtual {p1, v1}, Landroid/prestigio/update/activity/SettingsActivity;->setRequestedOrientation(I)V

    .line 33
    :goto_0
    return-void

    .line 31
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/prestigio/update/activity/SettingsActivity;->setRequestedOrientation(I)V

    goto :goto_0
.end method


# virtual methods
.method public attach(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 0
    .parameter "activity"

    .prologue
    .line 81
    iput-object p1, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    .line 82
    return-void
.end method

.method public detach()V
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    .line 78
    return-void
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/prestigio/update/asynctasks/CheckNewVersionResult;
    .locals 4
    .parameter "params"

    .prologue
    .line 59
    sget-object v1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->NOT_AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    .line 60
    .local v1, result:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;
    invoke-static {}, Landroid/prestigio/update/utils/HttpConnectionUtils;->isInternetConnected()Z

    move-result v2

    if-nez v2, :cond_0

    .line 61
    const-string v2, "CheckServerAsyncTask"

    const-string v3, "NO_INTERNET_CONNECTION"

    invoke-static {v2, v3}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    sget-object v2, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->NO_INTERNET_CONNECTION:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    .line 73
    :goto_0
    return-object v2

    .line 65
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/prestigio/update/service/CheckNewVersionService;->requestRemoteServerForUpdate()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 66
    const/4 v2, 0x1

    invoke-static {v2}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setFoundNewVersion(Z)V

    .line 67
    sget-object v1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    move-object v2, v1

    .line 73
    goto :goto_0

    .line 69
    :catch_0
    move-exception v0

    .line 70
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "CheckServerAsyncTask"

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 20
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->doInBackground([Ljava/lang/Void;)Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/prestigio/update/asynctasks/CheckNewVersionResult;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 87
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 88
    const-string v0, "CheckServerAsyncTask"

    const-string v1, "onPostExecute"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    .line 90
    const-string v0, "CheckServerAsyncTask"

    const-string v1, "mProgressDialog != null"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    const-string v0, "CheckServerAsyncTask"

    const-string v1, "mProgressDialog.isShowing == true"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 101
    :goto_0
    sget-object v0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$2;->$SwitchMap$android$prestigio$update$asynctasks$CheckNewVersionResult:[I

    invoke-virtual {p1}, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 115
    :goto_1
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->setRequestedOrientation(I)V

    .line 116
    return-void

    .line 96
    :cond_0
    const-string v0, "CheckServerAsyncTask"

    const-string v1, "mProgressDialog.isShowing == false"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 99
    :cond_1
    const-string v0, "CheckServerAsyncTask"

    const-string v1, "mProgressDialog == null"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 103
    :pswitch_0
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_1

    .line 107
    :pswitch_1
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_1

    .line 111
    :pswitch_2
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_1

    .line 101
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 20
    check-cast p1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    invoke-virtual {p0, p1}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->onPostExecute(Landroid/prestigio/update/asynctasks/CheckNewVersionResult;)V

    return-void
.end method

.method public onPreExecute()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 37
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 38
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 39
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mActivity:Landroid/prestigio/update/activity/SettingsActivity;

    const/high16 v2, 0x7f04

    invoke-virtual {v1, v2}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 40
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 41
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 42
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    new-instance v1, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$1;

    invoke-direct {v1, p0}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$1;-><init>(Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 51
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 52
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 55
    :cond_0
    return-void
.end method
