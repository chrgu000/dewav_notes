.class public Landroid/prestigio/update/broadcastreceiver/MountUnmountBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MountUnmountBroadcastReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 12
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    if-ne v0, v1, :cond_1

    .line 13
    const/4 v0, 0x1

    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setSDCardMounted(Z)V

    .line 18
    :cond_0
    :goto_0
    return-void

    .line 14
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    if-ne v0, v1, :cond_0

    .line 15
    const/4 v0, 0x0

    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setSDCardMounted(Z)V

    goto :goto_0
.end method
