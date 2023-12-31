.class public Lorg/codeaurora/ims/ImsScreenShareControllerImpl;
.super Lorg/codeaurora/ims/ImsScreenShareControllerBase;
.source "ImsScreenShareControllerImpl.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private volatile mScreenShareListener:Lorg/codeaurora/ims/internal/IImsScreenShareListener;

.field private mServiceSub:Lorg/codeaurora/ims/ImsServiceSub;

.field private final recipient:Landroid/os/IBinder$DeathRecipient;


# direct methods
.method static bridge synthetic -$$Nest$monClientDeath(Lorg/codeaurora/ims/ImsScreenShareControllerImpl;)V
    .locals 0

    invoke-direct {p0}, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->onClientDeath()V

    return-void
.end method

.method public constructor <init>(Lorg/codeaurora/ims/ImsServiceSub;Landroid/content/Context;)V
    .locals 1
    .param p1, "serviceSub"    # Lorg/codeaurora/ims/ImsServiceSub;
    .param p2, "context"    # Landroid/content/Context;

    .line 33
    invoke-virtual {p2}, Landroid/content/Context;->getMainExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/codeaurora/ims/ImsScreenShareControllerBase;-><init>(Ljava/util/concurrent/Executor;Landroid/content/Context;)V

    .line 25
    new-instance v0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl$1;

    invoke-direct {v0, p0}, Lorg/codeaurora/ims/ImsScreenShareControllerImpl$1;-><init>(Lorg/codeaurora/ims/ImsScreenShareControllerImpl;)V

    iput-object v0, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->recipient:Landroid/os/IBinder$DeathRecipient;

    .line 34
    iput-object p1, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->mServiceSub:Lorg/codeaurora/ims/ImsServiceSub;

    .line 35
    iput-object p2, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->mContext:Landroid/content/Context;

    .line 36
    return-void
.end method

.method private onClientDeath()V
    .locals 1

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->mScreenShareListener:Lorg/codeaurora/ims/internal/IImsScreenShareListener;

    .line 41
    return-void
.end method


# virtual methods
.method public onSetScreenShareListener(Lorg/codeaurora/ims/internal/IImsScreenShareListener;)V
    .locals 5
    .param p1, "listener"    # Lorg/codeaurora/ims/internal/IImsScreenShareListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->mServiceSub:Lorg/codeaurora/ims/ImsServiceSub;

    sget-object v1, Lorg/codeaurora/ims/DriverCallIms$State;->ACTIVE:Lorg/codeaurora/ims/DriverCallIms$State;

    .line 47
    invoke-virtual {v0, v1}, Lorg/codeaurora/ims/ImsServiceSub;->getCallSessionByState(Lorg/codeaurora/ims/DriverCallIms$State;)Ljava/util/List;

    move-result-object v0

    .line 49
    .local v0, "sessionList":Ljava/util/List;, "Ljava/util/List<Lorg/codeaurora/ims/ImsCallSessionImpl;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    const-string v1, "onSetScreenShareListener: no call is available"

    invoke-static {p0, v1}, Lcom/qualcomm/ims/utils/Log;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    return-void

    .line 54
    :cond_0
    iget-object v1, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->mScreenShareListener:Lorg/codeaurora/ims/internal/IImsScreenShareListener;

    .line 55
    .local v1, "intf":Lorg/codeaurora/ims/internal/IImsScreenShareListener;
    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 56
    invoke-interface {v1}, Lorg/codeaurora/ims/internal/IImsScreenShareListener;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    .line 57
    .local v3, "binder":Landroid/os/IBinder;
    iget-object v4, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->recipient:Landroid/os/IBinder$DeathRecipient;

    invoke-interface {v3, v4, v2}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 61
    .end local v3    # "binder":Landroid/os/IBinder;
    :cond_1
    if-eqz p1, :cond_2

    .line 62
    invoke-interface {p1}, Lorg/codeaurora/ims/internal/IImsScreenShareListener;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    .line 63
    .restart local v3    # "binder":Landroid/os/IBinder;
    iget-object v4, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->recipient:Landroid/os/IBinder$DeathRecipient;

    invoke-interface {v3, v4, v2}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 64
    .end local v3    # "binder":Landroid/os/IBinder;
    goto :goto_0

    .line 65
    :cond_2
    const-string v3, "Trying to set a NULL listener."

    invoke-static {p0, v3}, Lcom/qualcomm/ims/utils/Log;->w(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    :goto_0
    iput-object p1, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->mScreenShareListener:Lorg/codeaurora/ims/internal/IImsScreenShareListener;

    .line 69
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/codeaurora/ims/ImsCallSessionImpl;

    invoke-virtual {v2, p1}, Lorg/codeaurora/ims/ImsCallSessionImpl;->setScreenShareListener(Lorg/codeaurora/ims/internal/IImsScreenShareListener;)V

    .line 70
    return-void
.end method

.method public onStartScreenShare(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 74
    iget-object v0, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->mServiceSub:Lorg/codeaurora/ims/ImsServiceSub;

    sget-object v1, Lorg/codeaurora/ims/DriverCallIms$State;->ACTIVE:Lorg/codeaurora/ims/DriverCallIms$State;

    .line 75
    invoke-virtual {v0, v1}, Lorg/codeaurora/ims/ImsServiceSub;->getCallSessionByState(Lorg/codeaurora/ims/DriverCallIms$State;)Ljava/util/List;

    move-result-object v0

    .line 77
    .local v0, "sessionList":Ljava/util/List;, "Ljava/util/List<Lorg/codeaurora/ims/ImsCallSessionImpl;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 78
    const-string v1, "onStartScreenShare: no call is available"

    invoke-static {p0, v1}, Lcom/qualcomm/ims/utils/Log;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    return-void

    .line 82
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/codeaurora/ims/ImsCallSessionImpl;

    invoke-virtual {v1, p1, p2}, Lorg/codeaurora/ims/ImsCallSessionImpl;->startScreenShare(II)V

    .line 83
    return-void
.end method

.method public onStopScreenShare()V
    .locals 2

    .line 87
    iget-object v0, p0, Lorg/codeaurora/ims/ImsScreenShareControllerImpl;->mServiceSub:Lorg/codeaurora/ims/ImsServiceSub;

    sget-object v1, Lorg/codeaurora/ims/DriverCallIms$State;->ACTIVE:Lorg/codeaurora/ims/DriverCallIms$State;

    .line 88
    invoke-virtual {v0, v1}, Lorg/codeaurora/ims/ImsServiceSub;->getCallSessionByState(Lorg/codeaurora/ims/DriverCallIms$State;)Ljava/util/List;

    move-result-object v0

    .line 90
    .local v0, "sessionList":Ljava/util/List;, "Ljava/util/List<Lorg/codeaurora/ims/ImsCallSessionImpl;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 91
    const-string v1, "onStopScreenShare: no call is available"

    invoke-static {p0, v1}, Lcom/qualcomm/ims/utils/Log;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    return-void

    .line 94
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/codeaurora/ims/ImsCallSessionImpl;

    invoke-virtual {v1}, Lorg/codeaurora/ims/ImsCallSessionImpl;->stopScreenShare()V

    .line 95
    return-void
.end method
