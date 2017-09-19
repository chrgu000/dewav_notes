.class public Landroid/prestigio/update/utils/NotificationUtils;
.super Ljava/lang/Object;
.source "NotificationUtils.java"


# static fields
.field private static final NOTIFICATION_DOWNLOAD_TITLE_ID:I = 0x1b0

.field private static final SYSTEM_UPDATE_FOUND_NOTIFICATION_ID:I = 0x3da

.field private static final TAG:Ljava/lang/String; = "DownloadFileAsyncTask"

.field private static mNotification:Landroid/app/Notification;

.field private static mNotificationManager:Landroid/app/NotificationManager;


# instance fields
.field private lastMessage:Ljava/lang/String;

.field private lastProgress:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 18
    sput-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    .line 19
    sput-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    if-nez v0, :cond_1

    .line 23
    :cond_0
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/prestigio/update/UpdateApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    sput-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    .line 26
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    const v1, 0x7f04002b

    invoke-virtual {v0, v1}, Landroid/prestigio/update/UpdateApplication;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 25
    invoke-direct {p0, v0, v1}, Landroid/prestigio/update/utils/NotificationUtils;->createDownloadProgressNotification(Ljava/lang/String;I)Landroid/app/Notification;

    move-result-object v0

    sput-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    .line 28
    :cond_1
    return-void
.end method

.method private createDownloadProgressNotification(Ljava/lang/String;I)Landroid/app/Notification;
    .locals 9
    .parameter "title"
    .parameter "progress"

    .prologue
    const v8, 0x7f08000d

    const/4 v7, 0x0

    .line 67
    new-instance v1, Landroid/widget/RemoteViews;

    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    invoke-virtual {v4}, Landroid/prestigio/update/UpdateApplication;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/high16 v5, 0x7f03

    invoke-direct {v1, v4, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 70
    .local v1, contentView:Landroid/widget/RemoteViews;
    const v4, 0x7f08000b

    invoke-virtual {v1, v4, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 71
    const v4, 0x7f08000c

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 72
    const v4, 0x7f08000a

    const v5, 0x7f020002

    invoke-virtual {v1, v4, v5}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 73
    const/16 v4, 0x64

    invoke-virtual {v1, v8, v4, p2, v7}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 74
    new-instance v2, Landroid/content/Intent;

    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    const-class v5, Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 75
    .local v2, intent:Landroid/content/Intent;
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v4, v5, v2, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 76
    .local v0, contentIntent:Landroid/app/PendingIntent;
    invoke-virtual {v1, v8, v0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 87
    new-instance v4, Landroid/app/Notification$Builder;

    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "OTA Download"

    .line 88
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    const-string v5, "download"

    .line 89
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 90
    invoke-virtual {v4}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v3

    .line 93
    .local v3, notification:Landroid/app/Notification;
    const v4, 0x1080081

    iput v4, v3, Landroid/app/Notification;->icon:I

    .line 94
    iget v4, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v4, v4, 0x2

    iput v4, v3, Landroid/app/Notification;->flags:I

    .line 95
    iput-object v1, v3, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 96
    iput-object v0, v3, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 97
    return-object v3
.end method


# virtual methods
.method public cancelAllNotifications()V
    .locals 2

    .prologue
    .line 62
    const-string v0, "DownloadFileAsyncTask"

    const-string v1, "cancelAllNotifications"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 64
    return-void
.end method

.method public cancelSystemUpdateFoundNotification()V
    .locals 2

    .prologue
    .line 101
    const-string v0, "DownloadFileAsyncTask"

    const-string v1, "cancelSystemUpdateFoundNotification"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v1, 0x3da

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 103
    return-void
.end method

.method public displayDownloadMessageNotification()V
    .locals 3

    .prologue
    .line 31
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 32
    const-string v0, "DownloadFileAsyncTask"

    const-string v1, "displayDownloadMessageNotification"

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v1, 0x1b0

    sget-object v2, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 34
    return-void
.end method

.method public displayNotificationMessage(II)V
    .locals 3
    .parameter "messageId"
    .parameter "progress"

    .prologue
    .line 56
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 57
    const-string v0, "DownloadFileAsyncTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "displayNotificationMessage "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/prestigio/update/UpdateApplication;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Landroid/prestigio/update/utils/NotificationUtils;->displayNotificationMessage(Ljava/lang/String;I)V

    .line 59
    return-void
.end method

.method public displayNotificationMessage(Ljava/lang/String;I)V
    .locals 5
    .parameter "message"
    .parameter "progress"

    .prologue
    const/4 v4, 0x0

    .line 40
    iget-object v0, p0, Landroid/prestigio/update/utils/NotificationUtils;->lastMessage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/prestigio/update/utils/NotificationUtils;->lastProgress:I

    if-eq p2, v0, :cond_1

    .line 43
    :cond_0
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v0

    const v1, 0x7f04002b

    invoke-virtual {v0, v1}, Landroid/prestigio/update/UpdateApplication;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 42
    invoke-direct {p0, v0, v4}, Landroid/prestigio/update/utils/NotificationUtils;->createDownloadProgressNotification(Ljava/lang/String;I)Landroid/app/Notification;

    move-result-object v0

    sput-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    .line 44
    iput-object p1, p0, Landroid/prestigio/update/utils/NotificationUtils;->lastMessage:Ljava/lang/String;

    .line 45
    iput p2, p0, Landroid/prestigio/update/utils/NotificationUtils;->lastProgress:I

    .line 48
    :cond_1
    const-string v0, "DownloadFileAsyncTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "displayNotificationMessage "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    iget-object v0, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const v1, 0x7f08000b

    invoke-virtual {v0, v1, p1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 50
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    iget-object v0, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const v1, 0x7f08000c

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 51
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    iget-object v0, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    const v1, 0x7f08000d

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2, p2, v4}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 52
    sget-object v0, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v1, 0x1b0

    sget-object v2, Landroid/prestigio/update/utils/NotificationUtils;->mNotification:Landroid/app/Notification;

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 53
    return-void
.end method

.method public showSystemUpdateFoundNotification()V
    .locals 8

    .prologue
    .line 106
    sget-object v4, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v4}, Landroid/app/NotificationManager;->cancelAll()V

    .line 107
    const-string v4, "DownloadFileAsyncTask"

    const-string v5, "showSystemUpdateFoundNotification"

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    const/high16 v5, 0x7f04

    invoke-virtual {v4, v5}, Landroid/prestigio/update/UpdateApplication;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 109
    .local v3, title:Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    const-class v5, Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 110
    .local v2, notificationIntent:Landroid/content/Intent;
    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 111
    new-instance v4, Landroid/app/Notification$Builder;

    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f020002

    .line 112
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v4

    const/4 v5, 0x1

    .line 113
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 114
    invoke-virtual {v4, v3}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 115
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v5

    const v6, 0x7f040011

    invoke-virtual {v5, v6}, Landroid/prestigio/update/UpdateApplication;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 117
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v5

    const/4 v6, 0x0

    const/high16 v7, 0x1000

    invoke-static {v5, v6, v2, v7}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 116
    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 118
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 119
    invoke-virtual {v4, v3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object v1

    .line 120
    .local v1, notificationBuilder:Landroid/app/Notification$Builder;
    invoke-virtual {v1}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v0

    .line 121
    .local v0, notification:Landroid/app/Notification;
    sget-object v4, Landroid/prestigio/update/utils/NotificationUtils;->mNotificationManager:Landroid/app/NotificationManager;

    const/16 v5, 0x3da

    invoke-virtual {v4, v5, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 122
    return-void
.end method
