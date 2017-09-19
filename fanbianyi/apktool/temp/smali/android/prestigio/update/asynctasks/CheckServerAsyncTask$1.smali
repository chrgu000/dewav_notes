.class Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$1;
.super Ljava/lang/Object;
.source "CheckServerAsyncTask.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->onPreExecute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;


# direct methods
.method constructor <init>(Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;)V
    .locals 0
    .parameter "this$0"

    .prologue
    .line 42
    iput-object p1, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$1;->this$0:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 45
    const-string v0, "CheckServerAsyncTask"

    const-string v1, "mProgressDialog.onCancel"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$1;->this$0:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask$1;->this$0:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->cancel(Z)Z

    .line 49
    :cond_0
    return-void
.end method
