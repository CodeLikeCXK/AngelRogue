class ASMagicProjectile : AActor
{
    UPROPERTY(DefaultComponent,VisibleAnywhere)
    USphereComponent SphereComponent;

    UPROPERTY(DefaultComponent,VisibleAnywhere)
    UProjectileMovementComponent MovementComp;   

    UPROPERTY(DefaultComponent,VisibleAnywhere)
    UParticleSystemComponent EffectComp;   

    default SpawnCollisionHandlingMethod = ESpawnActorCollisionHandlingMethod::AlwaysSpawn;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {        

    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaTime)
    {        

    }
}