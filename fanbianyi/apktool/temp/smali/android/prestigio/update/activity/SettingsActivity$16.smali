.class Landroid/prestigio/update/activity/SettingsActivity$16;
.super Landroid/os/Handler;
.source "SettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/SettingsActivity;->initHandler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/prestigio/update/activity/SettingsActivity;


# direct methods
.method constructor <init>(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 0
    .parameter "this$0"

    .prologue
    .line 488
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "message"

    .prologue
    .line 492
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 494
    .local v0, progress:I
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$16;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    new-instance v2, Landroid/prestigio/update/activity/SettingsActivity$16$1;

    invoke-direct {v2, p0, p1, v0}, Landroid/prestigio/update/activity/SettingsActivity$16$1;-><init>(Landroid/prestigio/update/activity/SettingsActivity$16;Landroid/os/Message;I)V

    invoke-virtual {v1, v2}, Landroid/prestigio/update/activity/SettingsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 554
    return-void
.end method
