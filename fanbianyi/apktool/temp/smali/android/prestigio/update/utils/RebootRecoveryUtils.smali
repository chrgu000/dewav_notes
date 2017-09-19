.class public Landroid/prestigio/update/utils/RebootRecoveryUtils;
.super Ljava/lang/Object;
.source "RebootRecoveryUtils.java"


# static fields
.field private static final COMMAND_FILE:Ljava/io/File;

.field private static final RECOVERY_DIR:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 15
    new-instance v0, Ljava/io/File;

    const-string v1, "/cache/recovery"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/utils/RebootRecoveryUtils;->RECOVERY_DIR:Ljava/io/File;

    .line 16
    new-instance v0, Ljava/io/File;

    sget-object v1, Landroid/prestigio/update/utils/RebootRecoveryUtils;->RECOVERY_DIR:Ljava/io/File;

    const-string v2, "command"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/utils/RebootRecoveryUtils;->COMMAND_FILE:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static rebootDeviceInRecoveryMode(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 73
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 74
    .local v0, launch:Landroid/content/Intent;
    const-string v1, "android.prestigio.update"

    const-string v2, "android.prestigio.update.ExReboot"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 75
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 77
    return-void
.end method

.method public static rebootRecovery(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 24
    const-string v0, "--show_text\n"

    invoke-static {v0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->writeCommandToRecoveryFile(Ljava/lang/String;)V

    .line 25
    invoke-static {p0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootDeviceInRecoveryMode(Landroid/content/Context;)V

    .line 26
    return-void
.end method

.method public static rebootRecoverySD_Media(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 39
    const-string v0, "/mnt/sdcard2"

    invoke-static {v0}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->isExternalStorageAvailable(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "--update_package="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/sdcard2/"

    invoke-static {v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFilePath2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "update.zip"

    .line 42
    invoke-static {v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 41
    invoke-static {v0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->writeCommandToRecoveryFile(Ljava/lang/String;)V

    .line 50
    :goto_0
    invoke-static {p0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootDeviceInRecoveryMode(Landroid/content/Context;)V

    .line 51
    return-void

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "--update_package="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/sdcard/"

    invoke-static {v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "update.zip"

    .line 47
    invoke-static {v1}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 46
    invoke-static {v0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->writeCommandToRecoveryFile(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static rebootRecoverySd(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 19
    const-string v0, "--update_package=/sdcard/update.zip\n"

    invoke-static {v0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->writeCommandToRecoveryFile(Ljava/lang/String;)V

    .line 20
    invoke-static {p0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootDeviceInRecoveryMode(Landroid/content/Context;)V

    .line 21
    return-void
.end method

.method public static rebootRecoverySdMedia(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 34
    const-string v0, "--update_package=/sdcard/media/update.zip\n"

    invoke-static {v0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->writeCommandToRecoveryFile(Ljava/lang/String;)V

    .line 35
    invoke-static {p0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootDeviceInRecoveryMode(Landroid/content/Context;)V

    .line 36
    return-void
.end method

.method public static rebootRecoveryWC(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 29
    const-string v0, "--update_package=CACHE:/recovery/update.zip"

    invoke-static {v0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->writeCommandToRecoveryFile(Ljava/lang/String;)V

    .line 30
    invoke-static {p0}, Landroid/prestigio/update/utils/RebootRecoveryUtils;->rebootDeviceInRecoveryMode(Landroid/content/Context;)V

    .line 31
    return-void
.end method

.method private static writeCommandToRecoveryFile(Ljava/lang/String;)V
    .locals 5
    .parameter "showText"

    .prologue
    .line 54
    sget-object v2, Landroid/prestigio/update/utils/RebootRecoveryUtils;->RECOVERY_DIR:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 55
    sget-object v2, Landroid/prestigio/update/utils/RebootRecoveryUtils;->COMMAND_FILE:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 56
    const-string v2, "FirmwareUpdate"

    const-string v3, "create command file"

    invoke-static {v2, v3}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    :try_start_0
    new-instance v0, Ljava/io/FileWriter;

    sget-object v2, Landroid/prestigio/update/utils/RebootRecoveryUtils;->COMMAND_FILE:Ljava/io/File;

    invoke-direct {v0, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 59
    .local v0, command:Ljava/io/FileWriter;
    invoke-virtual {v0, p0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 60
    invoke-virtual {v0}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .end local v0           #command:Ljava/io/FileWriter;
    :goto_0
    return-void

    .line 61
    :catch_0
    move-exception v1

    .line 62
    .local v1, e:Ljava/io/IOException;
    const-string v2, "FirmwareUpdate"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "process error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
