.class Landroid/prestigio/update/activity/SettingsActivity$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/SettingsActivity;->onCreate(Landroid/os/Bundle;)V
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
    .line 79
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$1;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 6
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 83
    invoke-static {p2}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setAutoCheck(Z)V

    .line 84
    if-eqz p2, :cond_0

    .line 85
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity$1;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    const-string v3, ""

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity$1;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    .line 86
    invoke-virtual {v4}, Landroid/prestigio/update/activity/SettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-class v5, Landroid/prestigio/update/service/CheckNewVersionService;

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 85
    invoke-virtual {v0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 91
    :goto_0
    return-void

    .line 88
    :cond_0
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity$1;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.ACTION_SHUTDOWN"

    const-string v3, ""

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v4, p0, Landroid/prestigio/update/activity/SettingsActivity$1;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    .line 89
    invoke-virtual {v4}, Landroid/prestigio/update/activity/SettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-class v5, Landroid/prestigio/update/service/CheckNewVersionService;

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 88
    invoke-virtual {v0, v1}, Landroid/prestigio/update/activity/SettingsActivity;->stopService(Landroid/content/Intent;)Z

    goto :goto_0
.end method
