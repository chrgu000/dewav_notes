.class public Landroid/prestigio/update/activity/FirmwareUpdatingActivity;
.super Landroid/app/Activity;
.source "FirmwareUpdatingActivity.java"

# interfaces
.implements Landroid/content/DialogInterface;
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 20
    const-string v0, "FirmwareUpdatingActivity"

    iput-object v0, p0, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    .prologue
    .line 51
    invoke-virtual {p0}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->finish()V

    .line 52
    return-void
.end method

.method public dismiss()V
    .locals 1

    .prologue
    .line 56
    invoke-virtual {p0}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 57
    invoke-virtual {p0}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity;->finish()V

    .line 59
    :cond_0
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 63
    const-string v0, "FirmwareUpdatingActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "clicked on button "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 178
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 179
    const-string v0, "FirmwareUpdatingActivity"

    const-string v1, "onDestroy() : Entered."

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 68
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 69
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 71
    .local v0, alert:Landroid/app/AlertDialog$Builder;
    const/high16 v1, 0x7f04

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootMsg()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f040009

    new-instance v3, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;

    invoke-direct {v3, p0}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$2;-><init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V

    .line 72
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f04000b

    new-instance v3, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$1;

    invoke-direct {v3, p0}, Landroid/prestigio/update/activity/FirmwareUpdatingActivity$1;-><init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V

    .line 161
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 173
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 174
    return-void
.end method
