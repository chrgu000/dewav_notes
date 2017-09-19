.class public Landroid/prestigio/update/activity/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"


# static fields
.field private static final DIALOG_ID_DOWNLOAD_PROGRESS:I = 0x5

.field private static final DIALOG_ID_FREE_SPACE:I = 0x9

.field public static final DIALOG_ID_NEW_VERSION_FOUND:I = 0x3

.field public static final DIALOG_ID_NOT_AVAILABLE:I = 0x2

.field public static final DIALOG_ID_NO_CONNECT:I = 0x1

.field private static final DIALOG_ID_PLEASE_MOUNT_SD_CARD:I = 0x8

.field private static final DIALOG_ID_SERVER_ERROR:I = 0x6

.field private static final DIALOG_ID_SERVER_TIMEOUT:I = 0x7

.field private static final HANDLER_CONSTANT_DOWNLOAD_DONE:I = 0x64

.field private static final HANDLER_CONSTANT_FREE_SPACE:I = -0x5

.field private static final HANDLER_CONSTANT_SERVER_ERROR:I = -0x3

.field private static final HANDLER_CONSTANT_SERVER_TIMEOUT:I = -0x4

.field private static final TAG:Ljava/lang/String; = "Settings"

.field private static isDownloadErrorOccured:Z

.field private static mHandler:Landroid/os/Handler;


# instance fields
.field private mButtonCheckNow:Landroid/widget/Button;

.field private mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

.field private mDownloadSize:J

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field private mSwitchAutoCheckUpdates:Landroid/widget/Switch;

.field private mTextViewChangeLog:Landroid/widget/TextView;

.field private mTextViewLastCheck:Landroid/widget/TextView;

.field private mTextViewRebootNote:Landroid/widget/TextView;

.field private mTextViewVersion:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x0

    sput-object v0, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    .line 68
    const/4 v0, 0x0

    sput-boolean v0, Landroid/prestigio/update/activity/SettingsActivity;->isDownloadErrorOccured:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mSwitchAutoCheckUpdates:Landroid/widget/Switch;

    .line 65
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mDownloadSize:J

    return-void
.end method

