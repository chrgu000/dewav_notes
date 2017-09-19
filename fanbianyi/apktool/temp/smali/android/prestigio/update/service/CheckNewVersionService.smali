.class public Landroid/prestigio/update/service/CheckNewVersionService;
.super Landroid/app/Service;
.source "CheckNewVersionService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PrestigioUpdateService"


# instance fields
.field private mLastNotificationShowTime:J

.field private mLastUpdateTime:J

.field private mUpdateTimeTask:Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;

.field private mUpdateTimer:Ljava/util/Timer;

.field private notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-wide/16 v0, 0x0

    .line 51
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 54
    iput-wide v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastNotificationShowTime:J

    .line 55
    iput-wide v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastUpdateTime:J

    .line 57
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimer:Ljava/util/Timer;

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimeTask:Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;

    .line 59
    new-instance v0, Landroid/prestigio/update/utils/NotificationUtils;

    invoke-direct {v0}, Landroid/prestigio/update/utils/NotificationUtils;-><init>()V

    iput-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    return-void
.end method

.method static synthetic access$100(Landroid/prestigio/update/service/CheckNewVersionService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/prestigio/update/service/CheckNewVersionService;->checkNewVersion()V

    return-void
.end method

.method private checkNewVersion()V
    .locals 6

    .prologue
    .line 115
    iget-wide v2, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastNotificationShowTime:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 116
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastNotificationShowTime:J

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x493e0

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 117
    iget-object v2, p0, Landroid/prestigio/update/service/CheckNewVersionService;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    invoke-virtual {v2}, Landroid/prestigio/update/utils/NotificationUtils;->cancelSystemUpdateFoundNotification()V

    .line 119
    :cond_0
    invoke-static {}, Landroid/prestigio/update/utils/HttpConnectionUtils;->isInternetConnected()Z

    move-result v2

    if-nez v2, :cond_2

    .line 120
    const-string v2, "PrestigioUpdateService"

    const-string v3, "offline"

    invoke-static {v2, v3}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    :cond_1
    :goto_0
    return-void

    .line 123
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastUpdateTime:J

    sub-long/2addr v2, v4

    const-wide/32 v4, 0x2932e00

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 124
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastUpdateTime:J

    .line 129
    :try_start_0
    sget-object v2, Landroid/prestigio/update/utils/DateTimeUtils;->SIMPLE_DATE_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, dateTime:Ljava/lang/String;
    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setLastUpdateString(Ljava/lang/String;)V

    .line 131
    iget-wide v2, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastUpdateTime:J

    invoke-static {v2, v3}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setLastUpdateTime(J)V

    .line 132
    invoke-static {}, Landroid/prestigio/update/service/CheckNewVersionService;->requestRemoteServerForUpdate()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 133
    const/4 v2, 0x1

    invoke-static {v2}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setFoundNewVersion(Z)V

    .line 135
    iget-object v2, p0, Landroid/prestigio/update/service/CheckNewVersionService;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    invoke-virtual {v2}, Landroid/prestigio/update/utils/NotificationUtils;->showSystemUpdateFoundNotification()V

    .line 136
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastNotificationShowTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 140
    .end local v0           #dateTime:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 141
    .local v1, e:Ljava/lang/Exception;
    const-string v2, "PrestigioUpdateService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error check new version"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 138
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v0       #dateTime:Ljava/lang/String;
    :cond_3
    const/4 v2, 0x0

    :try_start_1
    invoke-static {v2}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setFoundNewVersion(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static getRemoteUri()Ljava/lang/String;
    .locals 4

    .prologue
    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getRemoteHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/OTA/?product="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 96
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getProductName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&version="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 97
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getSystemVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&SN="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getPhoneSerialNumber()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&LN="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 98
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, res:Ljava/lang/String;
    const-string v1, "PrestigioUpdateService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "URL "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    return-object v0
.end method

.method public static requestRemoteServerForUpdate()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 156
    invoke-static {}, Landroid/prestigio/update/utils/CustomHttpClient;->createHTTClient()Lcz/msebera/android/httpclient/client/HttpClient;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/HttpClient;

    .line 157
    .local v0, httpClient:Lorg/apache/http/client/HttpClient;
    new-instance v4, Ljava/net/URI;

    invoke-static {}, Landroid/prestigio/update/service/CheckNewVersionService;->getRemoteUri()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 158
    .local v4, uri:Ljava/net/URI;
    new-instance v1, Lorg/apache/http/client/methods/HttpHead;

    invoke-direct {v1, v4}, Lorg/apache/http/client/methods/HttpHead;-><init>(Ljava/net/URI;)V

    .line 159
    .local v1, httpHead:Lorg/apache/http/client/methods/HttpHead;
    sget-object v6, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_ACCEPT_LANGUAGE:Lorg/apache/http/Header;

    invoke-virtual {v1, v6}, Lorg/apache/http/client/methods/HttpHead;->setHeader(Lorg/apache/http/Header;)V

    .line 160
    sget-object v6, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_CLIENT_LANGUAGE:Lorg/apache/http/Header;

    invoke-virtual {v1, v6}, Lorg/apache/http/client/methods/HttpHead;->setHeader(Lorg/apache/http/Header;)V

    .line 161
    sget-object v6, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_X_DEVICEID:Lorg/apache/http/Header;

    invoke-virtual {v1, v6}, Lorg/apache/http/client/methods/HttpHead;->setHeader(Lorg/apache/http/Header;)V

    .line 162
    sget-object v6, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_X_DEVICEID2:Lorg/apache/http/Header;

    invoke-virtual {v1, v6}, Lorg/apache/http/client/methods/HttpHead;->setHeader(Lorg/apache/http/Header;)V

    .line 163
    sget-object v6, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_X_ATT_DEVICEID:Lorg/apache/http/Header;

    invoke-virtual {v1, v6}, Lorg/apache/http/client/methods/HttpHead;->setHeader(Lorg/apache/http/Header;)V

    .line 164
    invoke-interface {v0, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 165
    .local v2, httpResponse:Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    const/16 v7, 0xc8

    if-eq v6, v7, :cond_1

    .line 187
    :cond_0
    :goto_0
    return v5

    .line 168
    :cond_1
    const-string v6, "PrestigioUpdateService"

    invoke-static {v6, v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->printHeadersToLog(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V

    .line 169
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getTargetURI(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v3

    .line 170
    .local v3, targetURI:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 171
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "http://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getRemoteHost()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaUri(Ljava/lang/String;)V

    .line 172
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getPackageVersion(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaVersion(Ljava/lang/String;)V

    .line 173
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getOtaPackageName(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaName(Ljava/lang/String;)V

    .line 174
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getDetailInfo(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setUpdateLog(Ljava/lang/String;)V

    .line 175
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getPackageLength(Lorg/apache/http/HttpResponse;)J

    move-result-wide v6

    invoke-static {v6, v7}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaPackageLength(J)V

    .line 176
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getImageFileName(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setFileImgName(Ljava/lang/String;)V

    .line 177
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getImageFilePath(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setFilePathName(Ljava/lang/String;)V

    .line 178
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->isExternal(Lorg/apache/http/HttpResponse;)Z

    move-result v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setIsExternal(Z)V

    .line 179
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getRebootMessage(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setRebootMsg(Ljava/lang/String;)V

    .line 180
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getRebootMode(Lorg/apache/http/HttpResponse;)Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setRebootMode(Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;)V

    .line 181
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getRebootFileName(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setRebootFileName(Ljava/lang/String;)V

    .line 182
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getRebootFilePath(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setRebootFilePath(Ljava/lang/String;)V

    .line 183
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getRebootFilePath2(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setRebootFilePath2(Ljava/lang/String;)V

    .line 184
    invoke-static {v2}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getRebootNote(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setRebootNote(Ljava/lang/String;)V

    .line 185
    const/4 v5, 0x1

    goto/16 :goto_0
.end method

.method public static startUpdate(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 62
    new-instance v0, Landroid/content/Intent;

    const-class v1, Landroid/prestigio/update/service/CheckNewVersionService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 63
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 64
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "arg0"

    .prologue
    .line 68
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimeTask:Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimeTask:Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;

    invoke-virtual {v0}, Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;->cancel()Z

    .line 108
    :cond_0
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimer:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 109
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 111
    :cond_1
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 112
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 9
    .parameter "intent"
    .parameter "startId"

    .prologue
    const-wide/32 v2, 0xea60

    .line 73
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 74
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getLastUpdateTime()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mLastUpdateTime:J

    .line 75
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isAutoCheck()Z

    move-result v6

    .line 76
    .local v6, autoUpdate:Z
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInProgress()Z

    move-result v7

    .line 77
    .local v7, download:Z
    if-eqz v6, :cond_0

    if-eqz v7, :cond_2

    .line 78
    :cond_0
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimeTask:Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;

    if-eqz v0, :cond_1

    .line 79
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimeTask:Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;

    invoke-virtual {v0}, Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;->cancel()Z

    .line 81
    :cond_1
    const-string v0, "PrestigioUpdateService"

    const-string v1, "::: stop self"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    invoke-virtual {p0}, Landroid/prestigio/update/service/CheckNewVersionService;->stopSelf()V

    .line 92
    :goto_0
    return-void

    .line 85
    :cond_2
    const/16 v8, 0x3c

    .line 86
    .local v8, updateTimeMin:I
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimer:Ljava/util/Timer;

    if-eqz v0, :cond_3

    .line 87
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 89
    :cond_3
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimer:Ljava/util/Timer;

    .line 90
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService;->mUpdateTimer:Ljava/util/Timer;

    new-instance v1, Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;

    const/4 v4, 0x0

    invoke-direct {v1, p0, v4}, Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;-><init>(Landroid/prestigio/update/service/CheckNewVersionService;Landroid/prestigio/update/service/CheckNewVersionService$1;)V

    int-to-long v4, v8

    mul-long/2addr v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    goto :goto_0
.end method
