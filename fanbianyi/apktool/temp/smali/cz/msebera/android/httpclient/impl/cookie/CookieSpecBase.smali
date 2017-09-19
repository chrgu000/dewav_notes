.class public abstract Lcz/msebera/android/httpclient/impl/cookie/CookieSpecBase;
.super Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieSpec;
.source "CookieSpecBase.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieSpec;-><init>()V

    .line 55
    return-void
.end method

.method protected constructor <init>(Ljava/util/HashMap;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p1, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;>;"
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieSpec;-><init>(Ljava/util/HashMap;)V

    .line 62
    return-void
.end method

.method protected varargs constructor <init>([Lcz/msebera/android/httpclient/cookie/CommonCookieAttributeHandler;)V
    .locals 0
    .parameter "handlers"

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/cookie/AbstractCookieSpec;-><init>([Lcz/msebera/android/httpclient/cookie/CommonCookieAttributeHandler;)V

    .line 69
    return-void
.end method

.method protected static getDefaultDomain(Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Ljava/lang/String;
    .locals 1
    .parameter "origin"

    .prologue
    .line 85
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/cookie/CookieOrigin;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static getDefaultPath(Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Ljava/lang/String;
    .locals 3
    .parameter "origin"

    .prologue
    .line 72
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/cookie/CookieOrigin;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, defaultPath:Ljava/lang/String;
    const/16 v2, 0x2f

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 74
    .local v1, lastSlashIndex:I
    if-ltz v1, :cond_1

    .line 75
    if-nez v1, :cond_0

    .line 77
    const/4 v1, 0x1

    .line 79
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 81
    :cond_1
    return-object v0
.end method


# virtual methods
.method public match(Lcz/msebera/android/httpclient/cookie/Cookie;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Z
    .locals 3
    .parameter "cookie"
    .parameter "origin"

    .prologue
    .line 132
    const-string v1, "Cookie"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 133
    const-string v1, "Cookie origin"

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 134
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/cookie/CookieSpecBase;->getAttribHandlers()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;

    .line 135
    .local v0, handler:Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;
    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;->match(Lcz/msebera/android/httpclient/cookie/Cookie;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 136
    const/4 v1, 0x0

    .line 139
    .end local v0           #handler:Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected parse([Lcz/msebera/android/httpclient/HeaderElement;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Ljava/util/List;
    .locals 14
    .parameter "elems"
    .parameter "origin"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcz/msebera/android/httpclient/HeaderElement;",
            "Lcz/msebera/android/httpclient/cookie/CookieOrigin;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcz/msebera/android/httpclient/cookie/Cookie;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 90
    new-instance v3, Ljava/util/ArrayList;

    array-length v10, p1

    invoke-direct {v3, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 91
    .local v3, cookies:Ljava/util/List;,"Ljava/util/List<Lcz/msebera/android/httpclient/cookie/Cookie;>;"
    array-length v11, p1

    const/4 v10, 0x0

    :goto_0
    if-ge v10, v11, :cond_4

    aget-object v5, p1, v10

    .line 92
    .local v5, headerelement:Lcz/msebera/android/httpclient/HeaderElement;
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v7

    .line 93
    .local v7, name:Ljava/lang/String;
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v9

    .line 94
    .local v9, value:Ljava/lang/String;
    if-eqz v7, :cond_0

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 95
    :cond_0
    new-instance v10, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;

    const-string v11, "Cookie name may not be empty"

    invoke-direct {v10, v11}, Lcz/msebera/android/httpclient/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 98
    :cond_1
    new-instance v2, Lcz/msebera/android/httpclient/impl/cookie/BasicClientCookie;

    invoke-direct {v2, v7, v9}, Lcz/msebera/android/httpclient/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .local v2, cookie:Lcz/msebera/android/httpclient/impl/cookie/BasicClientCookie;
    invoke-static/range {p2 .. p2}, Lcz/msebera/android/httpclient/impl/cookie/CookieSpecBase;->getDefaultPath(Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Lcz/msebera/android/httpclient/impl/cookie/BasicClientCookie;->setPath(Ljava/lang/String;)V

    .line 100
    invoke-static/range {p2 .. p2}, Lcz/msebera/android/httpclient/impl/cookie/CookieSpecBase;->getDefaultDomain(Lcz/msebera/android/httpclient/cookie/CookieOrigin;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Lcz/msebera/android/httpclient/impl/cookie/BasicClientCookie;->setDomain(Ljava/lang/String;)V

    .line 103
    invoke-interface {v5}, Lcz/msebera/android/httpclient/HeaderElement;->getParameters()[Lcz/msebera/android/httpclient/NameValuePair;

    move-result-object v1

    .line 104
    .local v1, attribs:[Lcz/msebera/android/httpclient/NameValuePair;
    array-length v12, v1

    add-int/lit8 v6, v12, -0x1

    .local v6, j:I
    :goto_1
    if-ltz v6, :cond_3

    .line 105
    aget-object v0, v1, v6

    .line 106
    .local v0, attrib:Lcz/msebera/android/httpclient/NameValuePair;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    .line 108
    .local v8, s:Ljava/lang/String;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v8, v12}, Lcz/msebera/android/httpclient/impl/cookie/BasicClientCookie;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    invoke-virtual {p0, v8}, Lcz/msebera/android/httpclient/impl/cookie/CookieSpecBase;->findAttribHandler(Ljava/lang/String;)Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;

    move-result-object v4

    .line 111
    .local v4, handler:Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;
    if-eqz v4, :cond_2

    .line 112
    invoke-interface {v0}, Lcz/msebera/android/httpclient/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v4, v2, v12}, Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;->parse(Lcz/msebera/android/httpclient/cookie/SetCookie;Ljava/lang/String;)V

    .line 104
    :cond_2
    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    .line 115
    .end local v0           #attrib:Lcz/msebera/android/httpclient/NameValuePair;
    .end local v4           #handler:Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;
    .end local v8           #s:Ljava/lang/String;
    :cond_3
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 117
    .end local v1           #attribs:[Lcz/msebera/android/httpclient/NameValuePair;
    .end local v2           #cookie:Lcz/msebera/android/httpclient/impl/cookie/BasicClientCookie;
    .end local v5           #headerelement:Lcz/msebera/android/httpclient/HeaderElement;
    .end local v6           #j:I
    .end local v7           #name:Ljava/lang/String;
    .end local v9           #value:Ljava/lang/String;
    :cond_4
    return-object v3
.end method

.method public validate(Lcz/msebera/android/httpclient/cookie/Cookie;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)V
    .locals 3
    .parameter "cookie"
    .parameter "origin"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 123
    const-string v1, "Cookie"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 124
    const-string v1, "Cookie origin"

    invoke-static {p2, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 125
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/cookie/CookieSpecBase;->getAttribHandlers()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;

    .line 126
    .local v0, handler:Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;
    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;->validate(Lcz/msebera/android/httpclient/cookie/Cookie;Lcz/msebera/android/httpclient/cookie/CookieOrigin;)V

    goto :goto_0

    .line 128
    .end local v0           #handler:Lcz/msebera/android/httpclient/cookie/CookieAttributeHandler;
    :cond_0
    return-void
.end method
