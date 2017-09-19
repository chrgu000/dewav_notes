.class public Landroid/prestigio/update/broadcastreceiver/ServiceBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ServiceBroadcastReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v8, 0x0

    .line 19
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaVersion()Ljava/lang/String;

    move-result-object v5

    .line 20
    .local v5, otaVersion:Ljava/lang/String;
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getSystemVersion()Ljava/lang/String;

    move-result-object v6

    .line 21
    .local v6, systemVersion:Ljava/lang/String;
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 22
    invoke-static {v8}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setFoundNewVersion(Z)V

    .line 23
    invoke-static {v8}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInProgress(Z)V

    .line 24
    invoke-static {v8}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadComplete(Z)V

    .line 25
    invoke-static {v8}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInPause(Z)V

    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f040020

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setLastUpdateString(Ljava/lang/String;)V

    .line 27
    const-string v7, ""

    invoke-static {v7}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setUpdateLog(Ljava/lang/String;)V

    .line 28
    const-string v7, ""

    invoke-static {v7}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaName(Ljava/lang/String;)V

    .line 29
    const-string v7, ""

    invoke-static {v7}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaUri(Ljava/lang/String;)V

    .line 30
    const-wide/16 v8, 0x0

    invoke-static {v8, v9}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaPackageLength(J)V

    .line 31
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->clearOtaVersion()V

    .line 33
    new-instance v4, Landroid/content/Intent;

    const-class v7, Landroid/prestigio/update/activity/NewVersionInstalledActivity;

    invoke-direct {v4, p1, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 34
    .local v4, msg:Landroid/content/Intent;
    sget-object v7, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->EXTRA_VERSION:Ljava/lang/String;

    invoke-virtual {v4, v7, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    const/high16 v7, 0x1000

    invoke-virtual {v4, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 36
    invoke-virtual {p1, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .end local v4           #msg:Landroid/content/Intent;
    :cond_0
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isAutoCheck()Z

    move-result v1

    .line 40
    .local v1, isAutoCheck:Z
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInProgress()Z

    move-result v3

    .line 41
    .local v3, isDownloadInProgress:Z
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadComplete()Z

    move-result v2

    .line 43
    .local v2, isDownloadComplete:Z
    if-eqz v1, :cond_1

    if-nez v3, :cond_1

    .line 44
    new-instance v7, Landroid/content/Intent;

    const-string v8, "android.intent.action.VIEW"

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaUri()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    const-class v11, Landroid/prestigio/update/service/CheckNewVersionService;

    invoke-direct {v7, v8, v9, v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 44
    invoke-virtual {p1, v7}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 49
    :cond_1
    invoke-static {}, Landroid/prestigio/update/utils/HttpConnectionUtils;->isInternetConnected()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 50
    if-eqz v3, :cond_2

    if-nez v2, :cond_2

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v7

    if-nez v7, :cond_2

    .line 52
    const-wide/16 v8, 0x7d0

    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :goto_0
    invoke-static {}, Landroid/prestigio/update/service/DownloadService;->startDownloadService()V

    .line 60
    :cond_2
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
