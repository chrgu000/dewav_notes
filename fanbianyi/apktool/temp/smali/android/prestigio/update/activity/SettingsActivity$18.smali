.class Landroid/prestigio/update/activity/SettingsActivity$18;
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

.field final synthetic val$notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;


# direct methods
.method constructor <init>(Landroid/prestigio/update/activity/SettingsActivity;Landroid/prestigio/update/utils/NotificationUtils;)V
    .locals 0
    .parameter "this$0"
    .parameter

    .prologue
    .line 652
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$18;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    iput-object p2, p0, Landroid/prestigio/update/activity/SettingsActivity$18;->val$notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v3, 0x0

    .line 656
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$18;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$900(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 657
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$18;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$900(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    const v2, 0x7f04000f

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setTitle(I)V

    .line 658
    invoke-static {}, Landroid/prestigio/update/service/DownloadService;->stopDownloadService()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 659
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getTempDownloadFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 660
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getTempDownloadFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v0

    .line 661
    .local v0, deleteResult:Z
    const-string v1, ""

    invoke-static {v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadFileChecksum(Ljava/lang/String;)V

    .line 662
    if-nez v0, :cond_0

    .line 663
    const-string v1, "Settings"

    const-string v2, "cannot delete file"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 666
    .end local v0           #deleteResult:Z
    :cond_0
    invoke-static {v3}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInProgress(Z)V

    .line 667
    invoke-static {v3}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInPause(Z)V

    .line 669
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$18;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$500(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/widget/Button;

    move-result-object v1

    const v2, 0x7f040007

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(I)V

    .line 670
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$18;->val$notificationUtils:Landroid/prestigio/update/utils/NotificationUtils;

    invoke-virtual {v1}, Landroid/prestigio/update/utils/NotificationUtils;->cancelAllNotifications()V

    .line 672
    :cond_1
    return-void
.end method
