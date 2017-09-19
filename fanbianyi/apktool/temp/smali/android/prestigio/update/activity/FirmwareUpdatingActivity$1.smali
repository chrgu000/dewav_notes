.class Landroid/prestigio/update/activity/FirmwareUpdatingActivity$1;
.super Ljava/lang/Object;
.source "FirmwareUpdatingActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;


# direct methods
.method constructor <init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V
    .locals 0
    .parameter "this$0"

    .prologue
    .line 161
    iput-object p1, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$1;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 163
    iget-object v0, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$1;->this$0:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-virtual {v0}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->finish()V

    .line 164
    return-void
.end method
