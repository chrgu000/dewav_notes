.class public abstract Lcz/msebera/android/httpclient/pool/AbstractConnPool;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Lcz/msebera/android/httpclient/pool/ConnPool;
.implements Lcz/msebera/android/httpclient/pool/ConnPoolControl;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        "E:",
        "Lcz/msebera/android/httpclient/pool/PoolEntry",
        "<TT;TC;>;>",
        "Ljava/lang/Object;",
        "Lcz/msebera/android/httpclient/pool/ConnPool",
        "<TT;TE;>;",
        "Lcz/msebera/android/httpclient/pool/ConnPoolControl",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final available:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final connFactory:Lcz/msebera/android/httpclient/pool/ConnFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/pool/ConnFactory",
            "<TT;TC;>;"
        }
    .end annotation
.end field

.field private volatile defaultMaxPerRoute:I

.field private volatile isShutDown:Z

.field private final leased:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation
.end field

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final maxPerRoute:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TT;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile maxTotal:I

.field private final pending:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcz/msebera/android/httpclient/pool/PoolEntryFuture",
            "<TE;>;>;"
        }
    .end annotation
.end field

.field private final routeToPool:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TT;",
            "Lcz/msebera/android/httpclient/pool/RouteSpecificPool",
            "<TT;TC;TE;>;>;"
        }
    .end annotation
.end field

