.class final Lcz/msebera/android/httpclient/conn/params/ConnManagerParams$1;
.super Ljava/lang/Object;
.source "ConnManagerParams.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/params/ConnPerRoute;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcz/msebera/android/httpclient/conn/params/ConnManagerParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMaxForRoute(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;)I
    .locals 1
    .parameter "route"

    .prologue
    .line 87
    const/4 v0, 0x2

    return v0
.end method
