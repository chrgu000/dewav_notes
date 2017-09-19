.class public Landroid/prestigio/update/preferences/ApplicationPreferences;
.super Ljava/lang/Object;
.source "ApplicationPreferences.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    }
.end annotation


# static fields
.field private static final PARAM_FILE_IMG_NAME:Ljava/lang/String; = "android.prestigio.update.param_file_img_name"

.field private static final PARAM_FILE_PATH_NAME:Ljava/lang/String; = "android.prestigio.update.param_file_path_name"

.field private static final PARAM_IS_EXTERNAL:Ljava/lang/String; = "android.prestigio.update.param_is_external"

.field private static final PARAM_REBOOT_COPY_FILE:Ljava/lang/String; = "android.prestigio.update.reboot_cp_file"

.field private static final PARAM_REBOOT_COPY_FILE2:Ljava/lang/String; = "android.prestigio.update.reboot_cp_file2"

.field private static final PARAM_REBOOT_FILE:Ljava/lang/String; = "android.prestigio.update.reboot_file"

.field private static final PARAM_REBOOT_MODE:Ljava/lang/String; = "android.prestigio.update.param_reboot_mode"

.field private static final PARAM_REBOOT_MSG:Ljava/lang/String; = "android.prestigio.update.reboot_msg"

.field private static final PARAM_REBOOT_NOTE:Ljava/lang/String; = "android.prestigio.update.reboot_note"

.field private static final PREF_AUTO:Ljava/lang/String; = "android.prestigio.update.auto_check"

.field private static final PREF_FOUND:Ljava/lang/String; = "android.prestigio.update.found_new_version"

.field private static final PREF_IS_DOWNLOAD_COMPLETE:Ljava/lang/String; = "android.prestigio.update.download_complete"

.field private static final PREF_IS_DOWNLOAD_IN_PAUSE:Ljava/lang/String; = "android.prestigio.update.download_pause"

.field private static final PREF_IS_DOWNLOAD_IN_PROGRESS:Ljava/lang/String; = "android.prestigio.update.download_process"

.field private static final PREF_IS_SDCARD_MOUNTED:Ljava/lang/String; = "android.prestigio.update.is_sdcard_mounted"

.field private static final PREF_LAST_UPDATE_TIME_MILLIS:Ljava/lang/String; = "android.prestigio.update.last_time"

.field private static final PREF_LAST_UPDATE_TIME_STRING:Ljava/lang/String; = "android.prestigio.update.last_update"

.field private static final PREF_OTA_LENGTH:Ljava/lang/String; = "android.prestigio.update.otaPackageLength"

.field private static final PREF_OTA_NAME:Ljava/lang/String; = "android.prestigio.update.otaPackageName"

.field private static final PREF_OTA_URI:Ljava/lang/String; = "android.prestigio.update.otaPackageURI"

.field private static final PREF_OTA_VERSION:Ljava/lang/String; = "android.prestigio.update.version"

.field private static final PREF_TEMP_DOWNLOAD_FILE_CHECKSUM:Ljava/lang/String; = "android.prestigio.update.temp_download_file_checksum"

.field private static final PREF_UPDATE_LOG:Ljava/lang/String; = "android.prestigio.update.update_log"

.field public static final TEMP_DOWNLOAD_FILE_NAME:Ljava/lang/String; = "tmp_update.tmp"

.field private static mApplicationPreferences:Landroid/prestigio/update/preferences/ApplicationPreferences;

.field private static prefFile:Ljava/lang/String;


# instance fields
.field private mSharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const-string v0, "android.prestigio.update.prestigio_ota"

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->prefFile:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    sget-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->prefFile:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    .line 77
    return-void
.end method

