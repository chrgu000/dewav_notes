.class Landroid/prestigio/update/activity/SettingsActivity$7;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 289
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$7;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 293
    iget-object v0, p0, Landroid/prestigio/update/activity/SettingsActivity$7;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #calls: Landroid/prestigio/update/activity/SettingsActivity;->checkInternetAndExternalStorageBeforeDownload()V
    invoke-static {v0}, Landroid/prestigio/update/activity/SettingsActivity;->access$000(Landroid/prestigio/update/activity/SettingsActivity;)V

    .line 294
    return-void
.end method
