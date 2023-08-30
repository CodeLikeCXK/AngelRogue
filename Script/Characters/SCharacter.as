class ASCharacter: ACharacter
{
    UPROPERTY(DefaultComponent)
    UInputComponent ScriptInputComponent;

    UPROPERTY(DefaultComponent, EditAnywhere, Category = "Camera", Attach = CollisionCylinder)
    USpringArmComponent CameraBoom;
    // Set default values for subobjects with `default` statements
    // No need and no function of CreatedefaultSubObject
    
    UPROPERTY(DefaultComponent, EditAnywhere, Category = "Camera", Attach = CameraBoom)
    UCameraComponent Camera;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SetupPlayerInputComponent();
        

    }

    UFUNCTION()
    void SetupPlayerInputComponent()
    {
        // Set up some axis bindings to receive the values of control axes
        //  Note that these bindings consume the input and override any InputAxis nodes in the blueprint
        ScriptInputComponent.BindAxis(n"MoveForward", FInputAxisHandlerDynamicSignature(this, n"OnMoveForwardAxisChanged"));
        ScriptInputComponent.BindAxis(n"MoveRight", FInputAxisHandlerDynamicSignature(this, n"OnMoveRightAxisChanged"));
        ScriptInputComponent.BindAxis(n"TurnX", FInputAxisHandlerDynamicSignature(this, n"OnTurnXAxisChanged"));
        ScriptInputComponent.BindAxis(n"TurnY", FInputAxisHandlerDynamicSignature(this, n"OnTurnYAxisChanged"));
    }

    
    UFUNCTION()
    void OnMoveForwardAxisChanged(float32 AxisValue)
    {
       AddMovementInput(GetActorForwardVector(),AxisValue,false);
    }

    UFUNCTION()
    void OnMoveRightAxisChanged(float32 AxisValue)
    {
        AddMovementInput(GetActorRightVector(),AxisValue,false);

    }

    UFUNCTION()
    void OnTurnXAxisChanged(float32 AxisValue)
    {
        AddControllerYawInput(AxisValue);
    }

    UFUNCTION()
    void OnTurnYAxisChanged(float32 AxisValue)
    {
        AddControllerPitchInput(AxisValue);
    }



}