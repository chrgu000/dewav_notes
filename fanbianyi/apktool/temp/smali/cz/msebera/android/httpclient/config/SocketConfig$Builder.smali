.class public Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
.super Ljava/lang/Object;
.source "SocketConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcz/msebera/android/httpclient/config/SocketConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private backlogSize:I

.field private rcvBufSize:I

.field private sndBufSize:I

.field private soKeepAlive:Z

.field private soLinger:I

.field private soReuseAddress:Z

.field private soTimeout:I

.field private tcpNoDelay:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 233
    const/4 v0, -0x1

    iput v0, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soLinger:I

    .line 234
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->tcpNoDelay:Z

    .line 235
    return-void
.end method


# virtual methods
.method public build()Lcz/msebera/android/httpclient/config/SocketConfig;
    .locals 9

    .prologue
    .line 287
    new-instance v0, Lcz/msebera/android/httpclient/config/SocketConfig;

    iget v1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soTimeout:I

    iget-boolean v2, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soReuseAddress:Z

    iget v3, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soLinger:I

    iget-boolean v4, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soKeepAlive:Z

    iget-boolean v5, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->tcpNoDelay:Z

    iget v6, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->sndBufSize:I

    iget v7, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->rcvBufSize:I

    iget v8, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->backlogSize:I

    invoke-direct/range {v0 .. v8}, Lcz/msebera/android/httpclient/config/SocketConfig;-><init>(IZIZZIII)V

    return-object v0
.end method

.method public setBacklogSize(I)Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
    .locals 0
    .parameter "backlogSize"

    .prologue
    .line 282
    iput p1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->backlogSize:I

    .line 283
    return-object p0
.end method

.method public setRcvBufSize(I)Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
    .locals 0
    .parameter "rcvBufSize"

    .prologue
    .line 274
    iput p1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->rcvBufSize:I

    .line 275
    return-object p0
.end method

.method public setSndBufSize(I)Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
    .locals 0
    .parameter "sndBufSize"

    .prologue
    .line 266
    iput p1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->sndBufSize:I

    .line 267
    return-object p0
.end method

.method public setSoKeepAlive(Z)Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
    .locals 0
    .parameter "soKeepAlive"

    .prologue
    .line 253
    iput-boolean p1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soKeepAlive:Z

    .line 254
    return-object p0
.end method

.method public setSoLinger(I)Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
    .locals 0
    .parameter "soLinger"

    .prologue
    .line 248
    iput p1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soLinger:I

    .line 249
    return-object p0
.end method

.method public setSoReuseAddress(Z)Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
    .locals 0
    .parameter "soReuseAddress"

    .prologue
    .line 243
    iput-boolean p1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soReuseAddress:Z

    .line 244
    return-object p0
.end method

.method public setSoTimeout(I)Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
    .locals 0
    .parameter "soTimeout"

    .prologue
    .line 238
    iput p1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->soTimeout:I

    .line 239
    return-object p0
.end method

.method public setTcpNoDelay(Z)Lcz/msebera/android/httpclient/config/SocketConfig$Builder;
    .locals 0
    .parameter "tcpNoDelay"

    .prologue
    .line 258
    iput-boolean p1, p0, Lcz/msebera/android/httpclient/config/SocketConfig$Builder;->tcpNoDelay:Z

    .line 259
    return-object p0
.end method
