.class public Lcz/msebera/android/httpclient/client/CircularRedirectException;
.super Lcz/msebera/android/httpclient/client/RedirectException;
.source "CircularRedirectException.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x5ec9428de010dedbL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcz/msebera/android/httpclient/client/RedirectException;-><init>()V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/client/RedirectException;-><init>(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "message"
    .parameter "cause"

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Lcz/msebera/android/httpclient/client/RedirectException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 67
    return-void
.end method
