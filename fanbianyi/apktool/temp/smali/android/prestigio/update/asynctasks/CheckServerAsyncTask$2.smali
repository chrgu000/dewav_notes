.class synthetic Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$2;
.super Ljava/lang/Object;
.source "CheckServerAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$android$prestigio$update$asynctasks$CheckNewVersionResult:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 101
    invoke-static {}, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->values()[Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$2;->$SwitchMap$android$prestigio$update$asynctasks$CheckNewVersionResult:[I

    :try_start_0
    sget-object v0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$2;->$SwitchMap$android$prestigio$update$asynctasks$CheckNewVersionResult:[I

    sget-object v1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->NO_INTERNET_CONNECTION:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    invoke-virtual {v1}, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$2;->$SwitchMap$android$prestigio$update$asynctasks$CheckNewVersionResult:[I

    sget-object v1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->NOT_AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    invoke-virtual {v1}, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$2;->$SwitchMap$android$prestigio$update$asynctasks$CheckNewVersionResult:[I

    sget-object v1, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->AVAILABLE:Landroid/prestigio/update/asynctasks/CheckNewVersionResult;

    invoke-virtual {v1}, Landroid/prestigio/update/asynctasks/CheckNewVersionResult;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method
