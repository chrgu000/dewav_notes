.class final enum Landroid/prestigio/update/asynctasks/DownloadResult;
.super Ljava/lang/Enum;
.source "DownloadFileAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/prestigio/update/asynctasks/DownloadResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/prestigio/update/asynctasks/DownloadResult;

.field public static final enum CANCELLED:Landroid/prestigio/update/asynctasks/DownloadResult;

.field public static final enum ERROR_DATA_CHANGED:Landroid/prestigio/update/asynctasks/DownloadResult;

.field public static final enum ERROR_FREE_SPACE:Landroid/prestigio/update/asynctasks/DownloadResult;

.field public static final enum ERROR_SAVING_DATA:Landroid/prestigio/update/asynctasks/DownloadResult;

.field public static final enum ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;

.field public static final enum PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;

.field public static final enum SUCCESS:Landroid/prestigio/update/asynctasks/DownloadResult;


# instance fields
.field private checkSum:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 45
    new-instance v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v3}, Landroid/prestigio/update/asynctasks/DownloadResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->SUCCESS:Landroid/prestigio/update/asynctasks/DownloadResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    const-string v1, "PAUSE"

    invoke-direct {v0, v1, v4}, Landroid/prestigio/update/asynctasks/DownloadResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    const-string v1, "CANCELLED"

    invoke-direct {v0, v1, v5}, Landroid/prestigio/update/asynctasks/DownloadResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->CANCELLED:Landroid/prestigio/update/asynctasks/DownloadResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    const-string v1, "ERROR_SERVER_TIMEOUT"

    invoke-direct {v0, v1, v6}, Landroid/prestigio/update/asynctasks/DownloadResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    const-string v1, "ERROR_DATA_CHANGED"

    invoke-direct {v0, v1, v7}, Landroid/prestigio/update/asynctasks/DownloadResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_DATA_CHANGED:Landroid/prestigio/update/asynctasks/DownloadResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    const-string v1, "ERROR_SAVING_DATA"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Landroid/prestigio/update/asynctasks/DownloadResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SAVING_DATA:Landroid/prestigio/update/asynctasks/DownloadResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    const-string v1, "ERROR_FREE_SPACE"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Landroid/prestigio/update/asynctasks/DownloadResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_FREE_SPACE:Landroid/prestigio/update/asynctasks/DownloadResult;

    .line 44
    const/4 v0, 0x7

    new-array v0, v0, [Landroid/prestigio/update/asynctasks/DownloadResult;

    sget-object v1, Landroid/prestigio/update/asynctasks/DownloadResult;->SUCCESS:Landroid/prestigio/update/asynctasks/DownloadResult;

    aput-object v1, v0, v3

    sget-object v1, Landroid/prestigio/update/asynctasks/DownloadResult;->PAUSE:Landroid/prestigio/update/asynctasks/DownloadResult;

    aput-object v1, v0, v4

    sget-object v1, Landroid/prestigio/update/asynctasks/DownloadResult;->CANCELLED:Landroid/prestigio/update/asynctasks/DownloadResult;

    aput-object v1, v0, v5

    sget-object v1, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SERVER_TIMEOUT:Landroid/prestigio/update/asynctasks/DownloadResult;

    aput-object v1, v0, v6

    sget-object v1, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_DATA_CHANGED:Landroid/prestigio/update/asynctasks/DownloadResult;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_SAVING_DATA:Landroid/prestigio/update/asynctasks/DownloadResult;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Landroid/prestigio/update/asynctasks/DownloadResult;->ERROR_FREE_SPACE:Landroid/prestigio/update/asynctasks/DownloadResult;

    aput-object v2, v0, v1

    sput-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->$VALUES:[Landroid/prestigio/update/asynctasks/DownloadResult;

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
    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/prestigio/update/asynctasks/DownloadResult;
    .locals 1
    .parameter "name"

    .prologue
    .line 44
    const-class v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/prestigio/update/asynctasks/DownloadResult;

    return-object v0
.end method

.method public static values()[Landroid/prestigio/update/asynctasks/DownloadResult;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Landroid/prestigio/update/asynctasks/DownloadResult;->$VALUES:[Landroid/prestigio/update/asynctasks/DownloadResult;

    invoke-virtual {v0}, [Landroid/prestigio/update/asynctasks/DownloadResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/prestigio/update/asynctasks/DownloadResult;

    return-object v0
.end method


# virtual methods
.method public getCheckSum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/DownloadResult;->checkSum:Ljava/lang/String;

    return-object v0
.end method

.method public setCheckSum(Ljava/lang/String;)V
    .locals 0
    .parameter "checkSum"

    .prologue
    .line 54
    iput-object p1, p0, Landroid/prestigio/update/asynctasks/DownloadResult;->checkSum:Ljava/lang/String;

    .line 55
    return-void
.end method
