.class public Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;
.super Landroid/os/AsyncTask;
.source "DownloadFileAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Landroid/prestigio/update/asynctasks/DownloadProgress;",
        "Landroid/prestigio/update/asynctasks/DownloadResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final CHECK_AVAILABLE_MEMORY_PERIOD_TIME:I = 0x2710

.field private static final PUBLISH_PROGRESS_PERIOD_TIME:I = 0x7d0

.field private static final TAG:Ljava/lang/String; = "DownloadFileAsyncTask"


# instance fields
.field private downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

.field private httpGet:Lorg/apache/http/client/methods/HttpGet;

.field private httpResponse:Lorg/apache/http/HttpResponse;

.field private inputStream:Ljava/io/InputStream;

.field private isLoadStarted:Z

.field private lastProgressPercentage:I

.field private mAcceptRanges:Z

.field private mContentLength:J

.field private volatile mCurrentProgressPercent:I

.field public mIsAlive:Z

.field private mUri:Ljava/lang/String;

.field private mUrl:Ljava/lang/String;

.field private messageDigest:Ljava/security/MessageDigest;

.field private notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

.field private randomAccessFile:Ljava/io/RandomAccessFile;

.field private tempDownloadFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JZ)V
    .locals 5
    .parameter "url"
    .parameter "uri"
    .parameter "contentLength"
    .parameter "acceptRanges"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 87
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    .line 66
    new-instance v0, Landroid/prestigio/update/utils/NotificationUtils;

    invoke-direct {v0}, Landroid/prestigio/update/utils/NotificationUtils;-><init>()V

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    .line 70
    iput v3, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    .line 71
    iput-object v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mUrl:Ljava/lang/String;

    .line 72
    iput-object v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mUri:Ljava/lang/String;

    .line 73
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    .line 74
    iput-object v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    .line 75
    iput-object v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 76
    iput-object v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    .line 77
    iput-object v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    .line 78
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getTempDownloadFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    .line 79
    new-instance v0, Landroid/prestigio/update/asynctasks/DownloadProgress;

    invoke-direct {v0}, Landroid/prestigio/update/asynctasks/DownloadProgress;-><init>()V

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    .line 81
    iput-boolean v3, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    .line 324
    const/4 v0, -0x1

    iput v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->lastProgressPercentage:I

    .line 88
    iput-object p1, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mUrl:Ljava/lang/String;

    .line 89
    iput-object p2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mUri:Ljava/lang/String;

    .line 90
    iput-wide p3, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    .line 91
    iput-boolean p5, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mAcceptRanges:Z

    .line 92
    return-void
.end method

