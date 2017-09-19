.class Landroid/prestigio/update/activity/SettingsActivity$17;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/SettingsActivity;->initProgressDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/prestigio/update/activity/SettingsActivity;


# direct methods
.method constructor <init>(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 0
    .parameter "this$0"

    .prologue
    .line 638
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$17;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 642
    const/4 v6, 0x1

    invoke-static {v6}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInPause(Z)V

    .line 643
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getTempDownloadFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 644
    .local v4, length:J
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getOtaPackageLength()J

    move-result-wide v0

    .line 645
    .local v0, contentLength:J
    const-wide/16 v6, 0x64

    mul-long/2addr v6, v4

    div-long/2addr v6, v0

    long-to-int v2, v6

    .line 646
    .local v2, currentProgressPercent:I
    new-instance v3, Landroid/prestigio/update/utils/NotificationUtils;

    invoke-direct {v3}, Landroid/prestigio/update/utils/NotificationUtils;-><init>()V

    .line 647
    .local v3, notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;
    invoke-virtual {v3}, Landroid/prestigio/update/utils/NotificationUtils;->cancelAllNotifications()V

    .line 648
    const v6, 0x7f040004

    invoke-virtual {v3, v6, v2}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(II)V

    .line 649
    return-void
.end method
