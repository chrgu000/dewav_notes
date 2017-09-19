.class Landroid/prestigio/update/activity/SettingsActivity$14;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/SettingsActivity;->onCreateDialog(I)Landroid/app/Dialog;
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
    .line 371
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$14;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 375
    const/4 v0, 0x0

    .line 376
    .local v0, check:Z
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isExternal()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 377
    const-string v2, ""

    invoke-static {v2}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 378
    .local v1, path:Ljava/lang/String;
    invoke-static {v1}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->isExternalStorageAvailable(Ljava/lang/String;)Z

    move-result v0

    .line 383
    .end local v1           #path:Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_0

    .line 385
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadDir()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroid/prestigio/update/activity/SettingsActivity$14;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    .line 386
    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mDownloadSize:J
    invoke-static {v3}, Landroid/prestigio/update/activity/SettingsActivity;->access$400(Landroid/prestigio/update/activity/SettingsActivity;)J

    move-result-wide v4

    .line 385
    invoke-static {v2, v4, v5}, Landroid/prestigio/update/utils/MemoryUtils;->isMemorySizeAvailable(Ljava/lang/String;J)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 397
    invoke-static {}, Landroid/prestigio/update/service/DownloadService;->startDownloadService()V

    .line 398
    iget-object v2, p0, Landroid/prestigio/update/activity/SettingsActivity$14;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    .line 399
    iget-object v2, p0, Landroid/prestigio/update/activity/SettingsActivity$14;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mButtonCheckNow:Landroid/widget/Button;
    invoke-static {v2}, Landroid/prestigio/update/activity/SettingsActivity;->access$500(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/widget/Button;

    move-result-object v2

    const v3, 0x7f040003

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(I)V

    .line 400
    const/4 v2, 0x0

    invoke-static {v2}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInPause(Z)V

    .line 405
    :cond_0
    :goto_1
    return-void

    .line 381
    :cond_1
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->isExternalStorageAvailableOldWay()Z

    move-result v0

    goto :goto_0

    .line 402
    :cond_2
    iget-object v2, p0, Landroid/prestigio/update/activity/SettingsActivity$14;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    const/16 v3, 0x9

    invoke-virtual {v2, v3}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_1
.end method
