class ASCharacter: ACharacter
{
    UPROPERTY(DefaultComponent)
    UInputComponent ScriptInputComponent;

    UPROPERTY(DefaultComponent, EditAnywhere, Category = "Camera", Attach = CollisionCylinder)
    USpringArmComponent CameraBoom;
    // Set default values for subobjects with `default` statements
    // No need and no function of CreatedefaultSubObject
    default CameraBoom.bUsePawnControlRotation = true;
    default bUseControllerRotationYaw = false;
    default CharacterMovement.bOrientRotationToMovement = true;
    
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
        ScriptInputComponent.BindAction(n"Jump", EInputEvent::IE_Pressed, FInputActionHandlerDynamicSignature(this, n"OnJumpPressed"));
        ScriptInputComponent.BindAction(n"Jump", EInputEvent::IE_Released, FInputActionHandlerDynamicSignature(this, n"OnJumpReleased"));

    }

    
    UFUNCTION()
    void OnMoveForwardAxisChanged(float32 AxisValue)
    {
        FRotator ControlRot = GetControlRotation();
        ControlRot.Pitch = 0.0f;
        ControlRot.Roll = 0.0f;
       AddMovementInput(ControlRot.Vector(),AxisValue,false);
    }

    UFUNCTION()
    void OnMoveRightAxisChanged(float32 AxisValue)
    {
        FRotator ControlRot = GetControlRotation();
        ControlRot.Pitch = 0.0f;
        ControlRot.Roll = 0.0f;
        AddMovementInput(ControlRot.GetRightVector(),AxisValue,false);

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

    UFUNCTION()
    void OnJumpPressed(FKey Key)
    {
        Print("Jump was pressed!", Duration=5.0);

        Jump();
    }

    UFUNCTION()
    void OnJumpReleased(FKey Key)
    {
        Print("Jump was released!", Duration=5.0);

        StopJumping();
    }



}