.class Landroid/prestigio/update/activity/SettingsActivity$11;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/SettingsActivity;->onCreateDialog(I)Landroid/app/Dialog;
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
    .line 340
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$11;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 342
    invoke-static {}, Landroid/prestigio/update/service/DownloadService;->stopDownloadService()Z

    .line 343
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity$11;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #calls: Landroid/prestigio/update/activity/SettingsActivity;->resetParams()V
    invoke-static {v0}, Landroid/prestigio/update/activity/SettingsActivity;->access$300(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 344
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity$11;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-virtual {v0}, Landroid/prestigio/update/activity/SettingsActivity;->finish()V

    .line 345
    return-void
.end method