.method static synthetic access$000(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->checkInternetAndExternalStorageBeforeDownload()V

    return-void
.end method

.method static synthetic access$100(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    return-object v0
.end method

.method static synthetic access$102(Landroid/prestigio/update/activity/SettingsActivity;Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;)Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 45
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    return-object p1
.end method

.method static synthetic access$200(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewLastCheck:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->resetParams()V

    return-void
.end method

.method static synthetic access$400(Landroid/prestigio/update/activity/SettingsActivity;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 45
    iget-wide v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mDownloadSize:J

    return-wide v0
.end method

.method static synthetic access$500(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/widget/Button;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$600(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->removeAllDialogs()V

    return-void
.end method

.method static synthetic access$702(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 45
    sput-boolean p0, Landroid/prestigio/update/activity/SettingsActivity;->isDownloadErrorOccured:Z

    return p0
.end method

.method static synthetic access$800(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->removeProgressDialog()V

    return-void
.end method

.method static synthetic access$900(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 45
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method private checkInternetAndExternalStorageBeforeDownload()V
    .locals 10

    .prologue
    const/16 v8, 0x8

    .line 445
    invoke-static {}, Landroid/prestigio/update/utils/HttpConnectionUtils;->isInternetConnected()Z

    move-result v7

    if-nez v7, :cond_0

    .line 446
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    .line 477
    :goto_0
    return-void

    .line 448
    :cond_0
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getOtaProductName()Ljava/lang/String;

    move-result-object v3

    .line 449
    .local v3, model:Ljava/lang/String;
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isExternal()Z

    move-result v7

    if-eqz v7, :cond_1

    const-string v7, ""

    .line 450
    invoke-static {v7}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->isExternalStorageAvailable(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 451
    invoke-virtual {p0, v8}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_0

    .line 452
    :cond_1
    const-string v7, "PAP3350DUO"

    invoke-virtual {v7, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->isSDCardExists()Z

    move-result v7

    if-nez v7, :cond_2

    .line 453
    invoke-virtual {p0, v8}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_0

    .line 454
    :cond_2
    const-string v7, "PMP3270B,GV5850,PMP3470B,PMP3770B,PMT5677C_DUO,PMP5670C_DUO,PMP5770D,PMP3870C,PMP5580C,PMT5587_Wi,PMP5588C,PMP3970B,PMP3970B_DUO,PAP7600DUO"

    .line 455
    invoke-virtual {v7, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 456
    invoke-virtual {p0, v8}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_0

    .line 458
    :cond_3
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadDir()Ljava/lang/String;

    move-result-object v7

    iget-wide v8, p0, Landroid/prestigio/update/activity/SettingsActivity;->mDownloadSize:J

    invoke-static {v7, v8, v9}, Landroid/prestigio/update/utils/MemoryUtils;->isMemorySizeAvailable(Ljava/lang/String;J)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 459
    new-instance v6, Landroid/prestigio/update/utils/NotificationUtils;

    invoke-direct {v6}, Landroid/prestigio/update/utils/NotificationUtils;-><init>()V

    .line 460
    .local v6, notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getTempDownloadFile()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 461
    .local v4, length:J
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v0

    .line 462
    .local v0, contentLength:J
    const-wide/16 v8, 0x64

    mul-long/2addr v8, v4

    div-long/2addr v8, v0

    long-to-int v2, v8

    .line 463
    .local v2, currentProgressPercent:I
    invoke-virtual {v6}, Landroid/prestigio/update/utils/NotificationUtils;->cancelAllNotifications()V

    .line 465
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v7

    const v8, 0x7f04000f

    invoke-virtual {v7, v8}, Landroid/prestigio/update/UpdateApplication;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 464
    invoke-virtual {v6, v7, v2}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(Ljava/lang/String;I)V

    .line 468
    invoke-static {}, Landroid/prestigio/update/service/DownloadService;->startDownloadService()V

    .line 469
    const/4 v7, 0x5

    invoke-virtual {p0, v7}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    .line 470
    iget-object v7, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    const v8, 0x7f040003

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(I)V

    .line 471
    const/4 v7, 0x0

    invoke-static {v7}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInPause(Z)V

    goto :goto_0

    .line 473
    .end local v0           #contentLength:J
    .end local v2           #currentProgressPercent:I
    .end local v4           #length:J
    .end local v6           #notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;
    :cond_4
    const/16 v7, 0x9

    invoke-virtual {p0, v7}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto/16 :goto_0
.end method

.method private getDownloadSizeLabel()Ljava/lang/String;
    .locals 2

    .prologue
    .line 441
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v0

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/MemoryUtils;->formatFileSize(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initHandler()V
    .locals 1

    .prologue
    .line 488
    new-instance v0, Landroid/prestigio/update/activity/SettingsActivity$16;

    invoke-direct {v0, p0}, Landroid/prestigio/update/activity/SettingsActivity$16;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    sput-object v0, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    .line 556
    return-void
.end method

.method private initProgressDialog()V
    .locals 10

    .prologue
    .line 618
    new-instance v3, Landroid/prestigio/update/utils/NotificationUtils;

    invoke-direct {v3}, Landroid/prestigio/update/utils/NotificationUtils;-><init>()V

    .line 620
    .local v3, notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;
    const-wide/16 v4, 0x0

    .line 621
    .local v4, length:J
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getTempDownloadFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 622
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getTempDownloadFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 624
    :cond_0
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v0

    .line 625
    .local v0, contentLength:J
    const/4 v2, 0x0

    .line 626
    .local v2, currentProgressPercent:I
    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-lez v6, :cond_1

    .line 627
    const-wide/16 v6, 0x64

    mul-long/2addr v6, v4

    div-long/2addr v6, v0

    long-to-int v2, v6

    .line 629
    :cond_1
    new-instance v6, Landroid/app/ProgressDialog;

    invoke-direct {v6, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 631
    iget-object v6, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 632
    iget-object v6, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const v8, 0x7f04000f

    invoke-virtual {p0, v8}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/MemoryUtils;->formatFileSizeLong(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 633
    invoke-static {v0, v1}, Landroid/prestigio/update/utils/MemoryUtils;->formatFileSize(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 632
    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 634
    iget-object v6, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 635
    iget-object v6, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v6, v2}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 636
    iget-object v6, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    const/16 v7, 0x64

    invoke-virtual {v6, v7}, Landroid/app/ProgressDialog;->setMax(I)V

    .line 637
    iget-object v6, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v7, -0x3

    const v8, 0x7f040004

    invoke-virtual {p0, v8}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Landroid/prestigio/update/activity/SettingsActivity$17;

    invoke-direct {v9, p0}, Landroid/prestigio/update/activity/SettingsActivity$17;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    invoke-virtual {v6, v7, v8, v9}, Landroid/app/ProgressDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 651
    iget-object v6, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v7, -0x2

    const v8, 0x7f040006

    invoke-virtual {p0, v8}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Landroid/prestigio/update/activity/SettingsActivity$18;

    invoke-direct {v9, p0, v3}, Landroid/prestigio/update/activity/SettingsActivity$18;-><init>(Landroid/prestigio/update/activity/SettingsActivity;Landroid/prestigio/update/utils/NotificationUtils;)V

    invoke-virtual {v6, v7, v8, v9}, Landroid/app/ProgressDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 674
    return-void
.end method

.method private removeAllDialogs()V
    .locals 2

    .prologue
    .line 564
    const-string v0, "Settings"

    const-string v1, "removeAllDialogs"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 567
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 568
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 569
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 570
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 571
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 572
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 573
    return-void
.end method

.method private removeProgressDialog()V
    .locals 2

    .prologue
    .line 559
    const-string v0, "Settings"

    const-string v1, "removeProgressDialog"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 561
    return-void
.end method

.method private resetParams()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 251
    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setFoundNewVersion(Z)V

    .line 252
    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInProgress(Z)V

    .line 253
    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadComplete(Z)V

    .line 254
    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInPause(Z)V

    .line 255
    const-string v0, ""

    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setUpdateLog(Ljava/lang/String;)V

    .line 256
    const-string v0, ""

    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaUri(Ljava/lang/String;)V

    .line 257
    const-string v0, ""

    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaName(Ljava/lang/String;)V

    .line 258
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setOtaPackageLength(J)V

    .line 259
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->clearOtaVersion()V

    .line 260
    return-void
.end method

.method public static sendDownloadProgressMessage(Landroid/prestigio/update/asynctasks/DownloadProgress;)V
    .locals 4
    .parameter "downloadProgress"

    .prologue
    .line 608
    const-string v1, "Settings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sendDownloadProgressMessage "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 609
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 610
    .local v0, localMessage:Landroid/os/Message;
    iget v1, p0, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 611
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 612
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 613
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 615
    :cond_0
    return-void
.end method

.method public static sendFreeSpaceMessage()V
    .locals 2

    .prologue
    .line 584
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 585
    .local v0, localMessage:Landroid/os/Message;
    const/4 v1, -0x5

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 586
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 587
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 589
    :cond_0
    return-void
.end method

.method public static sendServerErrorMessage()V
    .locals 2

    .prologue
    .line 600
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 601
    .local v0, localMessage:Landroid/os/Message;
    const/4 v1, -0x3

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 602
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 603
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 605
    :cond_0
    return-void
.end method

.method public static sendServerTimeoutMessage()V
    .locals 2

    .prologue
    .line 576
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 577
    .local v0, localMessage:Landroid/os/Message;
    const/4 v1, -0x4

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 578
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 579
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 581
    :cond_0
    return-void
.end method

.method public static sendShow()V
    .locals 2

    .prologue
    .line 592
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 593
    .local v0, localMessage:Landroid/os/Message;
    const/4 v1, -0x5

    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 594
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    if-eqz v1, :cond_0

    .line 595
    sget-object v1, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 597
    :cond_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 72
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 73
    const v1, 0x7f030002

    invoke-virtual {p0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->setContentView(I)V

    .line 74
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->initProgressDialog()V

    .line 75
    const v1, 0x7f080007

    invoke-virtual {p0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    iput-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mSwitchAutoCheckUpdates:Landroid/widget/Switch;

    .line 76
    const/high16 v1, 0x7f08

    invoke-virtual {p0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    .line 77
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isAutoCheck()Z

    move-result v0

    .line 78
    .local v0, check:Z
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mSwitchAutoCheckUpdates:Landroid/widget/Switch;

    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 79
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mSwitchAutoCheckUpdates:Landroid/widget/Switch;

    new-instance v2, Landroid/prestigio/update/activity/SettingsActivity$1;

    invoke-direct {v2, p0}, Landroid/prestigio/update/activity/SettingsActivity$1;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 94
    const v1, 0x7f08000e

    invoke-virtual {p0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewLastCheck:Landroid/widget/TextView;

    .line 95
    const v1, 0x7f080011

    invoke-virtual {p0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewChangeLog:Landroid/widget/TextView;

    .line 96
    const v1, 0x7f080010

    invoke-virtual {p0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewRebootNote:Landroid/widget/TextView;

    .line 97
    const v1, 0x7f08000f

    invoke-virtual {p0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewVersion:Landroid/widget/TextView;

    .line 99
    invoke-virtual {p0}, Landroid/prestigio/update/activity/SettingsActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    iput-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    .line 101
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    if-nez v1, :cond_1

    .line 109
    :cond_0
    :goto_0
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->initHandler()V

    .line 110
    return-void

    .line 104
    :cond_1
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    invoke-virtual {v1, p0}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->attach(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 105
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    invoke-virtual {v1}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v1

    sget-object v2, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v1, v2, :cond_0

    .line 106
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    invoke-virtual {v1}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->onPreExecute()V

    goto :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 15
    .parameter "id"

    .prologue
    .line 264
    packed-switch p1, :pswitch_data_0

    .line 422
    :pswitch_0
    const/4 v10, 0x0

    :goto_0
    return-object v10

    .line 266
    :pswitch_1
    new-instance v10, Landroid/app/AlertDialog$Builder;

    invoke-direct {v10, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v11, 0x7f040024

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f040025

    .line 267
    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000e

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$6;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$6;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 268
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000d

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$5;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$5;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 277
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 281
    invoke-virtual {v10}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    goto :goto_0

    .line 284
    :pswitch_2
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v10

    iput-wide v10, p0, Landroid/prestigio/update/activity/SettingsActivity;->mDownloadSize:J

    .line 285
    iget-object v10, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewVersion:Landroid/widget/TextView;

    const v11, 0x7f040021

    invoke-virtual {p0, v11}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    .line 286
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaVersion()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->getDownloadSizeLabel()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    .line 285
    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 287
    iget-object v10, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewRebootNote:Landroid/widget/TextView;

    const-string v11, ""

    invoke-static {v11}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootNote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 288
    iget-object v10, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewChangeLog:Landroid/widget/TextView;

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getUpdateLog()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    iget-object v10, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    new-instance v11, Landroid/prestigio/update/activity/SettingsActivity$7;

    invoke-direct {v11, p0}, Landroid/prestigio/update/activity/SettingsActivity$7;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 296
    iget-object v10, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    const v11, 0x7f040007

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setText(I)V

    .line 297
    invoke-virtual {p0}, Landroid/prestigio/update/activity/SettingsActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v10

    const v11, 0x7f030003

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 298
    .local v3, dialogContentView:Landroid/view/View;
    const v10, 0x7f080012

    invoke-virtual {v3, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 299
    .local v5, textView1:Landroid/widget/TextView;
    const v10, 0x7f080013

    invoke-virtual {v3, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 300
    .local v8, textView2:Landroid/widget/TextView;
    const v10, 0x7f080014

    invoke-virtual {v3, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 302
    .local v9, textView3:Landroid/widget/TextView;
    invoke-static {}, Landroid/prestigio/update/utils/HttpConnectionUtils;->isFreeInternetConnected()Z

    move-result v10

    if-eqz v10, :cond_0

    const v10, 0x7f040021

    :goto_1
    invoke-virtual {p0, v10}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    .line 303
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaVersion()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    .line 304
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->getDownloadSizeLabel()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    .line 301
    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    const-string v10, ""

    invoke-static {v10}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootNote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 306
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getUpdateLog()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    new-instance v10, Landroid/app/AlertDialog$Builder;

    invoke-direct {v10, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v11, 0x7f04

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 309
    invoke-virtual {v10, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000c

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$9;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$9;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 318
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000b

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$8;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$8;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 322
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 326
    invoke-virtual {v10}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    goto/16 :goto_0

    .line 302
    :cond_0
    const v10, 0x7f040022

    goto :goto_1

    .line 329
    .end local v3           #dialogContentView:Landroid/view/View;
    .end local v5           #textView1:Landroid/widget/TextView;
    .end local v8           #textView2:Landroid/widget/TextView;
    .end local v9           #textView3:Landroid/widget/TextView;
    :pswitch_3
    new-instance v10, Landroid/app/AlertDialog$Builder;

    invoke-direct {v10, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v11, 0x7f04

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f040027

    .line 330
    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000c

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$10;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$10;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 331
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 335
    invoke-virtual {v10}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    goto/16 :goto_0

    .line 338
    :pswitch_4
    new-instance v10, Landroid/app/AlertDialog$Builder;

    invoke-direct {v10, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v11, 0x7f04

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04001e

    .line 339
    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000c

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$11;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$11;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 340
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 346
    invoke-virtual {v10}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    goto/16 :goto_0

    .line 349
    :pswitch_5
    new-instance v10, Landroid/app/AlertDialog$Builder;

    invoke-direct {v10, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v11, 0x7f04

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04001f

    .line 350
    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000c

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$12;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$12;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 351
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 355
    invoke-virtual {v10}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    goto/16 :goto_0

    .line 358
    :pswitch_6
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getTempDownloadFile()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v6

    .line 359
    .local v6, length:J
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v0

    .line 360
    .local v0, contentLength:J
    const-wide/16 v10, 0x64

    mul-long/2addr v10, v6

    div-long/2addr v10, v0

    long-to-int v2, v10

    .line 361
    .local v2, currentProgressPercent:I
    new-instance v4, Landroid/prestigio/update/asynctasks/DownloadProgress;

    invoke-direct {v4}, Landroid/prestigio/update/asynctasks/DownloadProgress;-><init>()V

    .line 362
    .local v4, downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;
    iput v2, v4, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    .line 363
    iput-wide v6, v4, Landroid/prestigio/update/asynctasks/DownloadProgress;->readBytes:J

    .line 364
    iput-wide v0, v4, Landroid/prestigio/update/asynctasks/DownloadProgress;->allBytes:J

    .line 365
    invoke-static {v4}, Landroid/prestigio/update/activity/SettingsActivity;->sendDownloadProgressMessage(Landroid/prestigio/update/asynctasks/DownloadProgress;)V

    .line 366
    iget-object v10, p0, Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    goto/16 :goto_0

    .line 369
    .end local v0           #contentLength:J
    .end local v2           #currentProgressPercent:I
    .end local v4           #downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;
    .end local v6           #length:J
    :pswitch_7
    new-instance v10, Landroid/app/AlertDialog$Builder;

    invoke-direct {v10, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v11, 0x7f04

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04002a

    .line 370
    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000c

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$14;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$14;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 371
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000b

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$13;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$13;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 406
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 410
    invoke-virtual {v10}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    goto/16 :goto_0

    .line 412
    :pswitch_8
    new-instance v10, Landroid/app/AlertDialog$Builder;

    invoke-direct {v10, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v11, 0x7f04

    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f040026

    .line 413
    invoke-virtual {v10, v11}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const v11, 0x7f04000c

    new-instance v12, Landroid/prestigio/update/activity/SettingsActivity$15;

    invoke-direct {v12, p0}, Landroid/prestigio/update/activity/SettingsActivity$15;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 414
    invoke-virtual {v10, v11, v12}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    .line 418
    invoke-virtual {v10}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    goto/16 :goto_0

    .line 264
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_6
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 427
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 428
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    if-eqz v1, :cond_0

    .line 430
    :try_start_0
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    iget-object v1, v1, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_0

    .line 431
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    iget-object v1, v1, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 432
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    iget-object v1, v1, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 438
    :cond_0
    :goto_0
    return-void

    .line 435
    :catch_0
    move-exception v0

    .line 436
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 126
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 127
    invoke-virtual {p0}, Landroid/prestigio/update/activity/SettingsActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    const/4 v0, 0x0

    sput-object v0, Landroid/prestigio/update/activity/SettingsActivity;->mHandler:Landroid/os/Handler;

    .line 134
    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 138
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 139
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInProgress()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 140
    sget-boolean v4, Landroid/prestigio/update/activity/SettingsActivity;->isDownloadErrorOccured:Z

    if-eqz v4, :cond_0

    .line 141
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->removeProgressDialog()V

    .line 142
    sput-boolean v9, Landroid/prestigio/update/activity/SettingsActivity;->isDownloadErrorOccured:Z

    .line 149
    :cond_0
    :goto_0
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInProgress()Z

    move-result v2

    .line 150
    .local v2, isDownloadInProgress:Z
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadComplete()Z

    move-result v0

    .line 151
    .local v0, isDownloadComplete:Z
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v1

    .line 153
    .local v1, isDownloadInPause:Z
    const-string v4, "Settings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onResume isDownloadInProgress "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    const-string v4, "Settings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onResume isDownloadComplete "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    const-string v4, "Settings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onResume isDownloadInPause "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isFoundNewVersion()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 157
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v4

    iput-wide v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mDownloadSize:J

    .line 158
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewVersion:Landroid/widget/TextView;

    const v5, 0x7f040021

    invoke-virtual {p0, v5}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    .line 159
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaVersion()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->getDownloadSizeLabel()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    .line 158
    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewRebootNote:Landroid/widget/TextView;

    const-string v5, ""

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootNote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewChangeLog:Landroid/widget/TextView;

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getUpdateLog()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    new-instance v5, Landroid/prestigio/update/activity/SettingsActivity$2;

    invoke-direct {v5, p0}, Landroid/prestigio/update/activity/SettingsActivity$2;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    if-eqz v2, :cond_2

    .line 170
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    const v5, 0x7f040003

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 172
    if-nez v1, :cond_3

    if-nez v0, :cond_3

    .line 175
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isSDCardMounted()Z

    move-result v4

    if-nez v4, :cond_3

    .line 176
    const-string v4, "Please mount SD Card before continue"

    invoke-static {p0, v4, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 177
    invoke-virtual {p0}, Landroid/prestigio/update/activity/SettingsActivity;->finish()V

    .line 248
    :goto_1
    return-void

    .line 145
    .end local v0           #isDownloadComplete:Z
    .end local v1           #isDownloadInPause:Z
    .end local v2           #isDownloadInProgress:Z
    :cond_1
    invoke-direct {p0}, Landroid/prestigio/update/activity/SettingsActivity;->removeProgressDialog()V

    goto/16 :goto_0

    .line 184
    .restart local v0       #isDownloadComplete:Z
    .restart local v1       #isDownloadInPause:Z
    .restart local v2       #isDownloadInProgress:Z
    :cond_2
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    const v5, 0x7f040007

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 186
    :cond_3
    if-eqz v0, :cond_4

    .line 187
    invoke-virtual {p0, v8}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 188
    const/4 v4, 0x7

    invoke-virtual {p0, v4}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 189
    invoke-static {}, Landroid/prestigio/update/utils/FlashFolderUtils;->isUpdateFileExists()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 190
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    new-instance v5, Landroid/prestigio/update/activity/SettingsActivity$3;

    invoke-direct {v5, p0}, Landroid/prestigio/update/activity/SettingsActivity$3;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 223
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewRebootNote:Landroid/widget/TextView;

    const-string v5, ""

    invoke-static {v5}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootNote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewChangeLog:Landroid/widget/TextView;

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getUpdateLog()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    const v5, 0x7f040008

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(I)V

    .line 226
    invoke-static {v8}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadComplete(Z)V

    .line 227
    const/4 v4, 0x5

    invoke-virtual {p0, v4}, Landroid/prestigio/update/activity/SettingsActivity;->removeDialog(I)V

    .line 246
    :cond_4
    :goto_2
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getLastUpdateString()Ljava/lang/String;

    move-result-object v3

    .line 247
    .local v3, lastUpdate:Ljava/lang/String;
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mTextViewLastCheck:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const v6, 0x7f040010

    invoke-virtual {p0, v6}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 231
    .end local v3           #lastUpdate:Ljava/lang/String;
    :cond_5
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;

    new-instance v5, Landroid/prestigio/update/activity/SettingsActivity$4;

    invoke-direct {v5, p0}, Landroid/prestigio/update/activity/SettingsActivity$4;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    invoke-virtual {v0}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->detach()V

    .line 117
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    .line 119
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onRetainNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method
