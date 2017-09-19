.class final enum Landroid/prestigio/update/asynctasks/CopyResult;
.super Ljava/lang/Enum;
.source "CopyFilesAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/prestigio/update/asynctasks/CopyResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/prestigio/update/asynctasks/CopyResult;

.field public static final enum ERROR:Landroid/prestigio/update/asynctasks/CopyResult;

.field public static final enum SUCCESS:Landroid/prestigio/update/asynctasks/CopyResult;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    new-instance v0, Landroid/prestigio/update/asynctasks/CopyResult;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Landroid/prestigio/update/asynctasks/CopyResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/CopyResult;->SUCCESS:Landroid/prestigio/update/asynctasks/CopyResult;

    .line 26
    new-instance v0, Landroid/prestigio/update/asynctasks/CopyResult;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v3}, Landroid/prestigio/update/asynctasks/CopyResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/CopyResult;->ERROR:Landroid/prestigio/update/asynctasks/CopyResult;

    .line 21
    const/4 v0, 0x2

    new-array v0, v0, [Landroid/prestigio/update/asynctasks/CopyResult;

    sget-object v1, Landroid/prestigio/update/asynctasks/CopyResult;->SUCCESS:Landroid/prestigio/update/asynctasks/CopyResult;

    aput-object v1, v0, v2

    sget-object v1, Landroid/prestigio/update/asynctasks/CopyResult;->ERROR:Landroid/prestigio/update/asynctasks/CopyResult;

    aput-object v1, v0, v3

    sput-object v0, Landroid/prestigio/update/asynctasks/CopyResult;->$VALUES:[Landroid/prestigio/update/asynctasks/CopyResult;

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
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/prestigio/update/asynctasks/CopyResult;
    .locals 1
    .parameter "name"

    .prologue
    .line 21
    const-class v0, Landroid/prestigio/update/asynctasks/CopyResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/prestigio/update/asynctasks/CopyResult;

    return-object v0
.end method

.method public static values()[Landroid/prestigio/update/asynctasks/CopyResult;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Landroid/prestigio/update/asynctasks/CopyResult;->$VALUES:[Landroid/prestigio/update/asynctasks/CopyResult;

    invoke-virtual {v0}, [Landroid/prestigio/update/asynctasks/CopyResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/prestigio/update/asynctasks/CopyResult;

    return-object v0
.end method
