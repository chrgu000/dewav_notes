.class public Lcz/msebera/android/httpclient/impl/auth/BasicSchemeFactory;
.super Ljava/lang/Object;
.source "BasicSchemeFactory.java"

# interfaces
.implements Lcz/msebera/android/httpclient/auth/AuthSchemeFactory;
.implements Lcz/msebera/android/httpclient/auth/AuthSchemeProvider;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# instance fields
.field private final charset:Ljava/nio/charset/Charset;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/auth/BasicSchemeFactory;-><init>(Ljava/nio/charset/Charset;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .locals 0
    .parameter "charset"

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/auth/BasicSchemeFactory;->charset:Ljava/nio/charset/Charset;

    .line 57
    return-void
.end method


# virtual methods
.method public create(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/auth/AuthScheme;
    .locals 2
    .parameter "context"

    .prologue
    .line 70
    new-instance v0, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/auth/BasicSchemeFactory;->charset:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;-><init>(Ljava/nio/charset/Charset;)V

    return-object v0
.end method

.method public newInstance(Lcz/msebera/android/httpclient/params/HttpParams;)Lcz/msebera/android/httpclient/auth/AuthScheme;
    .locals 1
    .parameter "params"

    .prologue
    .line 65
    new-instance v0, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/auth/BasicScheme;-><init>()V

    return-object v0
.end method