.method public static clearOtaVersion()V
    .locals 2

    .prologue
    .line 190
    const-string v0, "android.prestigio.update.version"

    const-string v1, "0.0"

    invoke-static {v0, v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    return-void
.end method

.method public static getDownloadDir()Ljava/lang/String;
    .locals 3

    .prologue
    .line 218
    const-string v0, "/mnt/sdcard"

    .line 219
    .local v0, dir:Ljava/lang/String;
    const-string v2, ""

    invoke-static {v2}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFilePathName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 220
    .local v1, download_dir:Ljava/lang/String;
    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 221
    move-object v0, v1

    .line 223
    :cond_0
    return-object v0
.end method

.method public static getDownloadFileChecksum()Ljava/lang/String;
    .locals 3

    .prologue
    .line 154
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.temp_download_file_checksum"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFileImgName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "defValue"

    .prologue
    .line 206
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.param_file_img_name"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFilePathName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "defValue"

    .prologue
    .line 214
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.param_file_path_name"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;
    .locals 3

    .prologue
    .line 80
    const-class v1, Landroid/prestigio/update/preferences/ApplicationPreferences;

    monitor-enter v1

    :try_start_0
    new-instance v0, Landroid/prestigio/update/preferences/ApplicationPreferences;

    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/prestigio/update/preferences/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mApplicationPreferences:Landroid/prestigio/update/preferences/ApplicationPreferences;

    .line 81
    sget-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mApplicationPreferences:Landroid/prestigio/update/preferences/ApplicationPreferences;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getLastUpdateString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 137
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.last_update"

    .line 138
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f040020

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 137
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLastUpdateTime()J
    .locals 4

    .prologue
    .line 146
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.last_time"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getOtaName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 178
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.otaPackageName"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getOtaPackageLength()J
    .locals 4

    .prologue
    .line 186
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.otaPackageLength"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getOtaUri()Ljava/lang/String;
    .locals 3

    .prologue
    .line 170
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.otaPackageURI"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getOtaVersion()Ljava/lang/String;
    .locals 3

    .prologue
    .line 198
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.version"

    const-string v2, "0.0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "defValue"

    .prologue
    .line 243
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.reboot_file"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "defValue"

    .prologue
    .line 254
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.reboot_cp_file"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootFilePath2(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "defValue"

    .prologue
    .line 265
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.reboot_cp_file2"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootMode()Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    .locals 5

    .prologue
    .line 273
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v2

    iget-object v2, v2, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v3, "android.prestigio.update.param_reboot_mode"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 274
    .local v1, strRebootMode:Ljava/lang/String;
    invoke-static {v1}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->getRebootModeByHttpValue(Ljava/lang/String;)Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    move-result-object v0

    .line 275
    .local v0, rebootMode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    return-object v0
.end method

.method public static getRebootMsg()Ljava/lang/String;
    .locals 4

    .prologue
    .line 283
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v1

    iget-object v1, v1, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v2, "android.prestigio.update.reboot_msg"

    .line 284
    invoke-static {}, Landroid/prestigio/update/utils/ResourceUtils;->getDefaultRebootMessage()Ljava/lang/String;

    move-result-object v3

    .line 283
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 285
    .local v0, message:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 286
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v1

    const v2, 0x7f04001c

    invoke-virtual {v1, v2}, Landroid/prestigio/update/UpdateApplication;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 288
    .end local v0           #message:Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static getRebootNote(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "defValue"

    .prologue
    .line 297
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.reboot_note"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTempDownloadFile()Ljava/io/File;
    .locals 3

    .prologue
    .line 227
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getDownloadDir()Ljava/lang/String;

    move-result-object v1

    const-string v2, "tmp_update.tmp"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getUpdateLog()Ljava/lang/String;
    .locals 3

    .prologue
    .line 162
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.update_log"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isAutoCheck()Z
    .locals 3

    .prologue
    .line 93
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.auto_check"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDownloadComplete()Z
    .locals 3

    .prologue
    .line 117
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.download_complete"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDownloadInPause()Z
    .locals 3

    .prologue
    .line 125
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.download_pause"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isDownloadInProgress()Z
    .locals 3

    .prologue
    .line 101
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.download_process"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isExternal()Z
    .locals 3

    .prologue
    .line 231
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.param_is_external"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isFoundNewVersion()Z
    .locals 3

    .prologue
    .line 85
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.found_new_version"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSDCardMounted()Z
    .locals 3

    .prologue
    .line 109
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "android.prestigio.update.is_sdcard_mounted"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static saveBooleanPreference(Ljava/lang/String;Z)V
    .locals 2
    .parameter "key"
    .parameter "value"

    .prologue
    .line 329
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 330
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 334
    :goto_0
    return-void

    .line 332
    :cond_0
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method private static saveIntPreference(Ljava/lang/String;I)V
    .locals 2
    .parameter "key"
    .parameter "value"

    .prologue
    .line 321
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 322
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 326
    :goto_0
    return-void

    .line 324
    :cond_0
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method private static saveLongPreference(Ljava/lang/String;J)V
    .locals 3
    .parameter "key"
    .parameter "value"

    .prologue
    .line 305
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 306
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 310
    :goto_0
    return-void

    .line 308
    :cond_0
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method private static saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "key"
    .parameter "value"

    .prologue
    .line 313
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 314
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 318
    :goto_0
    return-void

    .line 316
    :cond_0
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getInstance()Landroid/prestigio/update/preferences/ApplicationPreferences;

    move-result-object v0

    iget-object v0, v0, Landroid/prestigio/update/preferences/ApplicationPreferences;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public static setAutoCheck(Z)V
    .locals 1
    .parameter "isAutoCheck"

    .prologue
    .line 97
    const-string v0, "android.prestigio.update.auto_check"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveBooleanPreference(Ljava/lang/String;Z)V

    .line 98
    return-void
.end method

.method public static setDownloadComplete(Z)V
    .locals 1
    .parameter "isDownloadComplete"

    .prologue
    .line 121
    const-string v0, "android.prestigio.update.download_complete"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveBooleanPreference(Ljava/lang/String;Z)V

    .line 122
    return-void
.end method

.method public static setDownloadFileChecksum(Ljava/lang/String;)V
    .locals 1
    .parameter "checkSum"

    .prologue
    .line 150
    const-string v0, "android.prestigio.update.temp_download_file_checksum"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public static setDownloadInPause(Z)V
    .locals 1
    .parameter "isDownloadInPause"

    .prologue
    .line 129
    const-string v0, "android.prestigio.update.download_pause"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveBooleanPreference(Ljava/lang/String;Z)V

    .line 130
    return-void
.end method

.method public static setDownloadInProgress(Z)V
    .locals 1
    .parameter "isDownloadInProgress"

    .prologue
    .line 105
    const-string v0, "android.prestigio.update.download_process"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveBooleanPreference(Ljava/lang/String;Z)V

    .line 106
    return-void
.end method

.method public static setFileImgName(Ljava/lang/String;)V
    .locals 1
    .parameter "fileImgName"

    .prologue
    .line 202
    const-string v0, "android.prestigio.update.param_file_img_name"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    return-void
.end method

.method public static setFilePathName(Ljava/lang/String;)V
    .locals 1
    .parameter "filePathName"

    .prologue
    .line 210
    const-string v0, "android.prestigio.update.param_file_path_name"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    return-void
.end method

.method public static setFoundNewVersion(Z)V
    .locals 1
    .parameter "isFoundNewVersion"

    .prologue
    .line 89
    const-string v0, "android.prestigio.update.found_new_version"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveBooleanPreference(Ljava/lang/String;Z)V

    .line 90
    return-void
.end method

.method public static setIsExternal(Z)V
    .locals 1
    .parameter "isExt"

    .prologue
    .line 235
    const-string v0, "android.prestigio.update.param_is_external"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveBooleanPreference(Ljava/lang/String;Z)V

    .line 236
    return-void
.end method

.method public static setLastUpdateString(Ljava/lang/String;)V
    .locals 1
    .parameter "lastUpdate"

    .prologue
    .line 133
    const-string v0, "android.prestigio.update.last_update"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    return-void
.end method

.method public static setLastUpdateTime(J)V
    .locals 2
    .parameter "lastUpdateTime"

    .prologue
    .line 142
    const-string v0, "android.prestigio.update.last_time"

    invoke-static {v0, p0, p1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveLongPreference(Ljava/lang/String;J)V

    .line 143
    return-void
.end method

.method public static setOtaName(Ljava/lang/String;)V
    .locals 1
    .parameter "otaName"

    .prologue
    .line 174
    const-string v0, "android.prestigio.update.otaPackageName"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method public static setOtaPackageLength(J)V
    .locals 2
    .parameter "otaLength"

    .prologue
    .line 182
    const-string v0, "android.prestigio.update.otaPackageLength"

    invoke-static {v0, p0, p1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveLongPreference(Ljava/lang/String;J)V

    .line 183
    return-void
.end method

.method public static setOtaUri(Ljava/lang/String;)V
    .locals 1
    .parameter "otaUri"

    .prologue
    .line 166
    const-string v0, "android.prestigio.update.otaPackageURI"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method public static setOtaVersion(Ljava/lang/String;)V
    .locals 1
    .parameter "otaName"

    .prologue
    .line 194
    const-string v0, "android.prestigio.update.version"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method public static setRebootFileName(Ljava/lang/String;)V
    .locals 1
    .parameter "rebootFile"

    .prologue
    .line 239
    const-string v0, "android.prestigio.update.reboot_file"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    return-void
.end method

.method public static setRebootFilePath(Ljava/lang/String;)V
    .locals 1
    .parameter "rebootCopyFile"

    .prologue
    .line 247
    const-string v0, "android.prestigio.update.reboot_cp_file"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    return-void
.end method

.method public static setRebootFilePath2(Ljava/lang/String;)V
    .locals 1
    .parameter "rebootCopyFile"

    .prologue
    .line 258
    const-string v0, "android.prestigio.update.reboot_cp_file2"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method public static setRebootMode(Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;)V
    .locals 2
    .parameter "rebootMode"

    .prologue
    .line 269
    const-string v0, "android.prestigio.update.param_reboot_mode"

    #getter for: Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->mHttpValue:Ljava/lang/String;
    invoke-static {p0}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->access$000(Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    return-void
.end method

.method public static setRebootMsg(Ljava/lang/String;)V
    .locals 1
    .parameter "rebootMsg"

    .prologue
    .line 279
    const-string v0, "android.prestigio.update.reboot_msg"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    return-void
.end method

.method public static setRebootNote(Ljava/lang/String;)V
    .locals 1
    .parameter "rebootNote"

    .prologue
    .line 293
    const-string v0, "android.prestigio.update.reboot_note"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    return-void
.end method

.method public static setSDCardMounted(Z)V
    .locals 1
    .parameter "isSDCardMounted"

    .prologue
    .line 113
    const-string v0, "android.prestigio.update.is_sdcard_mounted"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveBooleanPreference(Ljava/lang/String;Z)V

    .line 114
    return-void
.end method

.method public static setUpdateLog(Ljava/lang/String;)V
    .locals 1
    .parameter "updateLog"

    .prologue
    .line 158
    const-string v0, "android.prestigio.update.update_log"

    invoke-static {v0, p0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->saveStringPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    return-void
.end method
