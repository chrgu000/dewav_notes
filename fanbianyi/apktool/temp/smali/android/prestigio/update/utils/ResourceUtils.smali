.class public Landroid/prestigio/update/utils/ResourceUtils;
.super Ljava/lang/Object;
.source "ResourceUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultRebootMessage()Ljava/lang/String;
    .locals 8

    .prologue
    const v7, 0x7f04002c

    const v6, 0x7f040013

    const v5, 0x7f04001b

    const v4, 0x7f04001c

    .line 9
    invoke-static {}, Landroid/prestigio/update/utils/SystemPropertiesUtils;->getOtaProductName()Ljava/lang/String;

    move-result-object v0

    .line 10
    .local v0, model:Ljava/lang/String;
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f040012

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 11
    .local v1, msg:Ljava/lang/String;
    const-string v2, "PMP3270B,PMP3470B,PMP3770B"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 12
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f040015

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 130
    :cond_0
    :goto_0
    return-object v1

    .line 13
    :cond_1
    const-string v2, "PMP5197DULTRA"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 14
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f040017

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 15
    :cond_2
    const-string v2, "PMP3170B"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 16
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 17
    :cond_3
    const-string v2, "PMP3170BEN"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 18
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 19
    :cond_4
    const-string v2, "GV7777"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 20
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 21
    :cond_5
    const-string v2, "GV7780"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 22
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 23
    :cond_6
    const-string v2, "PMP5880D"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 24
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f04001a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 25
    :cond_7
    const-string v2, "PMP7570C3G"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 26
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f04001d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 27
    :cond_8
    const-string v2, "PMP7280C3G"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 28
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 29
    :cond_9
    const-string v2, "PMT7287_3G"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 30
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 31
    :cond_a
    const-string v2, "PAP7500GB16"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 32
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 33
    :cond_b
    const-string v2, "PAP7500GB32"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 34
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 35
    :cond_c
    const-string v2, "PAP7500"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 36
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 37
    :cond_d
    const-string v2, "PAB2411"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 38
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 39
    :cond_e
    const-string v2, "PAD2411"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 40
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 41
    :cond_f
    const-string v2, "PMP7079D3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 42
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 43
    :cond_10
    const-string v2, "PMP7910D3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 44
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 45
    :cond_11
    const-string v2, "PMT7077_3G"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 46
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 47
    :cond_12
    const-string v2, "PMP7079E3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 48
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 49
    :cond_13
    const-string v2, "PMT7077D3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 50
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 51
    :cond_14
    const-string v2, "PMP7280C3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 52
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 53
    :cond_15
    const-string v2, "PMP7280D3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 54
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 55
    :cond_16
    const-string v2, "PMP7079D3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 56
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 57
    :cond_17
    const-string v2, "PMP7280C3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 58
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 59
    :cond_18
    const-string v2, "PMP5785C3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 60
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 61
    :cond_19
    const-string v2, "PMP7480D3G_QUAD"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 62
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 63
    :cond_1a
    const-string v2, "PMT7287C3G"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 64
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 65
    :cond_1b
    const-string v2, "PMP7380D3G"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 66
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 67
    :cond_1c
    const-string v2, "PAP4323"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 68
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 69
    :cond_1d
    const-string v2, "PAP5430"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 70
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 71
    :cond_1e
    const-string v2, "PAP5500DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 72
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 73
    :cond_1f
    const-string v2, "PAP5450DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_20

    .line 74
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 75
    :cond_20
    const-string v2, "PAP5451DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 76
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 77
    :cond_21
    const-string v2, "PAP3400DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 78
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 79
    :cond_22
    const-string v2, "PAP3350DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 80
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 81
    :cond_23
    const-string v2, "PAP7600DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 82
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 83
    :cond_24
    const-string v2, "PAP5501"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 84
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 85
    :cond_25
    const-string v2, "PMP3570C"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 86
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 87
    :cond_26
    const-string v2, "PMP3670B"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 88
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 89
    :cond_27
    const-string v2, "PMT3677_Wi"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 90
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 91
    :cond_28
    const-string v2, "PER5574BC"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 92
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 93
    :cond_29
    const-string v2, "PMP3670B-WH"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 94
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 95
    :cond_2a
    const-string v2, "PER5474BC"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 96
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 97
    :cond_2b
    const-string v2, "PER5684BC"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 98
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 99
    :cond_2c
    const-string v2, "PER5364BC"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 100
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 101
    :cond_2d
    const-string v2, "PMP5770D"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 102
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 103
    :cond_2e
    const-string v2, "PMP5670C_DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 104
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 105
    :cond_2f
    const-string v2, "PMT5677C_DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 106
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 107
    :cond_30
    const-string v2, "PMP3870C"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 108
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 109
    :cond_31
    const-string v2, "PMP5588C"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 110
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 111
    :cond_32
    const-string v2, "PMT5587_Wi"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_33

    .line 112
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 113
    :cond_33
    const-string v2, "PMP3970B"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 114
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 115
    :cond_34
    const-string v2, "PMP3970B_DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_35

    .line 116
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 117
    :cond_35
    const-string v2, "PMP5580C"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 118
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 119
    :cond_36
    const-string v2, "GV5850"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_37

    .line 120
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 121
    :cond_37
    const-string v2, "PMP7170B3G"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 122
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 123
    :cond_38
    const-string v2, "PMP7170B3GCE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_39

    .line 124
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 125
    :cond_39
    const-string v2, "PMP7170B3G_DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 126
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 127
    :cond_3a
    const-string v2, "PMT7177B3G_DUO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 128
    invoke-static {}, Landroid/prestigio/update/UpdateApplication;->getInstance()Landroid/prestigio/update/UpdateApplication;

    move-result-object v2

    invoke-virtual {v2}, Landroid/prestigio/update/UpdateApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0
.end method
