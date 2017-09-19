.class public Landroid/prestigio/update/utils/CustomHttpClient;
.super Ljava/lang/Object;
.source "CustomHttpClient.java"


# static fields
.field private static final CHARSET:Ljava/lang/String; = "UTF-8"

.field private static final TAG:Ljava/lang/String; = "CustomHttpClient"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createHTTClient()Lcz/msebera/android/httpclient/client/HttpClient;
    .locals 14

    .prologue
    .line 47
    const-string v10, "CustomHttpClient"

    const-string v11, "CreateHTTPClient start"

    invoke-static {v10, v11}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    new-instance v5, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v5}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 49
    .local v5, params:Lorg/apache/http/params/HttpParams;
    sget-object v10, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v5, v10}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 50
    const-string v10, "http.protocol.handle-redirects"

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v5, v10, v11}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 51
    const-string v10, "CustomHttpClient"

    const-string v11, "Charset is ISO-8859-1"

    invoke-static {v10, v11}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    const-string v10, "UTF-8"

    invoke-static {v5, v10}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 53
    const/4 v10, 0x1

    invoke-static {v5, v10}, Lorg/apache/http/params/HttpProtocolParams;->setUseExpectContinue(Lorg/apache/http/params/HttpParams;Z)V

    .line 54
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v6

    .line 55
    .local v6, prop:Ljava/util/Properties;
    const-string v8, "%s/%s (%s; U; Android %s; %s; %s Build/%s; FW %s)"

    .line 56
    .local v8, template_user_agent:Ljava/lang/String;
    const/16 v10, 0x8

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "java.vm.name"

    invoke-virtual {v6, v12}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const-string v12, "java.vm.version"

    .line 57
    invoke-virtual {v6, v12}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const-string v12, "os.name"

    invoke-virtual {v6, v12}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x3

    sget-object v12, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x4

    .line 58
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x5

    sget-object v12, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x6

    sget-object v12, Landroid/os/Build;->ID:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x7

    sget-object v12, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    aput-object v12, v10, v11

    .line 56
    invoke-static {v8, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 60
    .local v9, userAgent:Ljava/lang/String;
    invoke-static {v5, v9}, Lorg/apache/http/params/HttpProtocolParams;->setUserAgent(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 61
    const/16 v10, 0x64

    invoke-static {v5, v10}, Lorg/apache/http/conn/params/ConnManagerParams;->setMaxTotalConnections(Lorg/apache/http/params/HttpParams;I)V

    .line 62
    new-instance v2, Lorg/apache/http/conn/params/ConnPerRouteBean;

    const/16 v10, 0x14

    invoke-direct {v2, v10}, Lorg/apache/http/conn/params/ConnPerRouteBean;-><init>(I)V

    .line 63
    .local v2, connperroutebean:Lorg/apache/http/conn/params/ConnPerRouteBean;
    new-instance v10, Lorg/apache/http/conn/routing/HttpRoute;

    new-instance v11, Lorg/apache/http/HttpHost;

    const-string v12, "locahost"

    const/16 v13, 0x50

    invoke-direct {v11, v12, v13}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;I)V

    invoke-direct {v10, v11}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;)V

    const/16 v11, 0x32

    invoke-virtual {v2, v10, v11}, Lorg/apache/http/conn/params/ConnPerRouteBean;->setMaxForRoute(Lorg/apache/http/conn/routing/HttpRoute;I)V

    .line 64
    invoke-static {v5, v2}, Lorg/apache/http/conn/params/ConnManagerParams;->setMaxConnectionsPerRoute(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/params/ConnPerRoute;)V

    .line 65
    const-wide/16 v10, 0x3e8

    invoke-static {v5, v10, v11}, Lorg/apache/http/conn/params/ConnManagerParams;->setTimeout(Lorg/apache/http/params/HttpParams;J)V

    .line 66
    const/4 v10, 0x0

    invoke-static {v5, v10}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 67
    const v10, 0x9c40

    invoke-static {v5, v10}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 69
    new-instance v7, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v7}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 70
    .local v7, schReg:Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v10, Lorg/apache/http/conn/scheme/Scheme;

    const-string v11, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v12

    const/16 v13, 0x50

    invoke-direct {v10, v11, v12, v13}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v7, v10}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 71
    new-instance v10, Lorg/apache/http/conn/scheme/Scheme;

    const-string v11, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v12

    const/16 v13, 0x1bb

    invoke-direct {v10, v11, v12, v13}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v7, v10}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 72
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v5, v7}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 76
    .local v0, conMgr:Lorg/apache/http/conn/ClientConnectionManager;
    invoke-static {}, Lcz/msebera/android/httpclient/client/config/RequestConfig;->custom()Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;

    move-result-object v10

    const/16 v11, 0x4e20

    .line 77
    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;->setConnectTimeout(I)Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;

    move-result-object v10

    const/16 v11, 0x4e20

    .line 78
    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;->setConnectionRequestTimeout(I)Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;

    move-result-object v10

    const/16 v11, 0x4e20

    .line 79
    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;->setSocketTimeout(I)Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;

    move-result-object v10

    const/16 v11, 0x14

    .line 80
    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;->setMaxRedirects(I)Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;

    move-result-object v10

    .line 81
    invoke-virtual {v10}, Lcz/msebera/android/httpclient/client/config/RequestConfig$Builder;->build()Lcz/msebera/android/httpclient/client/config/RequestConfig;

    move-result-object v1

    .line 83
    .local v1, config:Lcz/msebera/android/httpclient/client/config/RequestConfig;
    new-instance v3, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;

    invoke-direct {v3}, Lcz/msebera/android/httpclient/impl/client/BasicCredentialsProvider;-><init>()V

    .line 85
    .local v3, credsProvider:Lcz/msebera/android/httpclient/client/CredentialsProvider;
    invoke-static {}, Lcz/msebera/android/httpclient/impl/client/HttpClients;->custom()Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    move-result-object v10

    new-instance v11, Lcz/msebera/android/httpclient/impl/NoConnectionReuseStrategy;

    invoke-direct {v11}, Lcz/msebera/android/httpclient/impl/NoConnectionReuseStrategy;-><init>()V

    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->setConnectionReuseStrategy(Lcz/msebera/android/httpclient/ConnectionReuseStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    move-result-object v10

    new-instance v11, Lcz/msebera/android/httpclient/impl/client/LaxRedirectStrategy;

    invoke-direct {v11}, Lcz/msebera/android/httpclient/impl/client/LaxRedirectStrategy;-><init>()V

    .line 86
    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->setRedirectStrategy(Lcz/msebera/android/httpclient/client/RedirectStrategy;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    move-result-object v10

    .line 87
    invoke-virtual {v10, v9}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->setUserAgent(Ljava/lang/String;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    move-result-object v10

    new-instance v11, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;

    invoke-direct {v11}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;-><init>()V

    .line 88
    invoke-virtual {v10, v11}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->setConnectionManager(Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    move-result-object v10

    .line 89
    invoke-virtual {v10, v1}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->setDefaultRequestConfig(Lcz/msebera/android/httpclient/client/config/RequestConfig;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    move-result-object v10

    .line 90
    invoke-virtual {v10, v3}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->setDefaultCredentialsProvider(Lcz/msebera/android/httpclient/client/CredentialsProvider;)Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;

    move-result-object v10

    .line 91
    invoke-virtual {v10}, Lcz/msebera/android/httpclient/impl/client/HttpClientBuilder;->build()Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;

    move-result-object v4

    .line 97
    .local v4, httpClient:Lcz/msebera/android/httpclient/impl/client/CloseableHttpClient;
    const-string v10, "CustomHttpClient"

    const-string v11, "CreateHTTPClient done"

    invoke-static {v10, v11}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    return-object v4
.end method