.method private checkDownloadFileInfo()Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 430
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    iget-object v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mUri:Ljava/lang/String;

    invoke-direct {v0, v6}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 431
    .local v0, httpGet:Lorg/apache/http/client/methods/HttpGet;
    sget-object v6, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_ACCEPT_LANGUAGE:Lorg/apache/http/Header;

    invoke-virtual {v0, v6}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Lorg/apache/http/Header;)V

    .line 432
    sget-object v6, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_CLIENT_LANGUAGE:Lorg/apache/http/Header;

    invoke-virtual {v0, v6}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Lorg/apache/http/Header;)V

    .line 433
    invoke-static {}, Landroid/prestigio/update/utils/CustomHttpClient;->createHTTClient()Lcz/msebera/android/httpclient/client/HttpClient;

    move-result-object v7

    move-object v6, v0

    check-cast v6, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    invoke-interface {v7, v6}, Lcz/msebera/android/httpclient/client/HttpClient;->execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v1

    check-cast v1, Lorg/apache/http/HttpResponse;

    .line 434
    .local v1, httpResponse:Lorg/apache/http/HttpResponse;
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 435
    .local v3, statusCode:I
    const/16 v6, 0xc8

    if-eq v3, v6, :cond_0

    .line 436
    const-string v6, "DownloadFileAsyncTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "response statusCode = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    new-instance v6, Ljava/lang/Exception;

    const-string v7, "resource is not exist!"

    invoke-direct {v6, v7}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v6

    .line 439
    :cond_0
    const-string v6, "DownloadFileAsyncTask"

    invoke-static {v6, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->printHeadersToLog(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V

    .line 440
    invoke-static {v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getPackageLength(Lorg/apache/http/HttpResponse;)J

    move-result-wide v6

    iput-wide v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    .line 441
    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpGet;->abort()V

    .line 444
    const/4 v6, 0x1

    iput-boolean v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mAcceptRanges:Z

    .line 445
    iget-wide v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-eqz v6, :cond_1

    .line 446
    sget-object v6, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->DATA_CHANGED:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    .line 463
    :goto_0
    return-object v6

    .line 448
    :cond_1
    const-wide/16 v4, 0x0

    .line 449
    .local v4, length:J
    iget-object v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 450
    iget-object v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 452
    :cond_2
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-lez v6, :cond_4

    .line 453
    const/4 v2, 0x0

    .line 454
    .local v2, isChecksumValid:Z
    iget-object v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    invoke-static {v6}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getFileChecksum(Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadFileChecksum()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 455
    const/4 v2, 0x1

    .line 457
    :cond_3
    if-nez v2, :cond_4

    .line 458
    const-string v6, ""

    invoke-static {v6}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    .line 459
    iget-object v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 460
    sget-object v6, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->DATA_CHANGED:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    goto :goto_0

    .line 463
    .end local v2           #isChecksumValid:Z
    :cond_4
    sget-object v6, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->SUCCESS:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    goto :goto_0
.end method

.method private copyResult()V
    .locals 8

    .prologue
    .line 467
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getOtaProductName()Ljava/lang/String;

    move-result-object v2

    .line 468
    .local v2, model:Ljava/lang/String;
    const-string v4, "DownloadFileAsyncTask"

    const-string v5, "Download complete"

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 469
    iget-object v4, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    const-string v5, "complete"

    const/16 v6, 0x64

    invoke-virtual {v4, v5, v6}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(Ljava/lang/String;I)V

    .line 470
    iget-object v4, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 473
    const-string v4, ""

    invoke-static {v4}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFilePathName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, ""

    invoke-static {v4}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFileImgName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    .line 474
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 475
    const-string v4, "DownloadFileAsyncTask"

    const-string v5, "start rename img file"

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    :try_start_0
    iget-object v4, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    new-instance v5, Ljava/io/File;

    const-string v6, ""

    invoke-static {v6}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFilePathName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    .line 478
    invoke-static {v7}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFileImgName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 479
    const-string v4, "DownloadFileAsyncTask"

    const-string v5, "img file rename success"

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 485
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 486
    .local v1, localIntent:Landroid/content/Intent;
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    const-class v5, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 487
    iget-object v4, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 488
    .local v3, str:Ljava/lang/String;
    const-string v4, "android.prestigio.update.extra.IMAGE_PATH"

    invoke-virtual {v1, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 489
    const/high16 v4, 0x1000

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 490
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/prestigio/update/UpdateApplication;->startActivity(Landroid/content/Intent;)V

    .line 503
    .end local v1           #localIntent:Landroid/content/Intent;
    .end local v3           #str:Ljava/lang/String;
    :goto_0
    invoke-static {}, Landroid/prestigio/update/service/DownloadService;->stopDownloadService()Z

    .line 504
    :goto_1
    return-void

    .line 480
    :catch_0
    move-exception v0

    .line 481
    .local v0, e:Ljava/lang/Exception;
    const-string v4, "DownloadFileAsyncTask"

    const-string v5, "cannot move file"

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    const-string v4, "DownloadFileAsyncTask"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 492
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    const-string v4, "PMP5080B"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 493
    iget-object v4, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    new-instance v5, Ljava/io/File;

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadDir()Ljava/lang/String;

    move-result-object v6

    const-string v7, "update.img"

    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 497
    :goto_2
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.MEDIA_MOUNTED"

    const-string v7, "file:///mnt/sdcard"

    .line 498
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 497
    invoke-virtual {v4, v5}, Landroid/prestigio/update/UpdateApplication;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 495
    :cond_1
    iget-object v4, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    new-instance v5, Ljava/io/File;

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadDir()Ljava/lang/String;

    move-result-object v6

    const-string v7, "update.zip"

    invoke-direct {v5, v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto :goto_2

    .line 501
    :cond_2
    const-string v4, "DownloadFileAsyncTask"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " not exist, for model "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public static getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;
    .locals 6
    .parameter "messageDigest"

    .prologue
    .line 531
    invoke-virtual {p0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 532
    .local v0, b:[B
    const-string v2, ""

    .line 533
    .local v2, result:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 534
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-byte v4, v0, v1

    and-int/lit16 v4, v4, 0xff

    add-int/lit16 v4, v4, 0x100

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 533
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 536
    :cond_0
    return-object v2
.end method

.method public static getFileChecksum(Ljava/io/File;)Ljava/lang/String;
    .locals 11
    .parameter "file"

    .prologue
    .line 508
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 509
    .local v4, inputStream:Ljava/io/InputStream;
    const/16 v8, 0x4000

    new-array v1, v8, [B

    .line 510
    .local v1, buffer:[B
    const-string v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    .line 513
    .local v5, messageDigest:Ljava/security/MessageDigest;
    :cond_0
    invoke-virtual {v4, v1}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .line 514
    .local v6, numRead:I
    if-lez v6, :cond_1

    .line 515
    const/4 v8, 0x0

    invoke-virtual {v5, v1, v8, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 517
    :cond_1
    const/4 v8, -0x1

    if-ne v6, v8, :cond_0

    .line 518
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 519
    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 520
    .local v0, b:[B
    const-string v7, ""

    .line 521
    .local v7, result:Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    array-length v8, v0

    if-ge v3, v8, :cond_2

    .line 522
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-byte v9, v0, v3

    and-int/lit16 v9, v9, 0xff

    add-int/lit16 v9, v9, 0x100

    const/16 v10, 0x10

    invoke-static {v9, v10}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 521
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 525
    .end local v0           #b:[B
    .end local v1           #buffer:[B
    .end local v3           #i:I
    .end local v4           #inputStream:Ljava/io/InputStream;
    .end local v5           #messageDigest:Ljava/security/MessageDigest;
    .end local v6           #numRead:I
    .end local v7           #result:Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 526
    .local v2, e:Ljava/lang/Exception;
    const-string v7, ""

    .end local v2           #e:Ljava/lang/Exception;
    :cond_2
    return-object v7
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Landroid/prestigio/update/asynctasks/DownloadResult;
    .locals 30
    .parameter "params"

    .prologue
    .line 104
    const/16 v26, 0x2000

    move/from16 v0, v26

    new-array v4, v0, [B

    .line 105
    .local v4, byteBuffer:[B
    invoke-virtual/range {p0 .. p0}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isCancelled()Z

    move-result v26

    if-nez v26, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    move/from16 v26, v0

    if-nez v26, :cond_2

    .line 106
    :cond_0
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "isCancelled == true"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->CANCELLED:Landroid/prestigio/update/asynctasks/DownloadResult;

    .line 307
    :cond_1
    :goto_0
    return-object v26

    .line 109
    :cond_2
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v26

    if-eqz v26, :cond_3

    .line 110
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;

    goto :goto_0

    .line 112
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getFileMessageDigest(Ljava/io/File;)Ljava/security/MessageDigest;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    .line 113
    invoke-virtual/range {p0 .. p0}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isCancelled()Z

    move-result v26

    if-nez v26, :cond_4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    move/from16 v26, v0

    if-nez v26, :cond_5

    .line 114
    :cond_4
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "isCancelled == true"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->CANCELLED:Landroid/prestigio/update/asynctasks/DownloadResult;

    goto :goto_0

    .line 117
    :cond_5
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v26

    if-eqz v26, :cond_6

    .line 118
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;

    goto :goto_0

    .line 120
    :cond_6
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "messageDigest done"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    :try_start_0
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInProgress()Z

    move-result v26

    if-eqz v26, :cond_7

    .line 123
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadFileChecksum()Ljava/lang/String;

    move-result-object v26

    const-string v27, ""

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_7

    .line 124
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "publishProgress after check sum"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "Pre init dialog progress"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->length()J

    move-result-wide v22

    .line 127
    .local v22, length:J
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v8

    .line 128
    .local v8, contentLength:J
    const-wide/16 v26, 0x64

    mul-long v26, v26, v22

    div-long v26, v26, v8

    move-wide/from16 v0, v26

    long-to-int v11, v0

    .line 129
    .local v11, currentProgressPercent:I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iput-wide v8, v0, Landroid/prestigio/update/asynctasks/DownloadProgress;->allBytes:J

    .line 130
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-wide/from16 v0, v22

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->readBytes:J

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iput v11, v0, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    .line 133
    .end local v8           #contentLength:J
    .end local v11           #currentProgressPercent:I
    .end local v22           #length:J
    :cond_7
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v26

    if-eqz v26, :cond_8

    .line 134
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    :try_start_1
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_53

    .line 294
    :goto_1
    :try_start_2
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_52

    .line 299
    :goto_2
    :try_start_3
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_51

    .line 303
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .local v5, checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 136
    .end local v5           #checksum:Ljava/lang/String;
    :cond_8
    :try_start_4
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "start doInBackground ...."

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    sget-object v19, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->SUCCESS:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 139
    .local v19, res:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
    :try_start_5
    invoke-direct/range {p0 .. p0}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->checkDownloadFileInfo()Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    move-result-object v19

    .line 140
    invoke-virtual/range {p0 .. p0}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isCancelled()Z

    move-result v26

    if-nez v26, :cond_9

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    move/from16 v26, v0

    if-nez v26, :cond_a

    .line 141
    :cond_9
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "isCancelled == true"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->CANCELLED:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 289
    :try_start_6
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_50

    .line 294
    :goto_4
    :try_start_7
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_4f

    .line 299
    :goto_5
    :try_start_8
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4e

    .line 303
    :goto_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 144
    .end local v5           #checksum:Ljava/lang/String;
    :catch_0
    move-exception v14

    .line 145
    .local v14, e:Ljava/lang/Exception;
    :try_start_9
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "error = "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 289
    :try_start_a
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4d

    .line 294
    :goto_7
    :try_start_b
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4c

    .line 299
    :goto_8
    :try_start_c
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4b

    .line 303
    :goto_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 148
    .end local v5           #checksum:Ljava/lang/String;
    .end local v14           #e:Ljava/lang/Exception;
    :cond_a
    :try_start_d
    sget-object v26, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->DATA_CHANGED:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_b

    .line 149
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_DATA_CHANGED:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 289
    :try_start_e
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_4a

    .line 294
    :goto_a
    :try_start_f
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_49

    .line 299
    :goto_b
    :try_start_10
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_48

    .line 303
    :goto_c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 151
    .end local v5           #checksum:Ljava/lang/String;
    :cond_b
    const-wide/16 v22, 0x0

    .line 152
    .restart local v22       #length:J
    :try_start_11
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->exists()Z

    move-result v26

    if-eqz v26, :cond_c

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->length()J

    move-result-wide v22

    .line 155
    :cond_c
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Already download length is "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    move-result-wide v26

    const-wide/16 v28, 0x7d0

    add-long v24, v26, v28

    .line 158
    .local v24, progressTime:J
    :try_start_12
    new-instance v26, Lorg/apache/http/client/methods/HttpGet;

    new-instance v27, Ljava/net/URI;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mUrl:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-direct/range {v27 .. v28}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v26 .. v27}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0
    .catch Ljava/net/URISyntaxException; {:try_start_12 .. :try_end_12} :catch_1

    .line 162
    :try_start_13
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v26, v0

    sget-object v27, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_ACCEPT_LANGUAGE:Lorg/apache/http/Header;

    invoke-virtual/range {v26 .. v27}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Lorg/apache/http/Header;)V

    .line 163
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v26, v0

    sget-object v27, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_CLIENT_LANGUAGE:Lorg/apache/http/Header;

    invoke-virtual/range {v26 .. v27}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Lorg/apache/http/Header;)V

    .line 164
    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v26, v0

    cmp-long v26, v22, v26

    if-nez v26, :cond_d

    .line 165
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "file downloaded "

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v28, v0

    move-wide/from16 v0, v28

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->allBytes:J

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-wide/from16 v0, v22

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->readBytes:J

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    const/16 v27, 0x64

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    .line 169
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v28, v0

    aput-object v28, v26, v27

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 170
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->SUCCESS:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 289
    :try_start_14
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_44

    .line 294
    :goto_d
    :try_start_15
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_43

    .line 299
    :goto_e
    :try_start_16
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_42

    .line 303
    :goto_f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 159
    .end local v5           #checksum:Ljava/lang/String;
    :catch_1
    move-exception v16

    .line 160
    .local v16, e2:Ljava/net/URISyntaxException;
    :try_start_17
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    .line 289
    :try_start_18
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_47

    .line 294
    :goto_10
    :try_start_19
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_46

    .line 299
    :goto_11
    :try_start_1a
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_45

    .line 303
    :goto_12
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 172
    .end local v5           #checksum:Ljava/lang/String;
    .end local v16           #e2:Ljava/net/URISyntaxException;
    :cond_d
    :try_start_1b
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "read from length "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mAcceptRanges:Z

    move/from16 v26, v0

    if-eqz v26, :cond_e

    .line 174
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v28, v0

    move-wide/from16 v0, v22

    move-wide/from16 v2, v28

    invoke-static {v0, v1, v2, v3}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getRequestHeaderRange(JJ)Lorg/apache/http/Header;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Lorg/apache/http/Header;)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_0

    .line 177
    :cond_e
    :try_start_1c
    invoke-static {}, Landroid/prestigio/update/utils/CustomHttpClient;->createHTTClient()Lcz/msebera/android/httpclient/client/HttpClient;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v26, v0

    check-cast v26, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    move-object/from16 v0, v27

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/client/HttpClient;->execute(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v26

    check-cast v26, Lorg/apache/http/HttpResponse;

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpResponse:Lorg/apache/http/HttpResponse;
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1c} :catch_2

    .line 182
    :try_start_1d
    invoke-virtual/range {p0 .. p0}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isCancelled()Z

    move-result v26

    if-nez v26, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    move/from16 v26, v0

    if-nez v26, :cond_10

    .line 183
    :cond_f
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "isCancelled == true"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->CANCELLED:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_0

    .line 289
    :try_start_1e
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_3e

    .line 294
    :goto_13
    :try_start_1f
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_3d

    .line 299
    :goto_14
    :try_start_20
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_3c

    .line 303
    :goto_15
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 178
    .end local v5           #checksum:Ljava/lang/String;
    :catch_2
    move-exception v6

    .line 179
    .local v6, clientProtocolException:Ljava/io/IOException;
    :try_start_21
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "CustomHttpClient.createHTTClient() failed "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_0

    .line 289
    :try_start_22
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_41

    .line 294
    :goto_16
    :try_start_23
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_40

    .line 299
    :goto_17
    :try_start_24
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_3f

    .line 303
    :goto_18
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 186
    .end local v5           #checksum:Ljava/lang/String;
    .end local v6           #clientProtocolException:Ljava/io/IOException;
    :cond_10
    :try_start_25
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v26

    if-eqz v26, :cond_11

    .line 187
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_0

    .line 289
    :try_start_26
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_3b

    .line 294
    :goto_19
    :try_start_27
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_3a

    .line 299
    :goto_1a
    :try_start_28
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_39

    .line 303
    :goto_1b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 190
    .end local v5           #checksum:Ljava/lang/String;
    :cond_11
    :try_start_29
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpResponse:Lorg/apache/http/HttpResponse;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    .line 191
    .local v7, connectionStatus:I
    const-string v26, "DownloadFileAsyncTask"

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpResponse:Lorg/apache/http/HttpResponse;

    move-object/from16 v27, v0

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/HttpHeaderUtils;->printHeadersToLog(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V

    .line 192
    const/16 v26, 0xce

    move/from16 v0, v26

    if-eq v7, v0, :cond_13

    const/16 v26, 0xc8

    move/from16 v0, v26

    if-ne v7, v0, :cond_12

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mAcceptRanges:Z

    move/from16 v26, v0

    if-eqz v26, :cond_13

    .line 193
    :cond_12
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_0

    .line 289
    :try_start_2a
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_38

    .line 294
    :goto_1c
    :try_start_2b
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2b} :catch_37

    .line 299
    :goto_1d
    :try_start_2c
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_36

    .line 303
    :goto_1e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 196
    .end local v5           #checksum:Ljava/lang/String;
    :cond_13
    :try_start_2d
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpResponse:Lorg/apache/http/HttpResponse;

    move-object/from16 v26, v0

    invoke-interface/range {v26 .. v26}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v26

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_2d .. :try_end_2d} :catch_3
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_2d} :catch_4

    .line 203
    :try_start_2e
    new-instance v26, Ljava/io/RandomAccessFile;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    move-object/from16 v27, v0

    const-string v28, "rw"

    invoke-direct/range {v26 .. v28}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_2e .. :try_end_2e} :catch_5

    .line 209
    :try_start_2f
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_2f} :catch_6

    .line 214
    const-wide/16 v26, 0x64

    mul-long v26, v26, v22

    :try_start_30
    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v28, v0

    div-long v26, v26, v28

    move-wide/from16 v0, v26

    long-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v28, v0

    move-wide/from16 v0, v28

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->allBytes:J

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-wide/from16 v0, v22

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->readBytes:J

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    move/from16 v27, v0

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    .line 219
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v28, v0

    aput-object v28, v26, v27

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 220
    const-wide/16 v20, 0x0

    .line 222
    .local v20, lastAvailableMemoryCheckTime:J
    :cond_14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v26

    sub-long v26, v26, v20

    const-wide/16 v28, 0x2710

    cmp-long v26, v26, v28

    if-gez v26, :cond_15

    const-wide/16 v26, 0x0

    cmp-long v26, v20, v26

    if-nez v26, :cond_16

    .line 224
    :cond_15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    .line 225
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadDir()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v28, v0

    sub-long v28, v28, v22

    move-object/from16 v0, v26

    move-wide/from16 v1, v28

    invoke-static {v0, v1, v2}, Landroid/prestigio/update/utils/MemoryUtils;->isMemorySizeAvailable(Ljava/lang/String;J)Z

    move-result v26

    if-nez v26, :cond_16

    .line 226
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Not enough space on "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadDir()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_FREE_SPACE:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_0

    .line 289
    :try_start_31
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_31} :catch_29

    .line 294
    :goto_1f
    :try_start_32
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_32} :catch_28

    .line 299
    :goto_20
    :try_start_33
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_33} :catch_27

    .line 303
    :goto_21
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 197
    .end local v5           #checksum:Ljava/lang/String;
    .end local v20           #lastAvailableMemoryCheckTime:J
    :catch_3
    move-exception v15

    .line 198
    .local v15, e1:Ljava/lang/IllegalStateException;
    :try_start_34
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_0

    .line 289
    :try_start_35
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_35} :catch_35

    .line 294
    :goto_22
    :try_start_36
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_36} :catch_34

    .line 299
    :goto_23
    :try_start_37
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_37} :catch_33

    .line 303
    :goto_24
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 199
    .end local v5           #checksum:Ljava/lang/String;
    .end local v15           #e1:Ljava/lang/IllegalStateException;
    :catch_4
    move-exception v15

    .line 200
    .local v15, e1:Ljava/io/IOException;
    :try_start_38
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_0

    .line 289
    :try_start_39
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_39} :catch_32

    .line 294
    :goto_25
    :try_start_3a
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3a} :catch_31

    .line 299
    :goto_26
    :try_start_3b
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3b} :catch_30

    .line 303
    :goto_27
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 204
    .end local v5           #checksum:Ljava/lang/String;
    .end local v15           #e1:Ljava/io/IOException;
    :catch_5
    move-exception v17

    .line 205
    .local v17, fileNotFoundException:Ljava/io/FileNotFoundException;
    :try_start_3c
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "0 "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v17 .. v17}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SAVING_DATA:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_3c
    .catchall {:try_start_3c .. :try_end_3c} :catchall_0

    .line 289
    :try_start_3d
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_3d} :catch_2f

    .line 294
    :goto_28
    :try_start_3e
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_3e} :catch_2e

    .line 299
    :goto_29
    :try_start_3f
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_3f} :catch_2d

    .line 303
    :goto_2a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 210
    .end local v5           #checksum:Ljava/lang/String;
    .end local v17           #fileNotFoundException:Ljava/io/FileNotFoundException;
    :catch_6
    move-exception v18

    .line 211
    .local v18, ioException:Ljava/io/IOException;
    :try_start_40
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "1 "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v18 .. v18}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SAVING_DATA:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_40
    .catchall {:try_start_40 .. :try_end_40} :catchall_0

    .line 289
    :try_start_41
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_41} :catch_2c

    .line 294
    :goto_2b
    :try_start_42
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_42} :catch_2b

    .line 299
    :goto_2c
    :try_start_43
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_43} :catch_2a

    .line 303
    :goto_2d
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 230
    .end local v5           #checksum:Ljava/lang/String;
    .end local v18           #ioException:Ljava/io/IOException;
    .restart local v20       #lastAvailableMemoryCheckTime:J
    :cond_16
    :try_start_44
    invoke-static {}, Landroid/prestigio/update/utils/HttpConnectionUtils;->isInternetConnected()Z

    move-result v26

    if-nez v26, :cond_17

    .line 231
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_44
    .catchall {:try_start_44 .. :try_end_44} :catchall_0

    .line 289
    :try_start_45
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_45} :catch_26

    .line 294
    :goto_2e
    :try_start_46
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_46} :catch_25

    .line 299
    :goto_2f
    :try_start_47
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_47} :catch_24

    .line 303
    :goto_30
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 233
    .end local v5           #checksum:Ljava/lang/String;
    :cond_17
    :try_start_48
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v26

    if-eqz v26, :cond_18

    .line 234
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "isDownloadInPause == true"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_48
    .catchall {:try_start_48 .. :try_end_48} :catchall_0

    .line 289
    :try_start_49
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_49} :catch_23

    .line 294
    :goto_31
    :try_start_4a
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4a} :catch_22

    .line 299
    :goto_32
    :try_start_4b
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_4b} :catch_21

    .line 303
    :goto_33
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 237
    .end local v5           #checksum:Ljava/lang/String;
    :cond_18
    :try_start_4c
    invoke-virtual/range {p0 .. p0}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isCancelled()Z

    move-result v26

    if-nez v26, :cond_19

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    move/from16 v26, v0

    if-nez v26, :cond_1a

    .line 238
    :cond_19
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "isCancelled == true"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->CANCELLED:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_4c
    .catchall {:try_start_4c .. :try_end_4c} :catchall_0

    .line 289
    :try_start_4d
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_4d} :catch_20

    .line 294
    :goto_34
    :try_start_4e
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_4e} :catch_1f

    .line 299
    :goto_35
    :try_start_4f
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_4f} :catch_1e

    .line 303
    :goto_36
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 241
    .end local v5           #checksum:Ljava/lang/String;
    :cond_1a
    const/4 v10, -0x1

    .line 243
    .local v10, count:I
    :try_start_50
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v10

    .line 244
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "data read "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_50
    .catchall {:try_start_50 .. :try_end_50} :catchall_0
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_50} :catch_7

    .line 252
    const/16 v26, -0x1

    move/from16 v0, v26

    if-ne v10, v0, :cond_1c

    .line 253
    :try_start_51
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_51
    .catchall {:try_start_51 .. :try_end_51} :catchall_0

    .line 289
    :try_start_52
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_52} :catch_17

    .line 294
    :goto_37
    :try_start_53
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_53} :catch_16

    .line 299
    :goto_38
    :try_start_54
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_54} :catch_15

    .line 303
    :goto_39
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 245
    .end local v5           #checksum:Ljava/lang/String;
    :catch_7
    move-exception v14

    .line 246
    .local v14, e:Ljava/io/IOException;
    :try_start_55
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v26

    if-eqz v26, :cond_1b

    .line 247
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "isDownloadInPause == true"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_55
    .catchall {:try_start_55 .. :try_end_55} :catchall_0

    .line 289
    :try_start_56
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_56} :catch_1d

    .line 294
    :goto_3a
    :try_start_57
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_57} :catch_1c

    .line 299
    :goto_3b
    :try_start_58
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_58} :catch_1b

    .line 303
    :goto_3c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 250
    .end local v5           #checksum:Ljava/lang/String;
    :cond_1b
    :try_start_59
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_59
    .catchall {:try_start_59 .. :try_end_59} :catchall_0

    .line 289
    :try_start_5a
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_5a} :catch_1a

    .line 294
    :goto_3d
    :try_start_5b
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_5b} :catch_19

    .line 299
    :goto_3e
    :try_start_5c
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_5c} :catch_18

    .line 303
    :goto_3f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 256
    .end local v5           #checksum:Ljava/lang/String;
    .end local v14           #e:Ljava/io/IOException;
    :cond_1c
    :try_start_5d
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v0, v4, v1, v10}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v27

    invoke-virtual {v0, v4, v1, v10}, Ljava/security/MessageDigest;->update([BII)V

    .line 258
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z
    :try_end_5d
    .catchall {:try_start_5d .. :try_end_5d} :catchall_0
    .catch Ljava/io/IOException; {:try_start_5d .. :try_end_5d} :catch_8

    .line 267
    int-to-long v0, v10

    move-wide/from16 v26, v0

    add-long v22, v22, v26

    .line 268
    :try_start_5e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 269
    .local v12, currentTime:J
    cmp-long v26, v12, v24

    if-lez v26, :cond_1d

    .line 270
    const-wide/16 v26, 0x7d0

    add-long v24, v12, v26

    .line 271
    const-wide/16 v26, 0x64

    mul-long v26, v26, v22

    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v28, v0

    div-long v26, v26, v28

    move-wide/from16 v0, v26

    long-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v28, v0

    move-wide/from16 v0, v28

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->allBytes:J

    .line 273
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-wide/from16 v0, v22

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->readBytes:J

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    move/from16 v27, v0

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    .line 275
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v28, v0

    aput-object v28, v26, v27

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 277
    :cond_1d
    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v26, v0

    cmp-long v26, v22, v26

    if-nez v26, :cond_14

    .line 278
    const/16 v26, 0x1

    invoke-static/range {v26 .. v26}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadComplete(Z)V

    .line 279
    const/16 v26, 0x0

    invoke-static/range {v26 .. v26}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInProgress(Z)V

    .line 280
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mContentLength:J

    move-wide/from16 v28, v0

    move-wide/from16 v0, v28

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->allBytes:J

    .line 281
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    move-wide/from16 v0, v22

    move-object/from16 v2, v26

    iput-wide v0, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->readBytes:J

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    const/16 v27, 0x64

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    .line 283
    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    move-object/from16 v28, v0

    aput-object v28, v26, v27

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 284
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->SUCCESS:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_5e
    .catchall {:try_start_5e .. :try_end_5e} :catchall_0

    .line 289
    :try_start_5f
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_5f} :catch_e

    .line 294
    :goto_40
    :try_start_60
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_60} :catch_d

    .line 299
    :goto_41
    :try_start_61
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_61} :catch_c

    .line 303
    :goto_42
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 259
    .end local v5           #checksum:Ljava/lang/String;
    .end local v12           #currentTime:J
    :catch_8
    move-exception v14

    .line 260
    .restart local v14       #e:Ljava/io/IOException;
    :try_start_62
    const-string v26, "DownloadFileAsyncTask"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "2 "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual {v14}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v26

    if-eqz v26, :cond_1e

    .line 262
    const-string v26, "DownloadFileAsyncTask"

    const-string v27, "isDownloadInPause == true"

    invoke-static/range {v26 .. v27}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_62
    .catchall {:try_start_62 .. :try_end_62} :catchall_0

    .line 289
    :try_start_63
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_63} :catch_14

    .line 294
    :goto_43
    :try_start_64
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_64} :catch_13

    .line 299
    :goto_44
    :try_start_65
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_65} :catch_12

    .line 303
    :goto_45
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 265
    .end local v5           #checksum:Ljava/lang/String;
    :cond_1e
    :try_start_66
    sget-object v26, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SAVING_DATA:Landroid/prestigio/update/asynctasks/DownloadResult;
    :try_end_66
    .catchall {:try_start_66 .. :try_end_66} :catchall_0

    .line 289
    :try_start_67
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_67} :catch_11

    .line 294
    :goto_46
    :try_start_68
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_68} :catch_10

    .line 299
    :goto_47
    :try_start_69
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_69} :catch_f

    .line 303
    :goto_48
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 288
    .end local v5           #checksum:Ljava/lang/String;
    .end local v7           #connectionStatus:I
    .end local v10           #count:I
    .end local v14           #e:Ljava/io/IOException;
    .end local v19           #res:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
    .end local v20           #lastAvailableMemoryCheckTime:J
    .end local v22           #length:J
    .end local v24           #progressTime:J
    :catchall_0
    move-exception v26

    .line 289
    :try_start_6a
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "randomAccessFile.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->randomAccessFile:Ljava/io/RandomAccessFile;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/RandomAccessFile;->close()V
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_6a} :catch_b

    .line 294
    :goto_49
    :try_start_6b
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "httpGet.abort()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->httpGet:Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpGet;->abort()V
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_6b} :catch_a

    .line 299
    :goto_4a
    :try_start_6c
    const-string v27, "DownloadFileAsyncTask"

    const-string v28, "inputStream.close()"

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->inputStream:Ljava/io/InputStream;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/io/InputStream;->close()V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_6c} :catch_9

    .line 303
    :goto_4b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isLoadStarted:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1f

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->messageDigest:Ljava/security/MessageDigest;

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v27}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->getChecksumByMessageDigest(Ljava/security/MessageDigest;)Ljava/lang/String;

    move-result-object v5

    .line 305
    .restart local v5       #checksum:Ljava/lang/String;
    const-string v27, "DownloadFileAsyncTask"

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string v29, "setDownloadFileChecksum"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-static/range {v27 .. v28}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    .line 307
    .end local v5           #checksum:Ljava/lang/String;
    :cond_1f
    throw v26

    .line 301
    :catch_9
    move-exception v27

    goto :goto_4b

    .line 296
    :catch_a
    move-exception v27

    goto :goto_4a

    .line 291
    :catch_b
    move-exception v27

    goto :goto_49

    .line 301
    .restart local v7       #connectionStatus:I
    .restart local v10       #count:I
    .restart local v12       #currentTime:J
    .restart local v19       #res:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
    .restart local v20       #lastAvailableMemoryCheckTime:J
    .restart local v22       #length:J
    .restart local v24       #progressTime:J
    :catch_c
    move-exception v27

    goto/16 :goto_42

    .line 296
    :catch_d
    move-exception v27

    goto/16 :goto_41

    .line 291
    :catch_e
    move-exception v27

    goto/16 :goto_40

    .line 301
    .end local v12           #currentTime:J
    .restart local v14       #e:Ljava/io/IOException;
    :catch_f
    move-exception v27

    goto/16 :goto_48

    .line 296
    :catch_10
    move-exception v27

    goto/16 :goto_47

    .line 291
    :catch_11
    move-exception v27

    goto/16 :goto_46

    .line 301
    :catch_12
    move-exception v27

    goto/16 :goto_45

    .line 296
    :catch_13
    move-exception v27

    goto/16 :goto_44

    .line 291
    :catch_14
    move-exception v27

    goto/16 :goto_43

    .line 301
    .end local v14           #e:Ljava/io/IOException;
    :catch_15
    move-exception v27

    goto/16 :goto_39

    .line 296
    :catch_16
    move-exception v27

    goto/16 :goto_38

    .line 291
    :catch_17
    move-exception v27

    goto/16 :goto_37

    .line 301
    .restart local v14       #e:Ljava/io/IOException;
    :catch_18
    move-exception v27

    goto/16 :goto_3f

    .line 296
    :catch_19
    move-exception v27

    goto/16 :goto_3e

    .line 291
    :catch_1a
    move-exception v27

    goto/16 :goto_3d

    .line 301
    :catch_1b
    move-exception v27

    goto/16 :goto_3c

    .line 296
    :catch_1c
    move-exception v27

    goto/16 :goto_3b

    .line 291
    :catch_1d
    move-exception v27

    goto/16 :goto_3a

    .line 301
    .end local v10           #count:I
    .end local v14           #e:Ljava/io/IOException;
    :catch_1e
    move-exception v27

    goto/16 :goto_36

    .line 296
    :catch_1f
    move-exception v27

    goto/16 :goto_35

    .line 291
    :catch_20
    move-exception v27

    goto/16 :goto_34

    .line 301
    :catch_21
    move-exception v27

    goto/16 :goto_33

    .line 296
    :catch_22
    move-exception v27

    goto/16 :goto_32

    .line 291
    :catch_23
    move-exception v27

    goto/16 :goto_31

    .line 301
    :catch_24
    move-exception v27

    goto/16 :goto_30

    .line 296
    :catch_25
    move-exception v27

    goto/16 :goto_2f

    .line 291
    :catch_26
    move-exception v27

    goto/16 :goto_2e

    .line 301
    :catch_27
    move-exception v27

    goto/16 :goto_21

    .line 296
    :catch_28
    move-exception v27

    goto/16 :goto_20

    .line 291
    :catch_29
    move-exception v27

    goto/16 :goto_1f

    .line 301
    .end local v20           #lastAvailableMemoryCheckTime:J
    .restart local v18       #ioException:Ljava/io/IOException;
    :catch_2a
    move-exception v27

    goto/16 :goto_2d

    .line 296
    :catch_2b
    move-exception v27

    goto/16 :goto_2c

    .line 291
    :catch_2c
    move-exception v27

    goto/16 :goto_2b

    .line 301
    .end local v18           #ioException:Ljava/io/IOException;
    .restart local v17       #fileNotFoundException:Ljava/io/FileNotFoundException;
    :catch_2d
    move-exception v27

    goto/16 :goto_2a

    .line 296
    :catch_2e
    move-exception v27

    goto/16 :goto_29

    .line 291
    :catch_2f
    move-exception v27

    goto/16 :goto_28

    .line 301
    .end local v17           #fileNotFoundException:Ljava/io/FileNotFoundException;
    .restart local v15       #e1:Ljava/io/IOException;
    :catch_30
    move-exception v27

    goto/16 :goto_27

    .line 296
    :catch_31
    move-exception v27

    goto/16 :goto_26

    .line 291
    :catch_32
    move-exception v27

    goto/16 :goto_25

    .line 301
    .local v15, e1:Ljava/lang/IllegalStateException;
    :catch_33
    move-exception v27

    goto/16 :goto_24

    .line 296
    :catch_34
    move-exception v27

    goto/16 :goto_23

    .line 291
    :catch_35
    move-exception v27

    goto/16 :goto_22

    .line 301
    .end local v15           #e1:Ljava/lang/IllegalStateException;
    :catch_36
    move-exception v27

    goto/16 :goto_1e

    .line 296
    :catch_37
    move-exception v27

    goto/16 :goto_1d

    .line 291
    :catch_38
    move-exception v27

    goto/16 :goto_1c

    .line 301
    .end local v7           #connectionStatus:I
    :catch_39
    move-exception v27

    goto/16 :goto_1b

    .line 296
    :catch_3a
    move-exception v27

    goto/16 :goto_1a

    .line 291
    :catch_3b
    move-exception v27

    goto/16 :goto_19

    .line 301
    :catch_3c
    move-exception v27

    goto/16 :goto_15

    .line 296
    :catch_3d
    move-exception v27

    goto/16 :goto_14

    .line 291
    :catch_3e
    move-exception v27

    goto/16 :goto_13

    .line 301
    .restart local v6       #clientProtocolException:Ljava/io/IOException;
    :catch_3f
    move-exception v27

    goto/16 :goto_18

    .line 296
    :catch_40
    move-exception v27

    goto/16 :goto_17

    .line 291
    :catch_41
    move-exception v27

    goto/16 :goto_16

    .line 301
    .end local v6           #clientProtocolException:Ljava/io/IOException;
    :catch_42
    move-exception v27

    goto/16 :goto_f

    .line 296
    :catch_43
    move-exception v27

    goto/16 :goto_e

    .line 291
    :catch_44
    move-exception v27

    goto/16 :goto_d

    .line 301
    .restart local v16       #e2:Ljava/net/URISyntaxException;
    :catch_45
    move-exception v27

    goto/16 :goto_12

    .line 296
    :catch_46
    move-exception v27

    goto/16 :goto_11

    .line 291
    :catch_47
    move-exception v27

    goto/16 :goto_10

    .line 301
    .end local v16           #e2:Ljava/net/URISyntaxException;
    .end local v22           #length:J
    .end local v24           #progressTime:J
    :catch_48
    move-exception v27

    goto/16 :goto_c

    .line 296
    :catch_49
    move-exception v27

    goto/16 :goto_b

    .line 291
    :catch_4a
    move-exception v27

    goto/16 :goto_a

    .line 301
    .local v14, e:Ljava/lang/Exception;
    :catch_4b
    move-exception v27

    goto/16 :goto_9

    .line 296
    :catch_4c
    move-exception v27

    goto/16 :goto_8

    .line 291
    :catch_4d
    move-exception v27

    goto/16 :goto_7

    .line 301
    .end local v14           #e:Ljava/lang/Exception;
    :catch_4e
    move-exception v27

    goto/16 :goto_6

    .line 296
    :catch_4f
    move-exception v27

    goto/16 :goto_5

    .line 291
    :catch_50
    move-exception v27

    goto/16 :goto_4

    .line 301
    .end local v19           #res:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
    :catch_51
    move-exception v27

    goto/16 :goto_3

    .line 296
    :catch_52
    move-exception v27

    goto/16 :goto_2

    .line 291
    :catch_53
    move-exception v27

    goto/16 :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 63
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->doInBackground([Ljava/lang/String;)Landroid/prestigio/update/asynctasks/DownloadResult;

    move-result-object v0

    return-object v0
.end method

.method public getFileMessageDigest(Ljava/io/File;)Ljava/security/MessageDigest;
    .locals 10
    .parameter "file"

    .prologue
    const/4 v5, 0x0

    .line 541
    const-string v6, "DownloadFileAsyncTask"

    const-string v7, "getFileMessageDigest start"

    invoke-static {v6, v7}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 542
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_4

    .line 543
    const-string v6, "DownloadFileAsyncTask"

    const-string v7, "file.exists() && file.length() > 0"

    invoke-static {v6, v7}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    const/4 v3, 0x0

    .line 546
    .local v3, messageDigest:Ljava/security/MessageDigest;
    :try_start_0
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 547
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 548
    .local v2, inputStream:Ljava/io/InputStream;
    const/16 v6, 0x4000

    new-array v0, v6, [B

    .line 552
    .local v0, buffer:[B
    :cond_0
    invoke-virtual {p0}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->isCancelled()Z

    move-result v6

    if-nez v6, :cond_1

    iget-boolean v6, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mIsAlive:Z

    if-eqz v6, :cond_1

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v6

    if-eqz v6, :cond_2

    .line 554
    :cond_1
    :try_start_1
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 579
    .end local v0           #buffer:[B
    .end local v2           #inputStream:Ljava/io/InputStream;
    .end local v3           #messageDigest:Ljava/security/MessageDigest;
    :goto_0
    return-object v3

    .line 556
    .restart local v0       #buffer:[B
    .restart local v2       #inputStream:Ljava/io/InputStream;
    .restart local v3       #messageDigest:Ljava/security/MessageDigest;
    :catch_0
    move-exception v1

    .line 557
    .local v1, e:Ljava/lang/Exception;
    :try_start_2
    const-string v6, "DownloadFileAsyncTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Can not Instantiate MessageDigest"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    move-object v3, v5

    .line 558
    goto :goto_0

    .line 561
    .end local v1           #e:Ljava/lang/Exception;
    :cond_2
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 562
    .local v4, numRead:I
    if-lez v4, :cond_3

    .line 563
    const/4 v6, 0x0

    invoke-virtual {v3, v0, v6, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 565
    :cond_3
    const/4 v6, -0x1

    if-ne v4, v6, :cond_0

    .line 566
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 568
    .end local v0           #buffer:[B
    .end local v2           #inputStream:Ljava/io/InputStream;
    .end local v4           #numRead:I
    :catch_1
    move-exception v1

    .line 569
    .restart local v1       #e:Ljava/lang/Exception;
    const-string v5, "DownloadFileAsyncTask"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Can not Instantiate MessageDigest or file error"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 573
    .end local v1           #e:Ljava/lang/Exception;
    .end local v3           #messageDigest:Ljava/security/MessageDigest;
    :cond_4
    const-string v6, "DownloadFileAsyncTask"

    const-string v7, "file.exists() == false && file.length() > 0"

    invoke-static {v6, v7}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    :try_start_3
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-result-object v3

    .line 576
    .restart local v3       #messageDigest:Ljava/security/MessageDigest;
    goto :goto_0

    .line 577
    .end local v3           #messageDigest:Ljava/security/MessageDigest;
    :catch_2
    move-exception v1

    .line 578
    .restart local v1       #e:Ljava/lang/Exception;
    const-string v6, "DownloadFileAsyncTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Can not Instantiate MessageDigest"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    move-object v3, v5

    .line 579
    goto :goto_0
.end method

.method protected onCancelled()V
    .locals 2

    .prologue
    .line 313
    const-string v0, "DownloadFileAsyncTask"

    const-string v1, "Cancelled"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 316
    return-void
.end method

.method protected onCancelled(Landroid/prestigio/update/asynctasks/DownloadResult;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 320
    const-string v0, "DownloadFileAsyncTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cancelled "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onCancelled(Ljava/lang/Object;)V

    .line 322
    return-void
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 63
    check-cast p1, Landroid/prestigio/update/asynctasks/DownloadResult;

    invoke-virtual {p0, p1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->onCancelled(Landroid/prestigio/update/asynctasks/DownloadResult;)V

    return-void
.end method

.method public onConfigurationChanged()V
    .locals 8

    .prologue
    .line 585
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInProgress()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 586
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadFileChecksum()Ljava/lang/String;

    move-result-object v3

    const-string v6, ""

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 587
    const-string v3, "DownloadFileAsyncTask"

    const-string v6, "Pre init dialog progress"

    invoke-static {v3, v6}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    iget-object v3, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->tempDownloadFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 589
    .local v4, length:J
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v0

    .line 590
    .local v0, contentLength:J
    const-wide/16 v6, 0x64

    mul-long/2addr v6, v4

    div-long/2addr v6, v0

    long-to-int v2, v6

    .line 591
    .local v2, currentProgressPercent:I
    iget-object v3, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    iput-wide v0, v3, Landroid/prestigio/update/asynctasks/DownloadProgress;->allBytes:J

    .line 592
    iget-object v3, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    iput-wide v4, v3, Landroid/prestigio/update/asynctasks/DownloadProgress;->readBytes:J

    .line 593
    iget-object v3, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    iput v2, v3, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    .line 594
    const/4 v3, 0x1

    new-array v3, v3, [Landroid/prestigio/update/asynctasks/DownloadProgress;

    const/4 v6, 0x0

    iget-object v7, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;

    aput-object v7, v3, v6

    invoke-virtual {p0, v3}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 596
    .end local v0           #contentLength:J
    .end local v2           #currentProgressPercent:I
    .end local v4           #length:J
    :cond_0
    return-void
.end method

.method protected onPostExecute(Landroid/prestigio/update/asynctasks/DownloadResult;)V
    .locals 3
    .parameter "result"

    .prologue
    .line 373
    const-string v0, "DownloadFileAsyncTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "last operation w="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 427
    :goto_0
    return-void

    .line 377
    :cond_0
    sget-object v0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask$1;->$SwitchMap$android$prestigio$update$asynctasks$DownloadResult:[I

    invoke-virtual {p1}, Landroid/prestigio/update/asynctasks/DownloadResult;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 426
    :goto_1
    :pswitch_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    goto :goto_0

    .line 379
    :pswitch_1
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    invoke-virtual {v0}, Landroid/prestigio/update/utils/NotificationUtils;->cancelAllNotifications()V

    .line 380
    invoke-direct {p0}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->copyResult()V

    goto :goto_1

    .line 402
    :pswitch_2
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    invoke-virtual {v0}, Landroid/prestigio/update/utils/NotificationUtils;->cancelAllNotifications()V

    .line 403
    invoke-static {}, Landroid/prestigio/update/activity/SettingsActivity;->sendServerErrorMessage()V

    .line 404
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    const v1, 0x7f04001e

    iget v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    invoke-virtual {v0, v1, v2}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(II)V

    goto :goto_1

    .line 410
    :pswitch_3
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    invoke-virtual {v0}, Landroid/prestigio/update/utils/NotificationUtils;->cancelAllNotifications()V

    .line 411
    invoke-static {}, Landroid/prestigio/update/activity/SettingsActivity;->sendServerTimeoutMessage()V

    .line 412
    invoke-static {}, Landroid/prestigio/update/utils/HttpConnectionUtils;->isInternetConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 413
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    const v1, 0x7f040024

    iget v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    invoke-virtual {v0, v1, v2}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(II)V

    goto :goto_1

    .line 415
    :cond_1
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    const v1, 0x7f04001f

    iget v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    invoke-virtual {v0, v1, v2}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(II)V

    goto :goto_1

    .line 420
    :pswitch_4
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    invoke-virtual {v0}, Landroid/prestigio/update/utils/NotificationUtils;->cancelAllNotifications()V

    .line 421
    invoke-static {}, Landroid/prestigio/update/activity/SettingsActivity;->sendFreeSpaceMessage()V

    .line 422
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    const v1, 0x7f040004

    iget v2, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->mCurrentProgressPercent:I

    invoke-virtual {v0, v1, v2}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(II)V

    goto :goto_1

    .line 377
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 63
    check-cast p1, Landroid/prestigio/update/asynctasks/DownloadResult;

    invoke-virtual {p0, p1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->onPostExecute(Landroid/prestigio/update/asynctasks/DownloadResult;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 96
    const-string v0, "DownloadFileAsyncTask"

    const-string v1, "call preexecue"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 98
    const/4 v0, 0x1

    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInProgress(Z)V

    .line 100
    return-void
.end method

.method protected varargs onProgressUpdate([Landroid/prestigio/update/asynctasks/DownloadProgress;)V
    .locals 4
    .parameter "values"

    .prologue
    const/4 v3, 0x0

    .line 328
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 329
    array-length v0, p1

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v0

    if-nez v0, :cond_1

    .line 330
    iget v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->lastProgressPercentage:I

    aget-object v1, p1, v3

    iget v1, v1, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    if-eq v0, v1, :cond_0

    .line 331
    aget-object v0, p1, v3

    iget v0, v0, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    iput v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->lastProgressPercentage:I

    .line 332
    const-string v0, "DownloadFileAsyncTask"

    const-string v1, "displayNotificationMessage"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    .line 334
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v1

    const v2, 0x7f04000f

    invoke-virtual {v1, v2}, Landroid/prestigio/update/UpdateApplication;->getString(I)Ljava/lang/String;

    move-result-object v1

    aget-object v2, p1, v3

    iget v2, v2, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    .line 333
    invoke-virtual {v0, v1, v2}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(Ljava/lang/String;I)V

    .line 367
    :cond_0
    aget-object v0, p1, v3

    invoke-static {v0}, Landroid/prestigio/update/activity/SettingsActivity;->sendDownloadProgressMessage(Landroid/prestigio/update/asynctasks/DownloadProgress;)V

    .line 369
    :cond_1
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 63
    check-cast p1, [Landroid/prestigio/update/asynctasks/DownloadProgress;

    invoke-virtual {p0, p1}, Landroid/prestigio/update/asynctasks/DownloadFileAsyncTask;->onProgressUpdate([Landroid/prestigio/update/asynctasks/DownloadProgress;)V

    return-void
.end method
