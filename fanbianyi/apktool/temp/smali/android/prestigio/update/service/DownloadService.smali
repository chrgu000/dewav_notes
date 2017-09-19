.class public Landroid/prestigio/update/service/DownloadService;
.super Landroid/app/Service;
.source "DownloadService.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DownloadService"


# instance fields
.field private mAcceptRanges:Z

.field private mContentLength:J

.field private mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

.field private mUri:Ljava/lang/String;

.field private mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 18
    iput-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    .line 19
    iput-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mUri:Ljava/lang/String;

    .line 22
    iput-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    return-void
.end method

.method public static startDownloadService()V
    .locals 6

    .prologue
    .line 115
    const-string v0, "DownloadService"

    const-string v1, "startDownloadService"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    .line 117
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaUri()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 118
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    const-class v5, Landroid/prestigio/update/service/DownloadService;

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 116
    invoke-virtual {v0, v1}, Landroid/prestigio/update/UpdateApplication;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 119
    return-void
.end method

.method public static stopDownloadService()Z
    .locals 6

    .prologue
    .line 122
    const-string v0, "DownloadService"

    const-string v1, "stopDownloadService"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.ACTION_SHUTDOWN"

    const-string v3, ""

    .line 124
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    const-class v5, Landroid/prestigio/update/service/DownloadService;

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 123
    invoke-virtual {v0, v1}, Landroid/prestigio/update/UpdateApplication;->stopService(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2
    .parameter "arg0"

    .prologue
    .line 110
    const-string v0, "DownloadService"

    const-string v1, "onBind"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 0

    .prologue
    .line 26
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 27
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 31
    const-string v0, "DownloadService"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->cancel(Z)Z

    .line 34
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    .line 37
    :cond_0
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 38
    return-void
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 64
    const-string v0, "DownloadService"

    const-string v1, "onLowMemory"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-super {p0}, Landroid/app/Service;->onLowMemory()V

    .line 66
    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .locals 2
    .parameter "intent"

    .prologue
    .line 58
    const-string v0, "DownloadService"

    const-string v1, "onRebind"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    .line 60
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2
    .parameter "intent"
    .parameter "startId"

    .prologue
    .line 42
    const-string v0, "DownloadService"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 9
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 70
    const-string v0, "DownloadService"

    const-string v1, "onStartCommand"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaUri()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    .line 72
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    const-string v1, "#"

    const-string v2, "&"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    .line 75
    :cond_0
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    iput-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mUri:Ljava/lang/String;

    .line 76
    const-string v0, "DownloadService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Service start download from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    if-eqz v0, :cond_1

    .line 78
    const-string v0, "DownloadService"

    const-string v1, "mDownloadFileAsyncTask != null"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    invoke-virtual {v0, v7}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->cancel(Z)Z

    .line 80
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    iput-boolean v8, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    .line 83
    :cond_1
    new-instance v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    iget-object v2, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    iget-object v3, p0, Landroid/prestigio/update/service/DownloadService;->mUri:Ljava/lang/String;

    iget-wide v4, p0, Landroid/prestigio/update/service/DownloadService;->mContentLength:J

    iget-boolean v6, p0, Landroid/prestigio/update/service/DownloadService;->mAcceptRanges:Z

    invoke-direct/range {v1 .. v6}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;-><init>(Ljava/lang/String;Ljava/lang/String;JZ)V

    iput-object v1, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    .line 84
    iget-object v0, p0, Landroid/prestigio/update/service/DownloadService;->mDownloadFileAsyncTask:Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;

    sget-object v1, Landroid/os/AsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v2, v7, [Ljava/lang/String;

    iget-object v3, p0, Landroid/prestigio/update/service/DownloadService;->mUrl:Ljava/lang/String;

    aput-object v3, v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 86
    return v7
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .locals 2
    .parameter "rootIntent"

    .prologue
    .line 98
    const-string v0, "DownloadService"

    const-string v1, "onTaskRemoved"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    .line 100
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 3
    .parameter "level"

    .prologue
    .line 92
    const-string v0, "DownloadService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onTrimMemory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-super {p0, p1}, Landroid/app/Service;->onTrimMemory(I)V

    .line 94
    return-void
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 2
    .parameter "intent"

    .prologue
    .line 104
    const-string v0, "DownloadService"

    const-string v1, "onUnbind"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method
