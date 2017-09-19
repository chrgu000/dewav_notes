.class public Landroid/prestigio/update/UpdateApplication;
.super Landroid/app/Application;
.source "UpdateApplication.java"


# static fields
.field private static mUpdateApplication:Landroid/prestigio/update/UpdateApplication;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getInstance()Landroid/prestigio/update/UpdateApplication;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Landroid/prestigio/update/UpdateApplication;->mUpdateApplication:Landroid/prestigio/update/UpdateApplication;

    return-object v0
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .prologue
    .line 10
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 11
    sput-object p0, Landroid/prestigio/update/UpdateApplication;->mUpdateApplication:Landroid/prestigio/update/UpdateApplication;

    .line 12
    return-void
.end method
