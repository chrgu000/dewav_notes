.class public Landroid/prestigio/update/utils/HttpHeaderUtils;
.super Ljava/lang/Object;
.source "HttpHeaderUtils.java"


# static fields
.field public static final DEFAULT_IS_EXTERNAL:Z = true

.field public static final DEFAULT_OTA_CFG_IMAGE_FILE_NAME:Ljava/lang/String; = "update.zip"

.field public static final DEFAULT_OTA_CFG_IMAGE_FILE_PATH:Ljava/lang/String; = "/mnt/sdcard/"

.field public static final DEFAULT_PACKAGE_INFO:Ljava/lang/String; = ""

.field public static final DEFAULT_REBOOT_FILE_NAME:Ljava/lang/String; = "/sdcard/update.zip"

.field public static final DEFAULT_REBOOT_FILE_PATH:Ljava/lang/String; = "/storage/external_storage/sdcard1/"

.field public static final DEFAULT_REBOOT_FILE_PATH2:Ljava/lang/String; = "/sdcard2/"

.field public static final DEFAULT_REBOOT_MESSAGE:Ljava/lang/String; = ""

.field public static final DEFAULT_REBOOT_MODE:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode; = null

.field public static final DEFAULT_REBOOT_NOTE:Ljava/lang/String; = ""

.field public static final HTTP_HEADER_OTA_CFG_IMAGE_FILE_NAME:Ljava/lang/String; = "otaCfgImageFileName"

.field public static final HTTP_HEADER_OTA_CFG_IMAGE_FILE_PATH:Ljava/lang/String; = "otaCfgImageFilePath"

.field public static final HTTP_HEADER_OTA_CFG_IS_EXTERNAL:Ljava/lang/String; = "otaCfgIsExternal"

.field public static final HTTP_HEADER_OTA_CFG_REBOOT_FILE_NAME:Ljava/lang/String; = "otaCfgRebootFileName"

.field public static final HTTP_HEADER_OTA_CFG_REBOOT_FILE_PATH:Ljava/lang/String; = "otaCfgRebootFilePath"

.field public static final HTTP_HEADER_OTA_CFG_REBOOT_FILE_PATH2:Ljava/lang/String; = "otaCfgRebootFilePath2"

.field public static final HTTP_HEADER_OTA_CFG_REBOOT_MESSAGE:Ljava/lang/String; = "otaCfgRebootMessage"

.field public static final HTTP_HEADER_OTA_CFG_REBOOT_MODE:Ljava/lang/String; = "otaCfgRebootMode"

.field public static final HTTP_HEADER_OTA_CFG_REBOOT_NOTE:Ljava/lang/String; = "otaCfgRebootNote"

.field public static final HTTP_HEADER_OTA_PACKAGE_INFO:Ljava/lang/String; = "OtaPackageInfo"

.field public static final HTTP_HEADER_OTA_PACKAGE_LENGTH:Ljava/lang/String; = "OtaPackageLength"

.field public static final HTTP_HEADER_OTA_PACKAGE_NAME:Ljava/lang/String; = "OtaPackageName"

.field public static final HTTP_HEADER_OTA_PACKAGE_URI:Ljava/lang/String; = "OtaPackageUri"

.field public static final HTTP_HEADER_OTA_PACKAGE_VERSION:Ljava/lang/String; = "OtaPackageVersion"

.field public static final REQUEST_HEADER_ACCEPT_LANGUAGE:Lorg/apache/http/Header;

.field public static final REQUEST_HEADER_CLIENT_LANGUAGE:Lorg/apache/http/Header;

.field public static final REQUEST_HEADER_X_ATT_DEVICEID:Lorg/apache/http/Header;

.field public static final REQUEST_HEADER_X_DEVICEID:Lorg/apache/http/Header;

.field public static final REQUEST_HEADER_X_DEVICEID2:Lorg/apache/http/Header;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 22
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "accept-language"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    .line 23
    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_ACCEPT_LANGUAGE:Lorg/apache/http/Header;

    .line 27
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "client-language"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_CLIENT_LANGUAGE:Lorg/apache/http/Header;

    .line 32
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "x-deviceid"

    .line 33
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getPhoneSerialNumber()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_X_DEVICEID:Lorg/apache/http/Header;

    .line 37
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "x-deviceid2"

    .line 38
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getImei()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_X_DEVICEID2:Lorg/apache/http/Header;

    .line 43
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "x-att-deviceid"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/utils/HttpHeaderUtils;->REQUEST_HEADER_X_ATT_DEVICEID:Lorg/apache/http/Header;

    .line 86
    sget-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_5:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    sput-object v0, Landroid/prestigio/update/utils/HttpHeaderUtils;->DEFAULT_REBOOT_MODE:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getBooleanValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Z)Z
    .locals 3
    .parameter "httpResponse"
    .parameter "header"
    .parameter "defaultValue"

    .prologue
    .line 202
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, strValue:Ljava/lang/String;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 204
    const/4 p2, 0x1

    .line 208
    .end local p2
    :cond_0
    :goto_0
    return p2

    .line 205
    .restart local p2
    :cond_1
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 206
    const/4 p2, 0x0

    goto :goto_0
