.class Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;
.super Ljava/lang/Object;
.source "FirmwareUpdatingActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;


# direct methods
.method constructor <init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V
    .locals 0
    .parameter "this$0"

    .prologue
    .line 72
    iput-object p1, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 13
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 76
    :try_start_0
    const-string v9, "FirmwareUpdatingActivity"

    const-string v10, "start shutdown"

    invoke-static {v9, v10}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootMode()Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    move-result-object v3

    .line 84
    .local v3, mode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    sget-object v9, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$3;->$SwitchMap$android$prestigio$update$preferences$ApplicationPreferences$RebootMode:[I

    invoke-virtual {v3}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 160
    .end local v3           #mode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    :goto_0
    return-void

    .line 86
    .restart local v3       #mode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    :pswitch_0
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootRecoveryWC(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 157
    .end local v3           #mode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    :catch_0
    move-exception v1

    .line 158
    .local v1, e:Ljava/lang/Exception;
    const-string v9, "FirmwareUpdatingActivity"

    const-string v10, "Shutdown failed (no permissions?)"

    invoke-static {v9, v10}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 90
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v3       #mode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    :pswitch_1
    :try_start_1
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootRecoverySd(Landroid/content/Context;)V

    goto :goto_0

    .line 94
    :pswitch_2
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootRecovery(Landroid/content/Context;)V

    goto :goto_0

    .line 98
    :pswitch_3
    const-string v9, "/cache"

    invoke-static {v9}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 99
    .local v7, path:Ljava/lang/String;
    const-string v9, "update.zip"

    invoke-static {v9}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFileImgName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 100
    .local v2, img_file:Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v7, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .local v6, packageFile:Ljava/io/File;
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v9

    invoke-static {v9, v6}, Landroid/os/RecoverySystem;->installPackage(Landroid/content/Context;Ljava/io/File;)V

    goto :goto_0

    .line 105
    .end local v2           #img_file:Ljava/lang/String;
    .end local v6           #packageFile:Ljava/io/File;
    .end local v7           #path:Ljava/lang/String;
    :pswitch_4
    const-string v9, "/mnt/sdcard"

    invoke-static {v9}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFilePathName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 106
    .local v8, s_path:Ljava/lang/String;
    const-string v9, "/mnt/extsd"

    invoke-static {v9}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, d_path:Ljava/lang/String;
    new-instance v5, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;

    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-direct {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;-><init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V

    .line 108
    .local v5, mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object v8, v9, v10

    const/4 v10, 0x1

    aput-object v0, v9, v10

    invoke-virtual {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 112
    .end local v0           #d_path:Ljava/lang/String;
    .end local v5           #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    .end local v8           #s_path:Ljava/lang/String;
    :pswitch_5
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootRecoverySD_Media(Landroid/content/Context;)V

    goto :goto_0

    .line 116
    :pswitch_6
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getOtaProductName()Ljava/lang/String;

    move-result-object v4

    .line 117
    .local v4, model:Ljava/lang/String;
    const-string v9, "PMP5880D"

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 118
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootRecoveryWC(Landroid/content/Context;)V

    goto :goto_0

    .line 119
    :cond_0
    const-string v9, "PMP7280C3G"

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, "PMP7079D3G_QUAD"

    .line 120
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, "PMP7280C3G_QUAD"

    .line 121
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, "PMP5785C3G_QUAD"

    .line 122
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, "PMP7480D3G_QUAD"

    .line 123
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, "PMT7287C3G"

    .line 124
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, "PMP7380D3G"

    .line 125
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, "PAP5500DUO,PAP5450DUO,PAP5451DUO,PAP3400DUO,PAP3350DUO,PAP7600DUO"

    .line 127
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 128
    :cond_1
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootRecoverySd(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 129
    :cond_2
    const-string v9, "PAP4323,PAP5430"

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 130
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    new-instance v10, Ljava/io/File;

    const-string v11, "/media"

    const-string v12, "update.zip"

    invoke-direct {v10, v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v9, v10}, Landroid/os/RecoverySystem;->installPackage(Landroid/content/Context;Ljava/io/File;)V

    goto/16 :goto_0

    .line 132
    :cond_3
    const-string v9, "PAP5501"

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 133
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootRecoverySdMedia(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 134
    :cond_4
    const-string v9, "PMP3570C,PMT3677_Wi,PMP3670B,PMP3670B-WH,PER5474BC,PER5684BC,PER5364BC,PER5574BC"

    .line 135
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 136
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    new-instance v10, Ljava/io/File;

    const-string v11, "/cache"

    const-string v12, "update.zip"

    invoke-direct {v10, v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v9, v10}, Landroid/os/RecoverySystem;->installPackage(Landroid/content/Context;Ljava/io/File;)V

    goto/16 :goto_0

    .line 138
    :cond_5
    const-string v9, "PMP5770D,PMP5580C,PMP3870C"

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 139
    new-instance v5, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;

    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-direct {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;-><init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V

    .line 140
    .restart local v5       #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "/mnt/sdcard/external_sdcard/"

    aput-object v11, v9, v10

    invoke-virtual {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 141
    .end local v5           #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    :cond_6
    const-string v9, "PMT5677C_DUO,PMP5670C_DUO"

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_7

    const-string v9, "PMP3970B,PMP3970B_DUO"

    .line 142
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 143
    :cond_7
    new-instance v5, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;

    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-direct {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;-><init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V

    .line 144
    .restart local v5       #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "/mnt/external_sdcard/"

    aput-object v11, v9, v10

    invoke-virtual {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 145
    .end local v5           #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    :cond_8
    const-string v9, "PMP5588C,PMT5587_Wi"

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 146
    new-instance v5, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;

    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-direct {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;-><init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V

    .line 147
    .restart local v5       #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "/storage/external_storage/sdcard1/"

    aput-object v11, v9, v10

    invoke-virtual {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 148
    .end local v5           #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    :cond_9
    const-string v9, "GV5850"

    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 149
    new-instance v5, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;

    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-direct {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;-><init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V

    .line 150
    .restart local v5       #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "/cache/"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-string v11, "/mnt/extsd/"

    aput-object v11, v9, v10

    invoke-virtual {v5, v9}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 152
    .end local v5           #mycopy:Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
    :cond_a
    iget-object v9, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v9}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootRecovery(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 84
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
