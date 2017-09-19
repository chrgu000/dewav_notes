.class Landroid/prestigio/update/activity/NewVersionInstalledActivity$1;
.super Ljava/lang/Object;
.source "NewVersionInstalledActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/NewVersionInstalledActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/prestigio/update/activity/NewVersionInstalledActivity;


# direct methods
.method constructor <init>(Landroid/prestigio/update/activity/NewVersionInstalledActivity;)V
    .locals 0
    .parameter "this$0"

    .prologue
    .line 28
    iput-object p1, p0, Landroid/prestigio/update/activity/NewVersionInstalledActivity$1;->this$0:Landroid/prestigio/update/activity/NewVersionInstalledActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 30
    iget-object v0, p0, Landroid/prestigio/update/activity/NewVersionInstalledActivity$1;->this$0:Landroid/prestigio/update/activity/NewVersionInstalledActivity;

    invoke-virtual {v0}, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->finish()V

    .line 31
    return-void
.end method
