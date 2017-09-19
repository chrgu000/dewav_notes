.class public abstract Lcz/msebera/android/httpclient/params/AbstractHttpParams;
.super Ljava/lang/Object;
.source "AbstractHttpParams.java"

# interfaces
.implements Lcz/msebera/android/httpclient/params/HttpParams;
.implements Lcz/msebera/android/httpclient/params/HttpParamsNames;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method


# virtual methods
.method public getBooleanParameter(Ljava/lang/String;Z)Z
    .locals 1
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 99
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 100
    .local v0, param:Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 103
    .end local v0           #param:Ljava/lang/Object;
    .end local p2
    :goto_0
    return p2

    .restart local v0       #param:Ljava/lang/Object;
    .restart local p2
    :cond_0
    check-cast v0, Ljava/lang/Boolean;

    .end local v0           #param:Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    goto :goto_0
.end method

.method public getDoubleParameter(Ljava/lang/String;D)D
    .locals 2
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 85
    .local v0, param:Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 88
    .end local v0           #param:Ljava/lang/Object;
    .end local p2
    :goto_0
    return-wide p2

    .restart local v0       #param:Ljava/lang/Object;
    .restart local p2
    :cond_0
    check-cast v0, Ljava/lang/Double;

    .end local v0           #param:Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    goto :goto_0
.end method

.method public getIntParameter(Ljava/lang/String;I)I
    .locals 1
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 69
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 70
    .local v0, param:Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 73
    .end local v0           #param:Ljava/lang/Object;
    .end local p2
    :goto_0
    return p2

    .restart local v0       #param:Ljava/lang/Object;
    .restart local p2
    :cond_0
    check-cast v0, Ljava/lang/Integer;

    .end local v0           #param:Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    goto :goto_0
.end method

.method public getLongParameter(Ljava/lang/String;J)J
    .locals 2
    .parameter "name"
    .parameter "defaultValue"

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 55
    .local v0, param:Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 58
    .end local v0           #param:Ljava/lang/Object;
    .end local p2
    :goto_0
    return-wide p2

    .restart local v0       #param:Ljava/lang/Object;
    .restart local p2
    :cond_0
    check-cast v0, Ljava/lang/Long;

    .end local v0           #param:Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    goto :goto_0
.end method

.method public getNames()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 132
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isParameterFalse(Ljava/lang/String;)Z
    .locals 2
    .parameter "name"

    .prologue
    const/4 v0, 0x0

    .line 119
    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public isParameterTrue(Ljava/lang/String;)Z
    .locals 1
    .parameter "name"

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public setBooleanParameter(Ljava/lang/String;Z)Lcz/msebera/android/httpclient/params/HttpParams;
    .locals 1
    .parameter "name"
    .parameter "value"

    .prologue
    .line 108
    if-eqz p2, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/params/HttpParams;

    .line 109
    return-object p0

    .line 108
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setDoubleParameter(Ljava/lang/String;D)Lcz/msebera/android/httpclient/params/HttpParams;
    .locals 2
    .parameter "name"
    .parameter "value"

    .prologue
    .line 93
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/params/HttpParams;

    .line 94
    return-object p0
.end method

.method public setIntParameter(Ljava/lang/String;I)Lcz/msebera/android/httpclient/params/HttpParams;
    .locals 1
    .parameter "name"
    .parameter "value"

    .prologue
    .line 78
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/params/HttpParams;

    .line 79
    return-object p0
.end method

.method public setLongParameter(Ljava/lang/String;J)Lcz/msebera/android/httpclient/params/HttpParams;
    .locals 2
    .parameter "name"
    .parameter "value"

    .prologue
    .line 63
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/params/HttpParams;

    .line 64
    return-object p0
.end method
