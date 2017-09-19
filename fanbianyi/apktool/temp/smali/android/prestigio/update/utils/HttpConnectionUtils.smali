.class public Landroid/prestigio/update/utils/HttpConnectionUtils;
.super Ljava/lang/Object;
.source "HttpConnectionUtils.java"


# static fields
.field private static manager:Landroid/net/ConnectivityManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isFreeInternetConnected()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 32
    invoke-static {}, Landroid/prestigio/update/utils/HttpConnectionUtils;->isInternetConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 33
    sget-object v2, Landroid/prestigio/update/utils/HttpConnectionUtils;->manager:Landroid/net/ConnectivityManager;

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    .line 34
    .local v0, activeNetworkType:I
    if-nez v0, :cond_1

    .line 39
    :cond_0
    :goto_0
    return v1

    .line 37
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isInternetConnected()Z
    .locals 2

    .prologue
    .line 18
    sget-object v0, Landroid/prestigio/update/utils/HttpConnectionUtils;->manager:Landroid/net/ConnectivityManager;

    if-nez v0, :cond_0

    .line 19
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/prestigio/update/UpdateApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    sput-object v0, Landroid/prestigio/update/utils/HttpConnectionUtils;->manager:Landroid/net/ConnectivityManager;

    .line 22
    :cond_0
    sget-object v0, Landroid/prestigio/update/utils/HttpConnectionUtils;->manager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-nez v0, :cond_1

    .line 23
    const/4 v0, 0x0

    .line 25
    :goto_0
    return v0

    :cond_1
    sget-object v0, Landroid/prestigio/update/utils/HttpConnectionUtils;->manager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    goto :goto_0
.end method

.method public static readDataFromUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .parameter "url"

    .prologue
    .line 44
    if-eqz p0, :cond_2

    .line 46
    :try_start_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .local v7, strB:Ljava/lang/StringBuilder;
    invoke-static {}, Landroid/prestigio/update/utils/CustomHttpClient;->createHTTClient()Lcz/msebera/android/httpclient/client/HttpClient;

    move-result-object v4

    check-cast v4, Lorg/apache/http/client/HttpClient;

    .line 48
    .local v4, localHttpClient:Lorg/apache/http/client/HttpClient;
    new-instance v5, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v5, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 49
    .local v5, request:Lorg/apache/http/client/methods/HttpGet;
    invoke-interface {v4, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 50
    .local v6, response:Lorg/apache/http/HttpResponse;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    const/16 v9, 0xc8

    if-eq v8, v9, :cond_0

    .line 51
    const-string v8, ""

    .line 63
    .end local v4           #localHttpClient:Lorg/apache/http/client/HttpClient;
    .end local v5           #request:Lorg/apache/http/client/methods/HttpGet;
    .end local v6           #response:Lorg/apache/http/HttpResponse;
    .end local v7           #strB:Ljava/lang/StringBuilder;
    :goto_0
    return-object v8

    .line 52
    .restart local v4       #localHttpClient:Lorg/apache/http/client/HttpClient;
    .restart local v5       #request:Lorg/apache/http/client/methods/HttpGet;
    .restart local v6       #response:Lorg/apache/http/HttpResponse;
    .restart local v7       #strB:Ljava/lang/StringBuilder;
    :cond_0
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    .line 53
    .local v3, is:Ljava/io/InputStream;
    const/16 v8, 0x400

    new-array v0, v8, [B

    .line 54
    .local v0, bytes:[B
    const/4 v1, 0x0

    .line 55
    .local v1, count:I
    :goto_1
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v8, -0x1

    if-eq v1, v8, :cond_1

    .line 56
    new-instance v8, Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct {v8, v0, v9, v1}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 59
    .end local v0           #bytes:[B
    .end local v1           #count:I
    .end local v3           #is:Ljava/io/InputStream;
    .end local v4           #localHttpClient:Lorg/apache/http/client/HttpClient;
    .end local v5           #request:Lorg/apache/http/client/methods/HttpGet;
    .end local v6           #response:Lorg/apache/http/HttpResponse;
    .end local v7           #strB:Ljava/lang/StringBuilder;
    :catch_0
    move-exception v2

    .line 60
    .local v2, e:Ljava/lang/Exception;
    const-string v8, ""

    goto :goto_0

    .line 58
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v0       #bytes:[B
    .restart local v1       #count:I
    .restart local v3       #is:Ljava/io/InputStream;
    .restart local v4       #localHttpClient:Lorg/apache/http/client/HttpClient;
    .restart local v5       #request:Lorg/apache/http/client/methods/HttpGet;
    .restart local v6       #response:Lorg/apache/http/HttpResponse;
    .restart local v7       #strB:Ljava/lang/StringBuilder;
    :cond_1
    :try_start_1
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v8

    goto :goto_0

    .line 63
    .end local v0           #bytes:[B
    .end local v1           #count:I
    .end local v3           #is:Ljava/io/InputStream;
    .end local v4           #localHttpClient:Lorg/apache/http/client/HttpClient;
    .end local v5           #request:Lorg/apache/http/client/methods/HttpGet;
    .end local v6           #response:Lorg/apache/http/HttpResponse;
    .end local v7           #strB:Ljava/lang/StringBuilder;
    :cond_2
    const-string v8, ""

    goto :goto_0
.end method
