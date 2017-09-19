.class public final enum Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
.super Ljava/lang/Enum;
.source "ApplicationPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/prestigio/update/preferences/ApplicationPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RebootMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

.field public static final enum REBOOT_MODE_1:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

.field public static final enum REBOOT_MODE_2:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

.field public static final enum REBOOT_MODE_3:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

.field public static final enum REBOOT_MODE_4:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

.field public static final enum REBOOT_MODE_5:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

.field public static final enum REBOOT_MODE_6:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

.field public static final enum REBOOT_MODE_NOT_DEFINED:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;


# instance fields
.field private mHttpValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 20
    new-instance v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    const-string v1, "REBOOT_MODE_1"

    const-string v2, "1"

    invoke-direct {v0, v1, v4, v2}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_1:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    new-instance v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    const-string v1, "REBOOT_MODE_2"

    const-string v2, "2"

    invoke-direct {v0, v1, v5, v2}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_2:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    new-instance v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    const-string v1, "REBOOT_MODE_3"

    const-string v2, "3"

    invoke-direct {v0, v1, v6, v2}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_3:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    new-instance v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    const-string v1, "REBOOT_MODE_4"

    const-string v2, "4"

    invoke-direct {v0, v1, v7, v2}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_4:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    new-instance v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    const-string v1, "REBOOT_MODE_5"

    const-string v2, "5"

    invoke-direct {v0, v1, v8, v2}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_5:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    new-instance v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    const-string v1, "REBOOT_MODE_6"

    const/4 v2, 0x5

    const-string v3, "6"

    invoke-direct {v0, v1, v2, v3}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_6:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    .line 21
    new-instance v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    const-string v1, "REBOOT_MODE_NOT_DEFINED"

    const/4 v2, 0x6

    const-string v3, ""

    invoke-direct {v0, v1, v2, v3}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_NOT_DEFINED:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    .line 19
    const/4 v0, 0x7

    new-array v0, v0, [Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    sget-object v1, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_1:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    aput-object v1, v0, v4

    sget-object v1, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_2:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    aput-object v1, v0, v5

    sget-object v1, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_3:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    aput-object v1, v0, v6

    sget-object v1, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_4:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    aput-object v1, v0, v7

    sget-object v1, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_5:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_6:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_NOT_DEFINED:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    aput-object v2, v0, v1

    sput-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->$VALUES:[Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .parameter
    .parameter
    .parameter "httpValue"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 23
    const-string v0, ""

    iput-object v0, p0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->mHttpValue:Ljava/lang/String;

    .line 26
    iput-object p3, p0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->mHttpValue:Ljava/lang/String;

    .line 27
    return-void
.end method

.method static synthetic access$000(Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    iget-object v0, p0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->mHttpValue:Ljava/lang/String;

    return-object v0
.end method

.method public static getRebootModeByHttpValue(Ljava/lang/String;)Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    .locals 5
    .parameter "httpValue"

    .prologue
    .line 30
    invoke-static {}, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->values()[Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 31
    .local v0, currRebootMode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    iget-object v4, v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->mHttpValue:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 35
    .end local v0           #currRebootMode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    :goto_1
    return-object v0

    .line 30
    .restart local v0       #currRebootMode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 35
    .end local v0           #currRebootMode:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    :cond_1
    sget-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->REBOOT_MODE_NOT_DEFINED:Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 19
    const-class v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    return-object v0
.end method

.method public static values()[Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->$VALUES:[Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    invoke-virtual {v0}, [Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;

    return-object v0
.end method


# virtual methods
.method public getHttpValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Landroid/prestigio/update/preferences/ApplicationPreferences$RebootMode;->mHttpValue:Ljava/lang/String;

    return-object v0
.end method
