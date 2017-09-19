.class Landroid/prestigio/update/activity/SettingsActivity$16$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/SettingsActivity$16;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

.field final synthetic val$message:Landroid/os/Message;

.field final synthetic val$progress:I


# direct methods
.method constructor <init>(Landroid/prestigio/update/activity/SettingsActivity$16;Landroid/os/Message;I)V
    .locals 0
    .parameter "this$1"
    .parameter
    .parameter

    .prologue
    .line 494
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iput-object p2, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->val$message:Landroid/os/Message;

    iput p3, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->val$progress:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v4, 0x5

    const/4 v3, 0x1

    .line 498
    const/4 v0, 0x0

    .line 499
    .local v0, downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->val$message:Landroid/os/Message;

    iget-object v1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 500
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->val$message:Landroid/os/Message;

    iget-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local v0           #downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;
    check-cast v0, Landroid/prestigio/update/asynctasks/DownloadProgress;

    .line 503
    .restart local v0       #downloadProgress:Landroid/prestigio/update/asynctasks/DownloadProgress;
    :cond_0
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #calls: Landroid/prestigio/update/activity/SettingsActivity;->removeAllDialogs()V
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$600(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 504
    iget v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->val$progress:I

    if-ltz v1, :cond_1

    iget v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->val$progress:I

    const/16 v2, 0x64

    if-eq v1, v2, :cond_1

    .line 505
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v1

    if-nez v1, :cond_1

    .line 506
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadComplete()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 507
    :cond_1
    invoke-static {v3}, Landroid/prestigio/update/activity/SettingsActivity;->access$702(Z)Z

    .line 508
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #calls: Landroid/prestigio/update/activity/SettingsActivity;->removeProgressDialog()V
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$800(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 510
    :cond_2
    iget v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->val$progress:I

    sparse-switch v1, :sswitch_data_0

    .line 537
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInProgress()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 538
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInPause()Z

    move-result v1

    if-nez v1, :cond_4

    .line 539
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$900(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_3

    .line 540
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-virtual {v1, v4}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    .line 541
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-virtual {v1, v4}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    .line 543
    :cond_3
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$900(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    iget v2, v0, Landroid/prestigio/update/asynctasks/DownloadProgress;->percentage:I

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 544
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$900(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/app/ProgressDialog;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v3, v3, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    const v4, 0x7f04000f

    invoke-virtual {v3, v4}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v4, v0, Landroid/prestigio/update/asynctasks/DownloadProgress;->readBytes:J

    .line 545
    invoke-static {v4, v5}, Landroid/prestigio/update/utils/MemoryUtils;->formatFileSizeLong(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v4, v0, Landroid/prestigio/update/asynctasks/DownloadProgress;->allBytes:J

    .line 546
    invoke-static {v4, v5}, Landroid/prestigio/update/utils/MemoryUtils;->formatFileSize(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 544
    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 551
    :cond_4
    :goto_0
    return-void

    .line 512
    :sswitch_0
    const-string v1, "Settings"

    const-string v2, "HANDLER_CONSTANT_DOWNLOAD_DONE"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    invoke-static {v3}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadComplete(Z)V

    .line 514
    const/4 v1, 0x0

    invoke-static {v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setDownloadInProgress(Z)V

    .line 515
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-virtual {v1}, Landroid/prestigio/update/activity/SettingsActivity;->recreate()V

    goto :goto_0

    .line 519
    :sswitch_1
    const-string v1, "Settings"

    const-string v2, "HANDLER_CONSTANT_SERVER_ERROR"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 520
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_0

    .line 524
    :sswitch_2
    const-string v1, "Settings"

    const-string v2, "HANDLER_CONSTANT_SERVER_TIMEOUT"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_0

    .line 529
    :sswitch_3
    const-string v1, "Settings"

    const-string v2, "HANDLER_CONSTANT_FREE_SPACE"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->isDownloadInProgress()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 531
    const-string v1, "Settings"

    const-string v2, "isDownloadInProgress"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 532
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16$1;->this$1:Landroid/prestigio/update/activity/SettingsActivity$16;

    iget-object v1, v1, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/prestigio/update/activity/SettingsActivity;->showDialog(I)V

    goto :goto_0

    .line 510
    :sswitch_data_0
    .sparse-switch
        -0x5 -> :sswitch_3
        -0x4 -> :sswitch_2
        -0x3 -> :sswitch_1
        0x64 -> :sswitch_0
    .end sparse-switch
.end method
