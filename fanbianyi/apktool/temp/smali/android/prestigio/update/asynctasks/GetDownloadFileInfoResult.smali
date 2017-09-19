.class final enum Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
.super Ljava/lang/Enum;
.source "DownloadFileAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

.field public static final enum DATA_CHANGED:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

.field public static final enum SUCCESS:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 60
    new-instance v0, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->SUCCESS:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    const-string v1, "DATA_CHANGED"

    invoke-direct {v0, v1, v3}, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->DATA_CHANGED:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    .line 59
    const/4 v0, 0x2

    new-array v0, v0, [Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    sget-object v1, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->SUCCESS:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    aput-object v1, v0, v2

    sget-object v1, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->DATA_CHANGED:Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    aput-object v1, v0, v3

    sput-object v0, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->$VALUES:[Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
    .locals 1
    .parameter "name"

    .prologue
    .line 59
    const-class v0, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    return-object v0
.end method

.method public static values()[Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->$VALUES:[Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    invoke-virtual {v0}, [Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/prestigio/update/asynctasks/GetDownloadFileInfoResult;

    return-object v0
.end method
