.class final enum Landroid/prestigio/update/asynctasks/CheckNewVersionResult;
.super Ljava/lang/Enum;
.source "CheckServerAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/prestigio/update/asynctasks/CheckNewVersionResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

.field public static final enum AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

.field public static final enum NOT_AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

.field public static final enum NO_INTERNET_CONNECTION:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 17
    new-instance v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    const-string v1, "AVAILABLE"

    invoke-direct {v0, v1, v2}, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    const-string v1, "NOT_AVAILABLE"

    invoke-direct {v0, v1, v3}, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->NOT_AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    new-instance v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    const-string v1, "NO_INTERNET_CONNECTION"

    invoke-direct {v0, v1, v4}, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->NO_INTERNET_CONNECTION:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    .line 16
    const/4 v0, 0x3

    new-array v0, v0, [Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    sget-object v1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    aput-object v1, v0, v2

    sget-object v1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->NOT_AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    aput-object v1, v0, v3

    sget-object v1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->NO_INTERNET_CONNECTION:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    aput-object v1, v0, v4

    sput-object v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->$VALUES:[Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

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
    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/prestigio/update/asynctasks/CheckNewVersionResult;
    .locals 1
    .parameter "name"

    .prologue
    .line 16
    const-class v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    return-object v0
.end method

.method public static values()[Landroid/prestigio/update/asynctasks/CheckNewVersionResult;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->$VALUES:[Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    invoke-virtual {v0}, [Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    return-object v0
.end method