.field private volatile validateAfterInactivity:I


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/pool/ConnFactory;II)V
    .locals 1
    .parameter
    .parameter "defaultMaxPerRoute"
    .parameter "maxTotal"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/pool/ConnFactory",
            "<TT;TC;>;II)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, connFactory:Lcz/msebera/android/httpclient/pool/ConnFactory;,"Lcz/msebera/android/httpclient/pool/ConnFactory<TT;TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const-string v0, "Connection factory"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/ConnFactory;

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->connFactory:Lcz/msebera/android/httpclient/pool/ConnFactory;

    .line 86
    const-string v0, "Max per route value"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->positive(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->defaultMaxPerRoute:I

    .line 87
    const-string v0, "Max total value"

    invoke-static {p3, v0}, Lcz/msebera/android/httpclient/util/Args;->positive(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I

    .line 88
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    .line 90
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    .line 91
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    .line 92
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    .line 94
    return-void
.end method

.method static synthetic access$000(Lcz/msebera/android/httpclient/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)Lcz/msebera/android/httpclient/pool/PoolEntry;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct/range {p0 .. p6}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)Lcz/msebera/android/httpclient/pool/PoolEntry;

    move-result-object v0

    return-object v0
.end method

.method private getMax(Ljava/lang/Object;)I
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 356
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, route:Ljava/lang/Object;,"TT;"
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 357
    .local v0, v:Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 358
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 360
    :goto_0
    return v1

    :cond_0
    iget v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->defaultMaxPerRoute:I

    goto :goto_0
.end method

.method private getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcz/msebera/android/httpclient/pool/RouteSpecificPool",
            "<TT;TC;TE;>;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, route:Ljava/lang/Object;,"TT;"
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    .line 159
    .local v0, pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    if-nez v0, :cond_0

    .line 160
    new-instance v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool$1;

    .end local v0           #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-direct {v0, p0, p1, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool$1;-><init>(Lcz/msebera/android/httpclient/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 168
    .restart local v0       #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    :cond_0
    return-object v0
.end method

.method private getPoolEntryBlocking(Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)Lcz/msebera/android/httpclient/pool/PoolEntry;
    .locals 23
    .parameter
    .parameter "state"
    .parameter "timeout"
    .parameter "tunit"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lcz/msebera/android/httpclient/pool/PoolEntryFuture",
            "<TE;>;)TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 226
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, route:Ljava/lang/Object;,"TT;"
    .local p6, future:Lcz/msebera/android/httpclient/pool/PoolEntryFuture;,"Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    const/4 v5, 0x0

    .line 227
    .local v5, deadline:Ljava/util/Date;
    const-wide/16 v18, 0x0

    cmp-long v18, p3, v18

    if-lez v18, :cond_0

    .line 228
    new-instance v5, Ljava/util/Date;

    .line 229
    .end local v5           #deadline:Ljava/util/Date;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move-object/from16 v0, p5

    move-wide/from16 v1, p3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v20

    add-long v18, v18, v20

    move-wide/from16 v0, v18

    invoke-direct {v5, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 232
    .restart local v5       #deadline:Ljava/util/Date;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 234
    :try_start_0
    invoke-direct/range {p0 .. p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v14

    .line 235
    .local v14, pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    const/4 v6, 0x0

    .line 236
    .local v6, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    :cond_1
    if-nez v6, :cond_c

    .line 237
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    move/from16 v18, v0

    if-nez v18, :cond_3

    const/16 v18, 0x1

    :goto_0
    const-string v19, "Connection pool shut down"

    invoke-static/range {v18 .. v19}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 239
    :goto_1
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getFree(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/PoolEntry;

    move-result-object v6

    .line 240
    if-nez v6, :cond_4

    .line 259
    :cond_2
    if-eqz v6, :cond_7

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 262
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->onReuse(Lcz/msebera/android/httpclient/pool/PoolEntry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v7, v6

    .end local v6           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .local v7, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    :goto_2
    return-object v7

    .line 237
    .end local v7           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .restart local v6       #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    :cond_3
    const/16 v18, 0x0

    goto :goto_0

    .line 243
    :cond_4
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    move-wide/from16 v0, v18

    invoke-virtual {v6, v0, v1}, Lcz/msebera/android/httpclient/pool/PoolEntry;->isExpired(J)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 244
    invoke-virtual {v6}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    .line 252
    :cond_5
    :goto_3
    invoke-virtual {v6}, Lcz/msebera/android/httpclient/pool/PoolEntry;->isClosed()Z

    move-result v18

    if-eqz v18, :cond_2

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 254
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v14, v6, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->free(Lcz/msebera/android/httpclient/pool/PoolEntry;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 323
    .end local v6           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .end local v14           #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_0
    move-exception v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v18

    .line 245
    .restart local v6       #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .restart local v14       #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_6
    :try_start_2
    move-object/from16 v0, p0

    iget v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->validateAfterInactivity:I

    move/from16 v18, v0

    if-lez v18, :cond_5

    .line 246
    invoke-virtual {v6}, Lcz/msebera/android/httpclient/pool/PoolEntry;->getUpdated()J

    move-result-wide v18

    move-object/from16 v0, p0

    iget v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->validateAfterInactivity:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    add-long v18, v18, v20

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    cmp-long v18, v18, v20

    if-gtz v18, :cond_5

    .line 247
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->validate(Lcz/msebera/android/httpclient/pool/PoolEntry;)Z

    move-result v18

    if-nez v18, :cond_5

    .line 248
    invoke-virtual {v6}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    goto :goto_3

    .line 267
    :cond_7
    invoke-direct/range {p0 .. p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result v12

    .line 269
    .local v12, maxPerRoute:I
    const/16 v18, 0x0

    invoke-virtual {v14}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v19

    add-int/lit8 v19, v19, 0x1

    sub-int v19, v19, v12

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 270
    .local v8, excess:I
    if-lez v8, :cond_8

    .line 271
    const/4 v10, 0x0

    .local v10, i:I
    :goto_4
    if-ge v10, v8, :cond_8

    .line 272
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getLastUsed()Lcz/msebera/android/httpclient/pool/PoolEntry;

    move-result-object v11

    .line 273
    .local v11, lastUsed:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    if-nez v11, :cond_a

    .line 282
    .end local v10           #i:I
    .end local v11           #lastUsed:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    :cond_8
    invoke-virtual {v14}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v18

    move/from16 v0, v18

    if-ge v0, v12, :cond_b

    .line 283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->size()I

    move-result v17

    .line 284
    .local v17, totalUsed:I
    move-object/from16 v0, p0

    iget v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I

    move/from16 v18, v0

    sub-int v18, v18, v17

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 285
    .local v9, freeCapacity:I
    if-lez v9, :cond_b

    .line 286
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/LinkedList;->size()I

    move-result v16

    .line 287
    .local v16, totalAvailable:I
    add-int/lit8 v18, v9, -0x1

    move/from16 v0, v16

    move/from16 v1, v18

    if-le v0, v1, :cond_9

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_9

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 290
    .restart local v11       #lastUsed:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    invoke-virtual {v11}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    .line 291
    invoke-virtual {v11}, Lcz/msebera/android/httpclient/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v13

    .line 292
    .local v13, otherpool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v13, v11}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->remove(Lcz/msebera/android/httpclient/pool/PoolEntry;)Z

    .line 295
    .end local v11           #lastUsed:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .end local v13           #otherpool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->connFactory:Lcz/msebera/android/httpclient/pool/ConnFactory;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/pool/ConnFactory;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 296
    .local v4, conn:Ljava/lang/Object;,"TC;"
    invoke-virtual {v14, v4}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->add(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/PoolEntry;

    move-result-object v6

    .line 297
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 323
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/concurrent/locks/Lock;->unlock()V

    move-object v7, v6

    .end local v6           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .restart local v7       #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    goto/16 :goto_2

    .line 276
    .end local v4           #conn:Ljava/lang/Object;,"TC;"
    .end local v7           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .end local v9           #freeCapacity:I
    .end local v16           #totalAvailable:I
    .end local v17           #totalUsed:I
    .restart local v6       #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .restart local v10       #i:I
    .restart local v11       #lastUsed:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    :cond_a
    :try_start_3
    invoke-virtual {v11}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 278
    invoke-virtual {v14, v11}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->remove(Lcz/msebera/android/httpclient/pool/PoolEntry;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 271
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_4

    .line 302
    .end local v10           #i:I
    .end local v11           #lastUsed:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    :cond_b
    const/4 v15, 0x0

    .line 304
    .local v15, success:Z
    :try_start_4
    move-object/from16 v0, p6

    invoke-virtual {v14, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->queue(Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)V

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 306
    move-object/from16 v0, p6

    invoke-virtual {v0, v5}, Lcz/msebera/android/httpclient/pool/PoolEntryFuture;->await(Ljava/util/Date;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result v15

    .line 312
    :try_start_5
    move-object/from16 v0, p6

    invoke-virtual {v14, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->unqueue(Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)V

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 316
    if-nez v15, :cond_1

    if-eqz v5, :cond_1

    .line 317
    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v18

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v20

    cmp-long v18, v18, v20

    if-gtz v18, :cond_1

    .line 321
    .end local v8           #excess:I
    .end local v12           #maxPerRoute:I
    .end local v15           #success:Z
    :cond_c
    new-instance v18, Ljava/util/concurrent/TimeoutException;

    const-string v19, "Timeout waiting for connection"

    invoke-direct/range {v18 .. v19}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 312
    .restart local v8       #excess:I
    .restart local v12       #maxPerRoute:I
    .restart local v15       #success:Z
    :catchall_1
    move-exception v18

    move-object/from16 v0, p6

    invoke-virtual {v14, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->unqueue(Lcz/msebera/android/httpclient/pool/PoolEntryFuture;)V

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    throw v18
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method private purgePoolMap()V
    .locals 5

    .prologue
    .line 517
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 518
    .local v1, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<TT;Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 519
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 520
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TT;Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    .line 521
    .local v2, pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v2}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getPendingCount()I

    move-result v3

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getAllocatedCount()I

    move-result v4

    add-int/2addr v3, v4

    if-nez v3, :cond_0

    .line 522
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 525
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<TT;Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;>;"
    .end local v2           #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_1
    return-void
.end method


# virtual methods
.method public closeExpired()V
    .locals 3

    .prologue
    .line 557
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 558
    .local v0, now:J
    new-instance v2, Lcz/msebera/android/httpclient/pool/AbstractConnPool$4;

    invoke-direct {v2, p0, v0, v1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool$4;-><init>(Lcz/msebera/android/httpclient/pool/AbstractConnPool;J)V

    invoke-virtual {p0, v2}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->enumAvailable(Lcz/msebera/android/httpclient/pool/PoolEntryCallback;)V

    .line 568
    return-void
.end method

.method public closeIdle(JLjava/util/concurrent/TimeUnit;)V
    .locals 7
    .parameter "idletime"
    .parameter "tunit"

    .prologue
    .line 535
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v4, "Time unit"

    invoke-static {p3, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 536
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    .line 537
    .local v2, time:J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_0

    .line 538
    const-wide/16 v2, 0x0

    .line 540
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v2

    .line 541
    .local v0, deadline:J
    new-instance v4, Lcz/msebera/android/httpclient/pool/AbstractConnPool$3;

    invoke-direct {v4, p0, v0, v1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool$3;-><init>(Lcz/msebera/android/httpclient/pool/AbstractConnPool;J)V

    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->enumAvailable(Lcz/msebera/android/httpclient/pool/PoolEntryCallback;)V

    .line 551
    return-void
.end method

.method protected abstract createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/PoolEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TC;)TE;"
        }
    .end annotation
.end method

.method protected enumAvailable(Lcz/msebera/android/httpclient/pool/PoolEntryCallback;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/pool/PoolEntryCallback",
            "<TT;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 480
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, callback:Lcz/msebera/android/httpclient/pool/PoolEntryCallback;,"Lcz/msebera/android/httpclient/pool/PoolEntryCallback<TT;TC;>;"
    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 482
    :try_start_0
    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 483
    .local v1, it:Ljava/util/Iterator;,"Ljava/util/Iterator<TE;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 484
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 485
    .local v0, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/pool/PoolEntryCallback;->process(Lcz/msebera/android/httpclient/pool/PoolEntry;)V

    .line 486
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntry;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 487
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v3

    invoke-direct {p0, v3}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v2

    .line 488
    .local v2, pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v2, v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->remove(Lcz/msebera/android/httpclient/pool/PoolEntry;)Z

    .line 489
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 494
    .end local v0           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .end local v1           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<TE;>;"
    .end local v2           #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v4}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v3

    .line 492
    .restart local v1       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<TE;>;"
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->purgePoolMap()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 494
    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 496
    return-void
.end method

.method protected enumLeased(Lcz/msebera/android/httpclient/pool/PoolEntryCallback;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/pool/PoolEntryCallback",
            "<TT;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 504
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, callback:Lcz/msebera/android/httpclient/pool/PoolEntryCallback;,"Lcz/msebera/android/httpclient/pool/PoolEntryCallback<TT;TC;>;"
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 506
    :try_start_0
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 507
    .local v1, it:Ljava/util/Iterator;,"Ljava/util/Iterator<TE;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 508
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 509
    .local v0, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/pool/PoolEntryCallback;->process(Lcz/msebera/android/httpclient/pool/PoolEntry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 512
    .end local v0           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    .end local v1           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<TE;>;"
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .restart local v1       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<TE;>;"
    :cond_0
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 514
    return-void
.end method

.method public getDefaultMaxPerRoute()I
    .locals 2

    .prologue
    .line 398
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 400
    :try_start_0
    iget v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 402
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getMaxPerRoute(Ljava/lang/Object;)I
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 420
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, route:Ljava/lang/Object;,"TT;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 421
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 423
    :try_start_0
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 425
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getMaxTotal()I
    .locals 2

    .prologue
    .line 377
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 379
    :try_start_0
    iget v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 381
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getRoutes()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 466
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 468
    :try_start_0
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getStats(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/PoolStats;
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcz/msebera/android/httpclient/pool/PoolStats;"
        }
    .end annotation

    .prologue
    .line 445
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, route:Ljava/lang/Object;,"TT;"
    const-string v1, "Route"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 446
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 448
    :try_start_0
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v0

    .line 449
    .local v0, pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    new-instance v1, Lcz/msebera/android/httpclient/pool/PoolStats;

    .line 450
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getLeasedCount()I

    move-result v2

    .line 451
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getPendingCount()I

    move-result v3

    .line 452
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->getAvailableCount()I

    move-result v4

    .line 453
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getMax(Ljava/lang/Object;)I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcz/msebera/android/httpclient/pool/PoolStats;-><init>(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 455
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    .end local v0           #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public getTotalStats()Lcz/msebera/android/httpclient/pool/PoolStats;
    .locals 5

    .prologue
    .line 431
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 433
    :try_start_0
    new-instance v0, Lcz/msebera/android/httpclient/pool/PoolStats;

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    .line 434
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    .line 435
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    .line 436
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    iget v4, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcz/msebera/android/httpclient/pool/PoolStats;-><init>(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 439
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public getValidateAfterInactivity()I
    .locals 1

    .prologue
    .line 575
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->validateAfterInactivity:I

    return v0
.end method

.method public isShutdown()Z
    .locals 1

    .prologue
    .line 127
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    return v0
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .locals 1
    .parameter
    .parameter "state"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/concurrent/Future",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 217
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, route:Ljava/lang/Object;,"TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lease(Ljava/lang/Object;Ljava/lang/Object;Lcz/msebera/android/httpclient/concurrent/FutureCallback;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0
.end method

.method public lease(Ljava/lang/Object;Ljava/lang/Object;Lcz/msebera/android/httpclient/concurrent/FutureCallback;)Ljava/util/concurrent/Future;
    .locals 6
    .parameter
    .parameter "state"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/Object;",
            "Lcz/msebera/android/httpclient/concurrent/FutureCallback",
            "<TE;>;)",
            "Ljava/util/concurrent/Future",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 183
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, route:Ljava/lang/Object;,"TT;"
    .local p3, callback:Lcz/msebera/android/httpclient/concurrent/FutureCallback;,"Lcz/msebera/android/httpclient/concurrent/FutureCallback<TE;>;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 184
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string v1, "Connection pool shut down"

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 185
    new-instance v0, Lcz/msebera/android/httpclient/pool/AbstractConnPool$2;

    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    move-object v1, p0

    move-object v3, p3

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/pool/AbstractConnPool$2;-><init>(Lcz/msebera/android/httpclient/pool/AbstractConnPool;Ljava/util/concurrent/locks/Lock;Lcz/msebera/android/httpclient/concurrent/FutureCallback;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    .line 184
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onLease(Lcz/msebera/android/httpclient/pool/PoolEntry;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    return-void
.end method

.method protected onRelease(Lcz/msebera/android/httpclient/pool/PoolEntry;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    return-void
.end method

.method protected onReuse(Lcz/msebera/android/httpclient/pool/PoolEntry;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    return-void
.end method

.method public release(Lcz/msebera/android/httpclient/pool/PoolEntry;Z)V
    .locals 4
    .parameter
    .parameter "reusable"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)V"
        }
    .end annotation

    .prologue
    .line 329
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 331
    :try_start_0
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 332
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/pool/PoolEntry;->getRoute()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    move-result-object v1

    .line 333
    .local v1, pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v1, p1, p2}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->free(Lcz/msebera/android/httpclient/pool/PoolEntry;Z)V

    .line 334
    if-eqz p2, :cond_1

    iget-boolean v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    if-nez v2, :cond_1

    .line 335
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 336
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->onRelease(Lcz/msebera/android/httpclient/pool/PoolEntry;)V

    .line 340
    :goto_0
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->nextPending()Lcz/msebera/android/httpclient/pool/PoolEntryFuture;

    move-result-object v0

    .line 341
    .local v0, future:Lcz/msebera/android/httpclient/pool/PoolEntryFuture;,"Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    if-eqz v0, :cond_2

    .line 342
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 346
    :goto_1
    if-eqz v0, :cond_0

    .line 347
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntryFuture;->wakeup()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 351
    .end local v0           #future:Lcz/msebera/android/httpclient/pool/PoolEntryFuture;,"Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    .end local v1           #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_0
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 353
    return-void

    .line 338
    .restart local v1       #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 351
    .end local v1           #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .line 344
    .restart local v0       #future:Lcz/msebera/android/httpclient/pool/PoolEntryFuture;,"Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    .restart local v1       #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_2
    :try_start_2
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0           #future:Lcz/msebera/android/httpclient/pool/PoolEntryFuture;,"Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntryFuture;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .restart local v0       #future:Lcz/msebera/android/httpclient/pool/PoolEntryFuture;,"Lcz/msebera/android/httpclient/pool/PoolEntryFuture<TE;>;"
    goto :goto_1
.end method

.method public bridge synthetic release(Ljava/lang/Object;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 63
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    check-cast p1, Lcz/msebera/android/httpclient/pool/PoolEntry;

    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->release(Lcz/msebera/android/httpclient/pool/PoolEntry;Z)V

    return-void
.end method

.method public setDefaultMaxPerRoute(I)V
    .locals 2
    .parameter "max"

    .prologue
    .line 387
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v0, "Max per route value"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->positive(ILjava/lang/String;)I

    .line 388
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 390
    :try_start_0
    iput p1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->defaultMaxPerRoute:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 392
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 394
    return-void

    .line 392
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setMaxPerRoute(Ljava/lang/Object;I)V
    .locals 2
    .parameter
    .parameter "max"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .prologue
    .line 408
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, route:Ljava/lang/Object;,"TT;"
    const-string v0, "Route"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 409
    const-string v0, "Max per route value"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->positive(ILjava/lang/String;)I

    .line 410
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 412
    :try_start_0
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxPerRoute:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 414
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 416
    return-void

    .line 414
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setMaxTotal(I)V
    .locals 2
    .parameter "max"

    .prologue
    .line 366
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    const-string v0, "Max value"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->positive(ILjava/lang/String;)I

    .line 367
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 369
    :try_start_0
    iput p1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->maxTotal:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 371
    iget-object v0, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 373
    return-void

    .line 371
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public setValidateAfterInactivity(I)V
    .locals 0
    .parameter "ms"

    .prologue
    .line 583
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iput p1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->validateAfterInactivity:I

    .line 584
    return-void
.end method

.method public shutdown()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    iget-boolean v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    if-eqz v2, :cond_0

    .line 155
    :goto_0
    return-void

    .line 137
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->isShutDown:Z

    .line 138
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 140
    :try_start_0
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 141
    .local v0, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 153
    .end local v0           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2

    .line 143
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/pool/PoolEntry;

    .line 144
    .restart local v0       #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/pool/PoolEntry;->close()V

    goto :goto_2

    .line 146
    .end local v0           #entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    :cond_2
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;

    .line 147
    .local v1, pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/pool/RouteSpecificPool;->shutdown()V

    goto :goto_3

    .line 149
    .end local v1           #pool:Lcz/msebera/android/httpclient/pool/RouteSpecificPool;,"Lcz/msebera/android/httpclient/pool/RouteSpecificPool<TT;TC;TE;>;"
    :cond_3
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->routeToPool:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 150
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->clear()V

    .line 151
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 153
    iget-object v2, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 588
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 589
    .local v0, buffer:Ljava/lang/StringBuilder;
    const-string v1, "[leased: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->leased:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 591
    const-string v1, "][available: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->available:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 593
    const-string v1, "][pending: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 594
    iget-object v1, p0, Lcz/msebera/android/httpclient/pool/AbstractConnPool;->pending:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 595
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 596
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected validate(Lcz/msebera/android/httpclient/pool/PoolEntry;)Z
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 123
    .local p0, this:Lcz/msebera/android/httpclient/pool/AbstractConnPool;,"Lcz/msebera/android/httpclient/pool/AbstractConnPool<TT;TC;TE;>;"
    .local p1, entry:Lcz/msebera/android/httpclient/pool/PoolEntry;,"TE;"
    const/4 v0, 0x1

    return v0
.end method
