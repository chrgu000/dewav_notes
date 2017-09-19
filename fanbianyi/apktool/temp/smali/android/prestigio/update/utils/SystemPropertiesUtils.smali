.class public Landroid/prestigio/update/utils/SystemPropertiesUtils;
.super Ljava/lang/Object;
.source "SystemPropertiesUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkWriteFilePath(Ljava/io/File;)Z
    .locals 4
    .parameter "file"

    .prologue
    .line 127
    const/4 v0, 0x1

    .line 129
    .local v0, check:Z
    :try_start_0
    new-instance v2, Ljava/io/FileWriter;

    invoke-direct {v2, p0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 130
    .local v2, fw:Ljava/io/FileWriter;
    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/io/FileWriter;->write(I)V

    .line 131
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V

    .line 132
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v2           #fw:Ljava/io/FileWriter;
    :goto_0
    return v0

    .line 133
    :catch_0
    move-exception v1

    .line 134
    .local v1, e:Ljava/lang/Exception;
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getImei()Ljava/lang/String;
    .locals 3

    .prologue
    .line 53
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v1

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/prestigio/update/UpdateApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 55
    .local v0, tManager:Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getOtaProductName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 23
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v1

    const-string v2, "ro.product.model"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/SystemPropertiesProxy;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 24
    .local v0, str:Ljava/lang/String;
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 25
    const-string v1, " "

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 26
    :cond_0
    return-object v0
.end method

.method public static getPhoneSerialNumber()Ljava/lang/String;
    .locals 6

    .prologue
    .line 59
    sget-object v3, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 60
    .local v3, sn:Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "unknown"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 62
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileReader;

    const-string v4, "/sys/class/boardinfo/sn"

    invoke-direct {v1, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 63
    .local v1, localFileReader:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    const/16 v4, 0x100

    invoke-direct {v0, v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .local v0, localBufferedReader:Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 67
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 74
    .end local v0           #localBufferedReader:Ljava/io/BufferedReader;
    .end local v1           #localFileReader:Ljava/io/FileReader;
    :goto_0
    if-eqz v3, :cond_1

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 76
    :cond_1
    :try_start_3
    new-instance v1, Ljava/io/FileReader;

    const-string v4, "/mnt/private/id.txt"

    invoke-direct {v1, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 77
    .restart local v1       #localFileReader:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    const/16 v4, 0x100

    invoke-direct {v0, v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 79
    .restart local v0       #localBufferedReader:Ljava/io/BufferedReader;
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v3

    .line 81
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 87
    .end local v0           #localBufferedReader:Ljava/io/BufferedReader;
    .end local v1           #localFileReader:Ljava/io/FileReader;
    :cond_2
    :goto_1
    if-eqz v3, :cond_3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 88
    :cond_3
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    invoke-virtual {v4}, Landroid/prestigio/update/UpdateApplication;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "android_id"

    invoke-static {v4, v5}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 90
    :cond_4
    return-object v3

    .line 67
    .restart local v0       #localBufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #localFileReader:Ljava/io/FileReader;
    :catchall_0
    move-exception v4

    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    throw v4
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 69
    .end local v0           #localBufferedReader:Ljava/io/BufferedReader;
    .end local v1           #localFileReader:Ljava/io/FileReader;
    :catch_0
    move-exception v2

    .line 70
    .local v2, localIOException:Ljava/io/IOException;
    const/4 v3, 0x0

    .line 71
    goto :goto_0

    .line 73
    .end local v2           #localIOException:Ljava/io/IOException;
    :cond_5
    const/4 v3, 0x0

    goto :goto_0

    .line 81
    .restart local v0       #localBufferedReader:Ljava/io/BufferedReader;
    .restart local v1       #localFileReader:Ljava/io/FileReader;
    :catchall_1
    move-exception v4

    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    throw v4
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    .line 83
    .end local v0           #localBufferedReader:Ljava/io/BufferedReader;
    .end local v1           #localFileReader:Ljava/io/FileReader;
    :catch_1
    move-exception v2

    .line 84
    .restart local v2       #localIOException:Ljava/io/IOException;
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static getProductName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 30
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    const-string v1, "ro.product.model"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/SystemPropertiesProxy;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRemoteHost()Ljava/lang/String;
    .locals 3

    .prologue
    .line 34
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v1

    const-string v2, "ro.prestigio.ota.host"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/SystemPropertiesProxy;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, str:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 36
    :cond_0
    const-string v0, "yf.prestigio.com"

    .line 41
    :cond_1
    return-object v0
.end method

.method public static getSystemVersion()Ljava/lang/String;
    .locals 3

    .prologue
    .line 45
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v1

    const-string v2, "ro.product.version"

    invoke-static {v1, v2}, Landroid/prestigio/update/utils/SystemPropertiesProxy;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, str:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 47
    :cond_0
    const-string v0, "1.0.0"

    .line 49
    :cond_1
    return-object v0
.end method

.method public static isExternalStorageAvailable(Ljava/lang/String;)Z
    .locals 3
    .parameter "img_path"

    .prologue
    .line 102
    const/4 v1, 0x0

    .line 103
    .local v1, res:Z
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->isSDCardExists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 104
    new-instance v0, Ljava/io/File;

    const-string v2, "1.txt"

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .local v0, ch:Ljava/io/File;
    const-string v2, ""

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 106
    new-instance v0, Ljava/io/File;

    .end local v0           #ch:Ljava/io/File;
    const-string v2, "1.txt"

    invoke-direct {v0, p0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .restart local v0       #ch:Ljava/io/File;
    invoke-static {v0}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->checkWriteFilePath(Ljava/io/File;)Z

    move-result v1

    .line 120
    .end local v0           #ch:Ljava/io/File;
    :cond_0
    return v1
.end method

.method public static isExternalStorageAvailableOldWay()Z
    .locals 6

    .prologue
    .line 140
    const/4 v1, 0x0

    .line 141
    .local v1, check:Z
    new-instance v0, Ljava/io/File;

    const-string v4, "/mnt/extsd"

    const-string v5, "1.txt"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .local v0, ch:Ljava/io/File;
    if-nez v1, :cond_0

    .line 143
    new-instance v0, Ljava/io/File;

    .end local v0           #ch:Ljava/io/File;
    const-string v4, "/mnt/sdcard/external_sdcard"

    const-string v5, "1.txt"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .restart local v0       #ch:Ljava/io/File;
    invoke-static {v0}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->checkWriteFilePath(Ljava/io/File;)Z

    move-result v1

    .line 146
    :cond_0
    if-nez v1, :cond_1

    .line 147
    new-instance v0, Ljava/io/File;

    .end local v0           #ch:Ljava/io/File;
    const-string v4, "/mnt/external_sdcard"

    const-string v5, "1.txt"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .restart local v0       #ch:Ljava/io/File;
    invoke-static {v0}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->checkWriteFilePath(Ljava/io/File;)Z

    move-result v1

    .line 150
    :cond_1
    if-nez v1, :cond_2

    .line 151
    new-instance v0, Ljava/io/File;

    .end local v0           #ch:Ljava/io/File;
    const-string v4, "/storage/external_storage/sdcard1"

    const-string v5, "1.txt"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .restart local v0       #ch:Ljava/io/File;
    invoke-static {v0}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->checkWriteFilePath(Ljava/io/File;)Z

    move-result v1

    .line 154
    :cond_2
    if-nez v1, :cond_3

    .line 155
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getOtaProductName()Ljava/lang/String;

    move-result-object v2

    .line 156
    .local v2, model:Ljava/lang/String;
    const-string v3, "PAP3350DUO"

    .line 157
    .local v3, phCheck:Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->isSDCardExists()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 158
    const/4 v1, 0x1

    .line 161
    .end local v2           #model:Ljava/lang/String;
    .end local v3           #phCheck:Ljava/lang/String;
    :cond_3
    if-nez v1, :cond_4

    .line 162
    new-instance v0, Ljava/io/File;

    .end local v0           #ch:Ljava/io/File;
    const-string v4, "/storage/sdcard1"

    const-string v5, "1.txt"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .restart local v0       #ch:Ljava/io/File;
    invoke-static {v0}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->checkWriteFilePath(Ljava/io/File;)Z

    move-result v1

    .line 165
    :cond_4
    if-nez v1, :cond_5

    .line 166
    new-instance v0, Ljava/io/File;

    .end local v0           #ch:Ljava/io/File;
    const-string v4, "/mnt/sdcard2"

    const-string v5, "1.txt"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .restart local v0       #ch:Ljava/io/File;
    invoke-static {v0}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->checkWriteFilePath(Ljava/io/File;)Z

    move-result v1

    .line 169
    :cond_5
    return v1
.end method

.method public static isSDCardExists()Z
    .locals 2

    .prologue
    .line 94
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getCurrentFirmwareVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 19
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    const-string v1, "ro.firmware.version"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/SystemPropertiesProxy;->get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