.end method

.method public static getDetailInfo(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 115
    const-string v0, "OtaPackageInfo"

    const-string v1, ""

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/prestigio/update/utils/HttpConnectionUtils;->readDataFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getImageFileName(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 120
    const-string v0, "otaCfgImageFileName"

    const-string v1, "update.zip"

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getImageFilePath(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 125
    const-string v0, "otaCfgImageFilePath"

    const-string v1, "/mnt/sdcard/"

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getLongValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;)J
    .locals 5
    .parameter "httpResponse"
    .parameter "header"

    .prologue
    .line 190
    const-string v4, "0"

    invoke-static {p0, p1, v4}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, strValue:Ljava/lang/String;
    const-wide/16 v2, 0x0

    .line 193
    .local v2, result:J
    :try_start_0
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 198
    :goto_0
    return-wide v2

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, numberFormatException:Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 196
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public static getOtaPackageName(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 103
    const-string v0, "OtaPackageName"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPackageLength(Lorg/apache/http/HttpResponse;)J
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 99
    const-string v0, "OtaPackageLength"

    invoke-static {p0, v0}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getLongValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getPackageVersion(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 107
    const-string v0, "OtaPackageVersion"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootFileName(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 139
    const-string v0, "otaCfgRebootFileName"

    const-string v1, "/sdcard/update.zip"

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootFilePath(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 143
    const-string v0, "otaCfgRebootFilePath"

    const-string v1, "/storage/external_storage/sdcard1/"

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootFilePath2(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 147
    const-string v0, "otaCfgRebootFilePath2"

    const-string v1, "/sdcard2/"

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootMessage(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 156
    const-string v0, "otaCfgRebootMessage"

    const-string v1, ""

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootMode(Lorg/apache/http/HttpResponse;)Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 134
    const-string v0, "otaCfgRebootMode"

    sget-object v1, Landroid/prestigio/update/utils/HttpHeaderUtils;->DEFAULT_REBOOT_MODE:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    .line 135
    invoke-virtual {v1}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->getHttpValue()Ljava/lang/String;

    move-result-object v1

    .line 134
    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->getRebootModeByHttpValue(Ljava/lang/String;)Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    move-result-object v0

    return-object v0
.end method

.method public static getRebootNote(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 152
    const-string v0, "otaCfgRebootNote"

    const-string v1, ""

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getRequestHeaderRange(JJ)Lorg/apache/http/Header;
    .locals 4
    .parameter "startReadFrom"
    .parameter "contentLength"

    .prologue
    .line 54
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    const-string v1, "Range"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bytes="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 55
    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "httpResponse"
    .parameter "header"
    .parameter "defaultValue"

    .prologue
    .line 177
    invoke-interface {p0, p1}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    .line 178
    .local v0, arrayOfHeader:[Lorg/apache/http/Header;
    array-length v3, v0

    if-lez v3, :cond_0

    .line 179
    const/4 v3, 0x0

    aget-object v3, v0, v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 181
    .local v2, encodedResult:Ljava/lang/String;
    :try_start_0
    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 186
    .end local v2           #encodedResult:Ljava/lang/String;
    :goto_0
    return-object v2

    .line 182
    .restart local v2       #encodedResult:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 183
    .local v1, e:Ljava/io/UnsupportedEncodingException;
    goto :goto_0

    .end local v1           #e:Ljava/io/UnsupportedEncodingException;
    .end local v2           #encodedResult:Ljava/lang/String;
    :cond_0
    move-object v2, p2

    .line 186
    goto :goto_0
.end method

.method public static getTargetURI(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 111
    const-string v0, "OtaPackageUri"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getStringValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isExternal(Lorg/apache/http/HttpResponse;)Z
    .locals 2
    .parameter "httpResponse"

    .prologue
    .line 130
    const-string v0, "otaCfgIsExternal"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/prestigio/update/utils/HttpHeaderUtils;->getBooleanValueByHttpHeader(Lorg/apache/http/HttpResponse;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static printHeadersToLog(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V
    .locals 8
    .parameter "TAG"
    .parameter "httpResponse"

    .prologue
    .line 160
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    .line 161
    .local v0, arrayOfHeader:[Lorg/apache/http/Header;
    array-length v1, v0

    .line 162
    .local v1, j:I
    const/4 v2, 0x0

    .line 163
    .local v2, k:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 164
    aget-object v3, v0, v2

    .line 165
    .local v3, localHeader:Lorg/apache/http/Header;
    invoke-interface {v3}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v4

    .line 166
    .local v4, str1:Ljava/lang/String;
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 167
    .local v5, str2:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v6}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    add-int/lit8 v2, v2, 0x1

    .line 169
    goto :goto_0

    .line 170
    .end local v3           #localHeader:Lorg/apache/http/Header;
    .end local v4           #str1:Ljava/lang/String;
    .end local v5           #str2:Ljava/lang/String;
    :cond_0
    return-void
.end method
