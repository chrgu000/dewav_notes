.class public Landroid/prestigio/update/utils/SystemPropertiesProxy;
.super Ljava/lang/Object;
.source "SystemPropertiesProxy.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .parameter "context"
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 23
    const-string v7, ""

    .line 25
    .local v7, ret:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 27
    .local v1, cl:Ljava/lang/ClassLoader;
    const-string v8, "android.os.SystemProperties"

    invoke-virtual {v1, v8}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 30
    .local v0, SystemProperties:Ljava/lang/Class;
    const/4 v8, 0x1

    new-array v5, v8, [Ljava/lang/Class;

    .line 31
    .local v5, paramTypes:[Ljava/lang/Class;
    const/4 v8, 0x0

    const-class v9, Ljava/lang/String;

    aput-object v9, v5, v8

    .line 32
    const-string v8, "get"

    invoke-virtual {v0, v8, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 34
    .local v3, get:Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    new-array v6, v8, [Ljava/lang/Object;

    .line 35
    .local v6, params:[Ljava/lang/Object;
    const/4 v8, 0x0

    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    aput-object v9, v6, v8

    .line 36
    invoke-virtual {v3, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .end local v7           #ret:Ljava/lang/String;
    check-cast v7, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 43
    .end local v0           #SystemProperties:Ljava/lang/Class;
    .end local v1           #cl:Ljava/lang/ClassLoader;
    .end local v3           #get:Ljava/lang/reflect/Method;
    .end local v5           #paramTypes:[Ljava/lang/Class;
    .end local v6           #params:[Ljava/lang/Object;
    .restart local v7       #ret:Ljava/lang/String;
    :goto_0
    return-object v7

    .line 37
    .end local v7           #ret:Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 38
    .local v4, iAE:Ljava/lang/IllegalArgumentException;
    throw v4

    .line 39
    .end local v4           #iAE:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v2

    .line 40
    .local v2, e:Ljava/lang/Exception;
    const-string v7, ""

    .restart local v7       #ret:Ljava/lang/String;
    goto :goto_0
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .parameter "context"
    .parameter "key"
    .parameter "def"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 55
    move-object v7, p2

    .line 57
    .local v7, ret:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 59
    .local v1, cl:Ljava/lang/ClassLoader;
    const-string v8, "android.os.SystemProperties"

    invoke-virtual {v1, v8}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 62
    .local v0, SystemProperties:Ljava/lang/Class;
    const/4 v8, 0x2

    new-array v5, v8, [Ljava/lang/Class;

    .line 63
    .local v5, paramTypes:[Ljava/lang/Class;
    const/4 v8, 0x0

    const-class v9, Ljava/lang/String;

    aput-object v9, v5, v8

    .line 64
    const/4 v8, 0x1

    const-class v9, Ljava/lang/String;

    aput-object v9, v5, v8

    .line 65
    const-string v8, "get"

    invoke-virtual {v0, v8, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 67
    .local v3, get:Ljava/lang/reflect/Method;
    const/4 v8, 0x2

    new-array v6, v8, [Ljava/lang/Object;

    .line 68
    .local v6, params:[Ljava/lang/Object;
    const/4 v8, 0x0

    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    aput-object v9, v6, v8

    .line 69
    const/4 v8, 0x1

    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, p2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    aput-object v9, v6, v8

    .line 70
    invoke-virtual {v3, v0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .end local v7           #ret:Ljava/lang/String;
    check-cast v7, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 77
    .end local v0           #SystemProperties:Ljava/lang/Class;
    .end local v1           #cl:Ljava/lang/ClassLoader;
    .end local v3           #get:Ljava/lang/reflect/Method;
    .end local v5           #paramTypes:[Ljava/lang/Class;
    .end local v6           #params:[Ljava/lang/Object;
    .restart local v7       #ret:Ljava/lang/String;
    :goto_0
    return-object v7

    .line 71
    .end local v7           #ret:Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 72
    .local v4, iAE:Ljava/lang/IllegalArgumentException;
    throw v4

    .line 73
    .end local v4           #iAE:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v2

    .line 74
    .local v2, e:Ljava/lang/Exception;
    move-object v7, p2

    .restart local v7       #ret:Ljava/lang/String;
    goto :goto_0
.end method
