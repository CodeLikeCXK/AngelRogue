class AExplosiveObject : AActor
{
    UPROPERTY(DefaultComponent)
    UStaticMeshComponent MeshComp;

    UPROPERTY(DefaultComponent, EditAnywhere, Attach = MeshComp)
    URadialForceComponent ForceComp;

    default ForceComp.bImpulseVelChange = true;
    default ForceComp.bAutoActivate = false;

    AExplosiveObject()
    {
        MeshComp.OnComponentHit.AddUFunction(this, n"ExplosionComponentTriggered");
    }


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
         //one major difference between CPP and AngelScript
        //origin
        //https://github.com/Hazelight/UnrealEngine-Angelscript/blob/0494fe820173c86e971e2e441b22add7adf5e7f1/Script-Examples/Examples/Example_Overlaps.as#L35
        //https://github.com/tomlooman/ActionRoguelike/blob/master/Source/ActionRoguelike/Private/SExplosiveBarrel.cpp
        OnActorHit.AddUFunction(this, n"ExplosionTriggered");

    }

    UFUNCTION()
    void ExplosionTriggered(AActor SelfActor, AActor OtherActor, FVector NormalImpulse, FHitResult& Hit)
    {
        ForceComp.FireImpulse();

    }

    UFUNCTION()
    void ExplosionComponentTriggered(UPrimitiveComponent HitComponent, AActor OtherActor, UPrimitiveComponent OtherComp, FVector NormalImpulse, FHitResult&in Hit)
    {
        ForceComp.FireImpulse();
    }


        

}

 