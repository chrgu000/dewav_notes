.class public Landroid/prestigio/update/activity/NewVersionInstalledActivity;
.super Landroid/app/Activity;
.source "NewVersionInstalledActivity.java"


# static fields
.field public static EXTRA_VERSION:Ljava/lang/String;


# instance fields
.field private mVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    const-string v0, "EXTRA_VERSION"

    sput-object v0, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->EXTRA_VERSION:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 13
    const-string v0, ""

    iput-object v0, p0, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->mVersion:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 17
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 18
    invoke-virtual {p0}, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 19
    .local v0, intent:Landroid/content/Intent;
    sget-object v1, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->EXTRA_VERSION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->mVersion:Ljava/lang/String;

    .line 20
    return-void
.end method

.method protected onResume()V
    .locals 6

    .prologue
    .line 24
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 25
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 26
    .local v0, alert:Landroid/app/AlertDialog$Builder;
    const/high16 v1, 0x7f04

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 27
    invoke-virtual {p0}, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f040023

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Landroid/prestigio/update/activity/NewVersionInstalledActivity;->mVersion:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f04000c

    new-instance v3, Landroid/prestigio/update/activity/NewVersionInstalledActivity$1;

    invoke-direct {v3, p0}, Landroid/prestigio/update/activity/NewVersionInstalledActivity$1;-><init>(Landroid/prestigio/update/activity/NewVersionInstalledActivity;)V

    .line 28
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 33
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 34
    return-void
.end method
