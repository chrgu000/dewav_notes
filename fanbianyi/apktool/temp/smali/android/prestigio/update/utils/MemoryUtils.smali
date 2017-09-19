.class public Landroid/prestigio/update/utils/MemoryUtils;
.super Ljava/lang/Object;
.source "MemoryUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MemoryUtils"

.field private static path:Ljava/lang/String;

.field private static statFs:Landroid/os/StatFs;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 48
    sput-object v0, Landroid/prestigio/update/utils/MemoryUtils;->statFs:Landroid/os/StatFs;

    .line 49
    sput-object v0, Landroid/prestigio/update/utils/MemoryUtils;->path:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatFileSize(J)Ljava/lang/String;
    .locals 8
    .parameter "sizeInBytes"

    .prologue
    const-wide/16 v6, 0x400

    .line 80
    cmp-long v1, p0, v6

    if-ltz v1, :cond_1

    .line 81
    div-long v2, p0, v6

    div-long/2addr v2, v6

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    div-long v2, p0, v6

    div-long/2addr v2, v6

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, strSize:Ljava/lang/String;
    :goto_0
    return-object v0

    .line 84
    .end local v0           #strSize:Ljava/lang/String;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    div-long v2, p0, v6

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " KB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0       #strSize:Ljava/lang/String;
    goto :goto_0

    .line 87
    .end local v0           #strSize:Ljava/lang/String;
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " B"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0       #strSize:Ljava/lang/String;
    goto :goto_0
.end method

.method public static formatFileSizeLong(J)Ljava/lang/String;
    .locals 2
    .parameter "sizeInBytes"

    .prologue
    .line 94
    invoke-static {p0, p1}, Landroid/prestigio/update/utils/MemoryUtils;->formatFileSize(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isMemorySizeAvailable(Ljava/lang/String;J)Z
    .locals 9
    .parameter "path"
    .parameter "download_bytes"

    .prologue
    .line 52
    const/4 v1, 0x0

    .line 53
    .local v1, isMemoryAvailable:Z
    const-wide/16 v2, 0x0

    .line 55
    .local v2, freeSpace:J
    :try_start_0
    sget-object v4, Landroid/prestigio/update/utils/MemoryUtils;->statFs:Landroid/os/StatFs;

    if-nez v4, :cond_0

    .line 56
    new-instance v4, Landroid/os/StatFs;

    invoke-direct {v4, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    sput-object v4, Landroid/prestigio/update/utils/MemoryUtils;->statFs:Landroid/os/StatFs;

    .line 57
    sput-object p0, Landroid/prestigio/update/utils/MemoryUtils;->path:Ljava/lang/String;

    .line 59
    :cond_0
    sget-object v4, Landroid/prestigio/update/utils/MemoryUtils;->path:Ljava/lang/String;

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 60
    new-instance v4, Landroid/os/StatFs;

    invoke-direct {v4, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    sput-object v4, Landroid/prestigio/update/utils/MemoryUtils;->statFs:Landroid/os/StatFs;

    .line 61
    sput-object p0, Landroid/prestigio/update/utils/MemoryUtils;->path:Ljava/lang/String;

    .line 64
    :cond_1
    sget-object v4, Landroid/prestigio/update/utils/MemoryUtils;->statFs:Landroid/os/StatFs;

    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Landroid/prestigio/update/utils/MemoryUtils;->statFs:Landroid/os/StatFs;

    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v6, v6

    mul-long v2, v4, v6

    .line 65
    const-string v4, "MemoryUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Available space on "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " == "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    cmp-long v4, v2, p1

    if-lez v4, :cond_2

    .line 67
    const/4 v1, 0x1

    .line 75
    :goto_0
    return v1

    .line 69
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 71
    :catch_0
    move-exception v0

    .line 72
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 73
    const/4 v1, 0x0

    goto :goto_0
.end method
