.class Landroid/prestigio/update/activity/SettingsActivity$3;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/SettingsActivity;->onResume()V
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
    .line 190
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$3;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    .line 195
    const-string v4, ""

    invoke-static {v4}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFileImgName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, img_name:Ljava/lang/String;
    const-string v4, ""

    invoke-static {v4}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getFilePathName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 197
    .local v1, img_path:Ljava/lang/String;
    const-string v4, ""

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, ""

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 198
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 199
    .local v3, update_file:Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 200
    .local v2, intent:Landroid/content/Intent;
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity$3;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    const-class v5, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 201
    const-string v4, "android.prestigio.update.extra.IMAGE_PATH"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 202
    const/high16 v4, 0x1000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 203
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity$3;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-virtual {v4}, Landroid/prestigio/update/activity/SettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 221
    .end local v2           #intent:Landroid/content/Intent;
    .end local v3           #update_file:Ljava/lang/String;
    :goto_0
    return-void

    .line 218
    :cond_0
    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity$3;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    new-instance v5, Landroid/content/Intent;

    const-string v6, "android.intent.action.MEDIA_MOUNTED"

    const-string v7, "file:///mnt/sdcard"

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v4, v5}, Landroid/prestigio/update/activity/SettingsActivity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0
.end method
