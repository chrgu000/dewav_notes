.class Landroid/prestigio/update/activity/SettingsActivity$4;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/prestigio/update/activity/SettingsActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/prestigio/update/activity/SettingsActivity;


# direct methods
.method constructor <init>(Landroid/prestigio/update/activity/SettingsActivity;)V
    .locals 0
    .parameter "this$0"

    .prologue
    .line 231
    iput-object p1, p0, Landroid/prestigio/update/activity/SettingsActivity$4;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 235
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$4;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$100(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 236
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$4;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$100(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->cancel(Z)Z

    .line 238
    :cond_0
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$4;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    new-instance v2, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    iget-object v3, p0, Landroid/prestigio/update/activity/SettingsActivity$4;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    invoke-direct {v2, v3}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;-><init>(Landroid/prestigio/update/activity/SettingsActivity;)V

    #setter for: Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;
    invoke-static {v1, v2}, Landroid/prestigio/update/activity/SettingsActivity;->access$102(Landroid/prestigio/update/activity/SettingsActivity;Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;)Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    .line 239
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$4;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mCheckServerAsyncTask:Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$100(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Landroid/prestigio/update/asynctasks/CheckServerAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 240
    sget-object v1, Landroid/prestigio/update/utils/DateTimeUtils;->SIMPLE_DATE_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, dateTime:Ljava/lang/String;
    iget-object v1, p0, Landroid/prestigio/update/activity/SettingsActivity$4;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    #getter for: Landroid/prestigio/update/activity/SettingsActivity;->mTextViewLastCheck:Landroid/widget/TextView;
    invoke-static {v1}, Landroid/prestigio/update/activity/SettingsActivity;->access$200(Landroid/prestigio/update/activity/SettingsActivity;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Landroid/prestigio/update/activity/SettingsActivity$4;->this$0:Landroid/prestigio/update/activity/SettingsActivity;

    const v4, 0x7f040010

    invoke-virtual {v3, v4}, Landroid/prestigio/update/activity/SettingsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    invoke-static {v0}, Landroid/prestigio/update/preferences/ApplicationPreferences;->setLastUpdateString(Ljava/lang/String;)V

    .line 243
    return-void
.end method
