.class Lcz/msebera/android/httpclient/conn/scheme/LayeredSocketFactoryAdaptor;
.super Lcz/msebera/android/httpclient/conn/scheme/SocketFactoryAdaptor;
.source "LayeredSocketFactoryAdaptor.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/scheme/LayeredSocketFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final factory:Lcz/msebera/android/httpclient/conn/scheme/LayeredSchemeSocketFactory;


# direct methods
.method constructor <init>(Lcz/msebera/android/httpclient/conn/scheme/LayeredSchemeSocketFactory;)V
    .locals 0
    .parameter "factory"

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/conn/scheme/SocketFactoryAdaptor;-><init>(Lcz/msebera/android/httpclient/conn/scheme/SchemeSocketFactory;)V

    .line 44
    iput-object p1, p0, Lcz/msebera/android/httpclient/conn/scheme/LayeredSocketFactoryAdaptor;->factory:Lcz/msebera/android/httpclient/conn/scheme/LayeredSchemeSocketFactory;

    .line 45
    return-void
.end method


# virtual methods
.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .locals 1
    .parameter "socket"
    .parameter "host"
    .parameter "port"
    .parameter "autoClose"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lcz/msebera/android/httpclient/conn/scheme/LayeredSocketFactoryAdaptor;->factory:Lcz/msebera/android/httpclient/conn/scheme/LayeredSchemeSocketFactory;

    invoke-interface {v0, p1, p2, p3, p4}, Lcz/msebera/android/httpclient/conn/scheme/LayeredSchemeSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method
