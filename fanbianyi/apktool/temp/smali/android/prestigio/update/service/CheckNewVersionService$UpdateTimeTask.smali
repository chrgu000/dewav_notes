.class Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;
.super Ljava/util/TimerTask;
.source "CheckNewVersionService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/prestigio/update/service/CheckNewVersionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateTimeTask"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/prestigio/update/service/CheckNewVersionService;


# direct methods
.method private constructor <init>(Landroid/prestigio/update/service/CheckNewVersionService;)V
    .locals 0
    .parameter

    .prologue
    .line 145
    iput-object p1, p0, Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;->this$0:Landroid/prestigio/update/service/CheckNewVersionService;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/prestigio/update/service/CheckNewVersionService;Landroid/prestigio/update/service/CheckNewVersionService$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 145
    invoke-direct {p0, p1}, Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;-><init>(Landroid/prestigio/update/service/CheckNewVersionService;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 149
    const/16 v0, 0x13

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 150
    iget-object v0, p0, Landroid/prestigio/update/service/CheckNewVersionService$UpdateTimeTask;->this$0:Landroid/prestigio/update/service/CheckNewVersionService;

    #calls: Landroid/prestigio/update/service/CheckNewVersionService;->checkNewVersion()V
    invoke-static {v0}, Landroid/prestigio/update/service/CheckNewVersionService;->access$100(Landroid/prestigio/update/service/CheckNewVersionService;)V

    .line 151
    return-void
.end method
