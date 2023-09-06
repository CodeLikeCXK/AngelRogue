class ASMagicProjectile : AActor
{
    UPROPERTY(DefaultComponent,VisibleAnywhere)
    USphereComponent SphereComponent;

    UPROPERTY(DefaultComponent,VisibleAnywhere)
    UProjectileMovementComponent MovementComp;   

    UPROPERTY(DefaultComponent,VisibleAnywhere)
    UParticleSystemComponent EffectComp;   

    default SpawnCollisionHandlingMethod = ESpawnActorCollisionHandlingMethod::AlwaysSpawn;

    ASMagicProjectile()
    {
        //set collision object type
        SphereComponent.SetCollisionObjectType(ECollisionChannel::ECC_WorldDynamic);
        SphereComponent.SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
        SphereComponent.SetCollisionResponseToChannel(ECollisionChannel::ECC_Pawn,ECollisionResponse::ECR_Overlap);
    }


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {        

    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaTime)
    {        

    }
}