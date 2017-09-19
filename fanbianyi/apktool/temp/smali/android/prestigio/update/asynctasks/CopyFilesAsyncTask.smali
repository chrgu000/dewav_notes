.class public Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;
.super Landroid/os/AsyncTask;
.source "CopyFilesAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Landroid/prestigio/update/asynctasks/CopyResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CopyFilesAsyncTask"


# instance fields
.field private dPath:Ljava/lang/String;

.field private mFirmwareUpdatingActivity:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

.field private mProgressDialog:Landroid/app/ProgressDialog;

.field private resPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/prestigio/update/activity/FirmwareUpdatingActivity;)V
    .locals 1
    .parameter "firmwareUpdatingActivity"

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 31
    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mFirmwareUpdatingActivity:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    .line 32
    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 33
    const-string v0, "/mnt/sdcard/external_sdcard/"

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->resPath:Ljava/lang/String;

    .line 34
    const-string v0, "/mnt/sdcard/"

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->dPath:Ljava/lang/String;

    .line 37
    iput-object p1, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mFirmwareUpdatingActivity:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    .line 38
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Landroid/prestigio/update/asynctasks/CopyResult;
    .locals 14
    .parameter "params"

    .prologue
    const/4 v12, 0x0

    .line 51
    aget-object v12, p1, v12

    iput-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->resPath:Ljava/lang/String;

    .line 52
    iget-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->resPath:Ljava/lang/String;

    if-eqz v12, :cond_0

    iget-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->resPath:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-nez v12, :cond_1

    .line 53
    :cond_0
    const-string v12, "/mnt/sdcard/external_sdcard/"

    iput-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->resPath:Ljava/lang/String;

    .line 56
    :cond_1
    const/4 v12, 0x1

    :try_start_0
    aget-object v12, p1, v12

    iput-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->dPath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 60
    :goto_0
    iget-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->dPath:Ljava/lang/String;

    if-eqz v12, :cond_2

    iget-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->dPath:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-nez v12, :cond_3

    .line 61
    :cond_2
    const-string v12, "/mnt/sdcard/"

    iput-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->dPath:Ljava/lang/String;

    .line 64
    :cond_3
    sget-object v9, Landroid/prestigio/update/asynctasks/CopyResult;->SUCCESS:Landroid/prestigio/update/asynctasks/CopyResult;

    .line 66
    .local v9, result:Landroid/prestigio/update/asynctasks/CopyResult;
    :try_start_1
    new-instance v3, Ljava/io/File;

    iget-object v12, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->dPath:Ljava/lang/String;

    const-string v13, "update.zip"

    invoke-direct {v3, v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .local v3, dFile:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5

    move-result v12

    if-eqz v12, :cond_7

    .line 69
    :try_start_2
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 70
    .local v6, input:Ljava/io/FileInputStream;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 71
    .local v1, buffer:Ljava/io/BufferedInputStream;
    new-instance v10, Ljava/util/zip/ZipInputStream;

    invoke-direct {v10, v1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    .line 75
    .local v10, zip:Ljava/util/zip/ZipInputStream;
    :goto_1
    :try_start_3
    invoke-virtual {v10}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v11

    .local v11, zipEntry:Ljava/util/zip/ZipEntry;
    if-eqz v11, :cond_6

    .line 76
    invoke-virtual {v11}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    .line 77
    .local v5, filename:Ljava/lang/String;
    const/16 v12, 0x1000

    new-array v0, v12, [B

    .line 79
    .local v0, buff:[B
    new-instance v8, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->resPath:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v8, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 80
    .local v8, resFile:Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 81
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 82
    :cond_4
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 84
    .local v7, output:Ljava/io/FileOutputStream;
    :goto_2
    :try_start_4
    invoke-virtual {v10, v0}, Ljava/util/zip/ZipInputStream;->read([B)I

    move-result v2

    .local v2, count:I
    const/4 v12, -0x1

    if-eq v2, v12, :cond_5

    .line 85
    const/4 v12, 0x0

    invoke-virtual {v7, v0, v12, v2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_2

    .line 87
    .end local v2           #count:I
    :catch_0
    move-exception v4

    .line 88
    .local v4, e:Ljava/io/IOException;
    :try_start_5
    const-string v12, "CopyFilesAsyncTask"

    const-string v13, "unzip process failed"

    invoke-static {v12, v13}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    .line 91
    .end local v4           #e:Ljava/io/IOException;
    :cond_5
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->flush()V

    .line 92
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 94
    .end local v0           #buff:[B
    .end local v5           #filename:Ljava/lang/String;
    .end local v7           #output:Ljava/io/FileOutputStream;
    .end local v8           #resFile:Ljava/io/File;
    .end local v11           #zipEntry:Ljava/util/zip/ZipEntry;
    :catch_1
    move-exception v4

    .line 95
    .restart local v4       #e:Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 99
    .end local v4           #e:Ljava/io/IOException;
    :cond_6
    :try_start_7
    invoke-virtual {v10}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    .line 113
    .end local v1           #buffer:Ljava/io/BufferedInputStream;
    .end local v3           #dFile:Ljava/io/File;
    .end local v6           #input:Ljava/io/FileInputStream;
    .end local v10           #zip:Ljava/util/zip/ZipInputStream;
    :goto_3
    return-object v9

    .line 57
    .end local v9           #result:Landroid/prestigio/update/asynctasks/CopyResult;
    :catch_2
    move-exception v4

    .line 58
    .local v4, e:Ljava/lang/Exception;
    const-string v12, "CopyFilesAsyncTask"

    const-string v13, "use default path"

    invoke-static {v12, v13}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 100
    .end local v4           #e:Ljava/lang/Exception;
    .restart local v1       #buffer:Ljava/io/BufferedInputStream;
    .restart local v3       #dFile:Ljava/io/File;
    .restart local v6       #input:Ljava/io/FileInputStream;
    .restart local v9       #result:Landroid/prestigio/update/asynctasks/CopyResult;
    .restart local v10       #zip:Ljava/util/zip/ZipInputStream;
    :catch_3
    move-exception v4

    .line 101
    .local v4, e:Ljava/io/IOException;
    :try_start_8
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_3

    .line 104
    .end local v1           #buffer:Ljava/io/BufferedInputStream;
    .end local v4           #e:Ljava/io/IOException;
    .end local v6           #input:Ljava/io/FileInputStream;
    .end local v10           #zip:Ljava/util/zip/ZipInputStream;
    :catch_4
    move-exception v4

    .line 105
    .local v4, e:Ljava/io/FileNotFoundException;
    :try_start_9
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    goto :goto_3

    .line 110
    .end local v3           #dFile:Ljava/io/File;
    .end local v4           #e:Ljava/io/FileNotFoundException;
    :catch_5
    move-exception v4

    .line 111
    .local v4, e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 98
    .end local v4           #e:Ljava/lang/Exception;
    .restart local v1       #buffer:Ljava/io/BufferedInputStream;
    .restart local v3       #dFile:Ljava/io/File;
    .restart local v6       #input:Ljava/io/FileInputStream;
    .restart local v10       #zip:Ljava/util/zip/ZipInputStream;
    :catchall_0
    move-exception v12

    .line 99
    :try_start_a
    invoke-virtual {v10}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/io/FileNotFoundException; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5

    .line 102
    :goto_4
    :try_start_b
    throw v12

    .line 100
    :catch_6
    move-exception v4

    .line 101
    .local v4, e:Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_b
    .catch Ljava/io/FileNotFoundException; {:try_start_b .. :try_end_b} :catch_4
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    goto :goto_4

    .line 108
    .end local v1           #buffer:Ljava/io/BufferedInputStream;
    .end local v4           #e:Ljava/io/IOException;
    .end local v6           #input:Ljava/io/FileInputStream;
    .end local v10           #zip:Ljava/util/zip/ZipInputStream;
    :cond_7
    :try_start_c
    sget-object v9, Landroid/prestigio/update/asynctasks/CopyResult;->ERROR:Landroid/prestigio/update/asynctasks/CopyResult;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5

    goto :goto_3
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 29
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->doInBackground([Ljava/lang/String;)Landroid/prestigio/update/asynctasks/CopyResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/prestigio/update/asynctasks/CopyResult;)V
    .locals 6
    .parameter "result"

    .prologue
    .line 118
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 119
    iget-object v4, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 120
    sget-object v4, Landroid/prestigio/update/asynctasks/CopyResult;->SUCCESS:Landroid/prestigio/update/asynctasks/CopyResult;

    if-ne p1, v4, :cond_0

    .line 121
    new-instance v0, Ljava/io/File;

    iget-object v4, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->dPath:Ljava/lang/String;

    const-string v5, "update.zip"

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .local v0, dFile:Ljava/io/File;
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->resPath:Ljava/lang/String;

    const-string v5, "update.zip"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .local v3, updFile:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 124
    const-string v4, "CopyFilesAsyncTask"

    const-string v5, "copy success"

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 127
    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v4, "/sdcard/update.zip"

    invoke-static {v4}, Landroid/prestigio/update/preferences/ApplicationPreferences;->getRebootFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 128
    .local v2, packageFile:Ljava/io/File;
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v4

    invoke-static {v4, v2}, Landroid/os/RecoverySystem;->installPackage(Landroid/content/Context;Ljava/io/File;)V

    .line 129
    const-string v4, "CopyFilesAsyncTask"

    const-string v5, "install started"

    invoke-static {v4, v5}, Landroid/prestigio/update/utils/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    .end local v0           #dFile:Ljava/io/File;
    .end local v2           #packageFile:Ljava/io/File;
    .end local v3           #updFile:Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 130
    .restart local v0       #dFile:Ljava/io/File;
    .restart local v3       #updFile:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 131
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 29
    check-cast p1, Landroid/prestigio/update/asynctasks/CopyResult;

    invoke-virtual {p0, p1}, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->onPostExecute(Landroid/prestigio/update/asynctasks/CopyResult;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 42
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 43
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mFirmwareUpdatingActivity:Landroid/prestigio/update/activity/FirmwareUpdatingActivity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 44
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    const/high16 v1, 0x7f04

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(I)V

    .line 45
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 46
    iget-object v0, p0, Landroid/prestigio/update/asynctasks/CopyFilesAsyncTask;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 47
    return-void
.end method
