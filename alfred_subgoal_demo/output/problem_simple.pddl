
(define (problem plan_demo)
    (:domain put_task)
    (:metric minimize (totalCost))
    (:objects
        agent1 - agent
        AlarmClock - object
        Apple - object
        BaseballBat - object
        BasketBall - object
        Bathtub - object
        Blinds - object
        Book - object
        Boots - object
        Bowl - object
        Box - object
        Bread - object
        ButterKnife - object
        CD - object
        Candle - object
        CellPhone - object
        Chair - object
        Cloth - object
        CreditCard - object
        Cup - object
        Curtains - object
        DeskLamp - object
        DishSponge - object
        Egg - object
        FloorLamp - object
        Footstool - object
        Fork - object
        Glassbottle - object
        HandTowel - object
        HousePlant - object
        Kettle - object
        KeyChain - object
        Knife - object
        Ladle - object
        Laptop - object
        LaundryHamperLid - object
        Lettuce - object
        LightSwitch - object
        Mirror - object
        Mug - object
        Newspaper - object
        Painting - object
        Pan - object
        PaperTowel - object
        PaperTowelRoll - object
        Pen - object
        Pencil - object
        PepperShaker - object
        Pillow - object
        Plate - object
        Plunger - object
        Poster - object
        Pot - object
        Potato - object
        RemoteControl - object
        SaltShaker - object
        ScrubBrush - object
        ShowerDoor - object
        ShowerGlass - object
        Sink - object
        SoapBar - object
        SoapBottle - object
        Spatula - object
        Spoon - object
        SprayBottle - object
        Statue - object
        StoveKnob - object
        TeddyBear - object
        Television - object
        TennisRacket - object
        TissueBox - object
        ToiletPaper - object
        ToiletPaperRoll - object
        Tomato - object
        Towel - object
        Vase - object
        Watch - object
        WateringCan - object
        Window - object
        WineBottle - object
        AlarmClockType - otype
        AppleType - otype
        BaseballBatType - otype
        BasketBallType - otype
        BathtubType - otype
        BlindsType - otype
        BookType - otype
        BootsType - otype
        BowlType - otype
        BoxType - otype
        BreadType - otype
        ButterKnifeType - otype
        CDType - otype
        CandleType - otype
        CellPhoneType - otype
        ChairType - otype
        ClothType - otype
        CreditCardType - otype
        CupType - otype
        CurtainsType - otype
        DeskLampType - otype
        DishSpongeType - otype
        EggType - otype
        FloorLampType - otype
        FootstoolType - otype
        ForkType - otype
        GlassbottleType - otype
        HandTowelType - otype
        HousePlantType - otype
        KettleType - otype
        KeyChainType - otype
        KnifeType - otype
        LadleType - otype
        LaptopType - otype
        LaundryHamperLidType - otype
        LettuceType - otype
        LightSwitchType - otype
        MirrorType - otype
        MugType - otype
        NewspaperType - otype
        PaintingType - otype
        PanType - otype
        PaperTowelType - otype
        PaperTowelRollType - otype
        PenType - otype
        PencilType - otype
        PepperShakerType - otype
        PillowType - otype
        PlateType - otype
        PlungerType - otype
        PosterType - otype
        PotType - otype
        PotatoType - otype
        RemoteControlType - otype
        SaltShakerType - otype
        ScrubBrushType - otype
        ShowerDoorType - otype
        ShowerGlassType - otype
        SinkType - otype
        SoapBarType - otype
        SoapBottleType - otype
        SpatulaType - otype
        SpoonType - otype
        SprayBottleType - otype
        StatueType - otype
        StoveKnobType - otype
        TeddyBearType - otype
        TelevisionType - otype
        TennisRacketType - otype
        TissueBoxType - otype
        ToiletPaperType - otype
        ToiletPaperRollType - otype
        TomatoType - otype
        TowelType - otype
        VaseType - otype
        WatchType - otype
        WateringCanType - otype
        WindowType - otype
        WineBottleType - otype
        ArmChairType - rtype
        BathtubBasinType - rtype
        BedType - rtype
        CabinetType - rtype
        CartType - rtype
        CoffeeMachineType - rtype
        CoffeeTableType - rtype
        CounterTopType - rtype
        DeskType - rtype
        DiningTableType - rtype
        DrawerType - rtype
        DresserType - rtype
        FridgeType - rtype
        GarbageCanType - rtype
        HandTowelHolderType - rtype
        LaundryHamperType - rtype
        MicrowaveType - rtype
        OttomanType - rtype
        PaintingHangerType - rtype
        SafeType - rtype
        ShelfType - rtype
        SideTableType - rtype
        SinkBasinType - rtype
        SofaType - rtype
        StoveBurnerType - rtype
        TVStandType - rtype
        ToasterType - rtype
        ToiletType - rtype
        ToiletPaperHangerType - rtype
        TowelHolderType - rtype
        Apple_bar__minus_02_dot_10_bar__plus_00_dot_80_bar__plus_01_dot_40 - object
        Tomato_bar__plus_01_dot_10_bar__plus_01_dot_00_bar__minus_01_dot_10 - object
        Mug_bar__plus_02_dot_40_bar__plus_00_dot_95_bar__plus_00_dot_40 - object
        Pencil_bar__minus_01_dot_90_bar__plus_00_dot_80_bar__plus_01_dot_60 - object
        Knife_bar__plus_00_dot_90_bar__plus_00_dot_97_bar__minus_00_dot_90 - object
        Egg_bar__minus_01_dot_40_bar__plus_00_dot_60_bar__minus_02_dot_40 - object
        Egg_bar__minus_01_dot_60_bar__plus_00_dot_60_bar__minus_02_dot_40 - object
        FloorLamp_bar__minus_03_dot_20_bar__plus_00_dot_00_bar__plus_02_dot_00 - object
        CounterTop_bar__plus_01_dot_00_bar__plus_00_dot_95_bar__minus_01_dot_00 - receptacle
        DiningTable_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_01_dot_50 - receptacle
        Microwave_bar__plus_01_dot_50_bar__plus_01_dot_20_bar__minus_02_dot_00 - receptacle
        Fridge_bar__minus_01_dot_50_bar__plus_00_dot_00_bar__minus_02_dot_50 - receptacle
        SinkBasin_bar__plus_02_dot_50_bar__plus_00_dot_90_bar__plus_00_dot_50 - receptacle
        Cabinet_bar__plus_02_dot_00_bar__plus_01_dot_80_bar__minus_01_dot_50 - receptacle
        Shelf_bar__minus_03_dot_00_bar__plus_01_dot_20_bar__minus_00_dot_50 - receptacle
        loc_bar__minus_10_bar__minus_2_bar_3_bar_30 - location
        loc_bar__minus_11_bar_7_bar_0_bar_0 - location
        loc_bar__minus_5_bar__minus_8_bar_2_bar_30 - location
        loc_bar__minus_6_bar_5_bar_3_bar_45 - location
        loc_bar_0_bar_0_bar_0_bar_30 - location
        loc_bar_4_bar__minus_3_bar_1_bar_45 - location
        loc_bar_6_bar__minus_7_bar_2_bar_0 - location
        loc_bar_7_bar__minus_5_bar_1_bar_0 - location
        loc_bar_9_bar_2_bar_1_bar_60 - location
    )
    (:init
        (= (totalCost) 0)
        (atLocation agent1 loc_bar_0_bar_0_bar_0_bar_30)
        (receptacleType CounterTop_bar__plus_01_dot_00_bar__plus_00_dot_95_bar__minus_01_dot_00 CounterTopType)
        (receptacleAtLocation CounterTop_bar__plus_01_dot_00_bar__plus_00_dot_95_bar__minus_01_dot_00 loc_bar_4_bar__minus_3_bar_1_bar_45)
        (receptacleType DiningTable_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_01_dot_50 DiningTableType)
        (receptacleAtLocation DiningTable_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_01_dot_50 loc_bar__minus_6_bar_5_bar_3_bar_45)
        (receptacleType Microwave_bar__plus_01_dot_50_bar__plus_01_dot_20_bar__minus_02_dot_00 MicrowaveType)
        (receptacleAtLocation Microwave_bar__plus_01_dot_50_bar__plus_01_dot_20_bar__minus_02_dot_00 loc_bar_6_bar__minus_7_bar_2_bar_0)
        (openable Microwave_bar__plus_01_dot_50_bar__plus_01_dot_20_bar__minus_02_dot_00)
        (receptacleType Fridge_bar__minus_01_dot_50_bar__plus_00_dot_00_bar__minus_02_dot_50 FridgeType)
        (receptacleAtLocation Fridge_bar__minus_01_dot_50_bar__plus_00_dot_00_bar__minus_02_dot_50 loc_bar__minus_5_bar__minus_8_bar_2_bar_30)
        (openable Fridge_bar__minus_01_dot_50_bar__plus_00_dot_00_bar__minus_02_dot_50)
        (receptacleType SinkBasin_bar__plus_02_dot_50_bar__plus_00_dot_90_bar__plus_00_dot_50 SinkBasinType)
        (receptacleAtLocation SinkBasin_bar__plus_02_dot_50_bar__plus_00_dot_90_bar__plus_00_dot_50 loc_bar_9_bar_2_bar_1_bar_60)
        (receptacleType Cabinet_bar__plus_02_dot_00_bar__plus_01_dot_80_bar__minus_01_dot_50 CabinetType)
        (receptacleAtLocation Cabinet_bar__plus_02_dot_00_bar__plus_01_dot_80_bar__minus_01_dot_50 loc_bar_7_bar__minus_5_bar_1_bar_0)
        (openable Cabinet_bar__plus_02_dot_00_bar__plus_01_dot_80_bar__minus_01_dot_50)
        (receptacleType Shelf_bar__minus_03_dot_00_bar__plus_01_dot_20_bar__minus_00_dot_50 ShelfType)
        (receptacleAtLocation Shelf_bar__minus_03_dot_00_bar__plus_01_dot_20_bar__minus_00_dot_50 loc_bar__minus_10_bar__minus_2_bar_3_bar_30)
        (objectType Apple_bar__minus_02_dot_10_bar__plus_00_dot_80_bar__plus_01_dot_40 AppleType)
        (objectAtLocation Apple_bar__minus_02_dot_10_bar__plus_00_dot_80_bar__plus_01_dot_40 loc_bar__minus_6_bar_5_bar_3_bar_45)
        (inReceptacle Apple_bar__minus_02_dot_10_bar__plus_00_dot_80_bar__plus_01_dot_40 DiningTable_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_01_dot_50)
        (cleanable Apple_bar__minus_02_dot_10_bar__plus_00_dot_80_bar__plus_01_dot_40)
        (heatable Apple_bar__minus_02_dot_10_bar__plus_00_dot_80_bar__plus_01_dot_40)
        (coolable Apple_bar__minus_02_dot_10_bar__plus_00_dot_80_bar__plus_01_dot_40)
        (sliceable Apple_bar__minus_02_dot_10_bar__plus_00_dot_80_bar__plus_01_dot_40)
        (objectType Tomato_bar__plus_01_dot_10_bar__plus_01_dot_00_bar__minus_01_dot_10 TomatoType)
        (objectAtLocation Tomato_bar__plus_01_dot_10_bar__plus_01_dot_00_bar__minus_01_dot_10 loc_bar_4_bar__minus_3_bar_1_bar_45)
        (inReceptacle Tomato_bar__plus_01_dot_10_bar__plus_01_dot_00_bar__minus_01_dot_10 CounterTop_bar__plus_01_dot_00_bar__plus_00_dot_95_bar__minus_01_dot_00)
        (cleanable Tomato_bar__plus_01_dot_10_bar__plus_01_dot_00_bar__minus_01_dot_10)
        (heatable Tomato_bar__plus_01_dot_10_bar__plus_01_dot_00_bar__minus_01_dot_10)
        (coolable Tomato_bar__plus_01_dot_10_bar__plus_01_dot_00_bar__minus_01_dot_10)
        (sliceable Tomato_bar__plus_01_dot_10_bar__plus_01_dot_00_bar__minus_01_dot_10)
        (objectType Mug_bar__plus_02_dot_40_bar__plus_00_dot_95_bar__plus_00_dot_40 MugType)
        (objectAtLocation Mug_bar__plus_02_dot_40_bar__plus_00_dot_95_bar__plus_00_dot_40 loc_bar_9_bar_2_bar_1_bar_60)
        (inReceptacle Mug_bar__plus_02_dot_40_bar__plus_00_dot_95_bar__plus_00_dot_40 SinkBasin_bar__plus_02_dot_50_bar__plus_00_dot_90_bar__plus_00_dot_50)
        (cleanable Mug_bar__plus_02_dot_40_bar__plus_00_dot_95_bar__plus_00_dot_40)
        (heatable Mug_bar__plus_02_dot_40_bar__plus_00_dot_95_bar__plus_00_dot_40)
        (coolable Mug_bar__plus_02_dot_40_bar__plus_00_dot_95_bar__plus_00_dot_40)
        (objectType Pencil_bar__minus_01_dot_90_bar__plus_00_dot_80_bar__plus_01_dot_60 PencilType)
        (objectAtLocation Pencil_bar__minus_01_dot_90_bar__plus_00_dot_80_bar__plus_01_dot_60 loc_bar__minus_6_bar_5_bar_3_bar_45)
        (inReceptacle Pencil_bar__minus_01_dot_90_bar__plus_00_dot_80_bar__plus_01_dot_60 DiningTable_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_01_dot_50)
        (objectType Knife_bar__plus_00_dot_90_bar__plus_00_dot_97_bar__minus_00_dot_90 KnifeType)
        (objectAtLocation Knife_bar__plus_00_dot_90_bar__plus_00_dot_97_bar__minus_00_dot_90 loc_bar_4_bar__minus_3_bar_1_bar_45)
        (inReceptacle Knife_bar__plus_00_dot_90_bar__plus_00_dot_97_bar__minus_00_dot_90 CounterTop_bar__plus_01_dot_00_bar__plus_00_dot_95_bar__minus_01_dot_00)
        (cleanable Knife_bar__plus_00_dot_90_bar__plus_00_dot_97_bar__minus_00_dot_90)
        (objectType Egg_bar__minus_01_dot_40_bar__plus_00_dot_60_bar__minus_02_dot_40 EggType)
        (objectAtLocation Egg_bar__minus_01_dot_40_bar__plus_00_dot_60_bar__minus_02_dot_40 loc_bar__minus_5_bar__minus_8_bar_2_bar_30)
        (inReceptacle Egg_bar__minus_01_dot_40_bar__plus_00_dot_60_bar__minus_02_dot_40 Fridge_bar__minus_01_dot_50_bar__plus_00_dot_00_bar__minus_02_dot_50)
        (cleanable Egg_bar__minus_01_dot_40_bar__plus_00_dot_60_bar__minus_02_dot_40)
        (heatable Egg_bar__minus_01_dot_40_bar__plus_00_dot_60_bar__minus_02_dot_40)
        (coolable Egg_bar__minus_01_dot_40_bar__plus_00_dot_60_bar__minus_02_dot_40)
        (sliceable Egg_bar__minus_01_dot_40_bar__plus_00_dot_60_bar__minus_02_dot_40)
        (objectType Egg_bar__minus_01_dot_60_bar__plus_00_dot_60_bar__minus_02_dot_40 EggType)
        (objectAtLocation Egg_bar__minus_01_dot_60_bar__plus_00_dot_60_bar__minus_02_dot_40 loc_bar__minus_5_bar__minus_8_bar_2_bar_30)
        (inReceptacle Egg_bar__minus_01_dot_60_bar__plus_00_dot_60_bar__minus_02_dot_40 Fridge_bar__minus_01_dot_50_bar__plus_00_dot_00_bar__minus_02_dot_50)
        (cleanable Egg_bar__minus_01_dot_60_bar__plus_00_dot_60_bar__minus_02_dot_40)
        (heatable Egg_bar__minus_01_dot_60_bar__plus_00_dot_60_bar__minus_02_dot_40)
        (coolable Egg_bar__minus_01_dot_60_bar__plus_00_dot_60_bar__minus_02_dot_40)
        (sliceable Egg_bar__minus_01_dot_60_bar__plus_00_dot_60_bar__minus_02_dot_40)
        (objectType FloorLamp_bar__minus_03_dot_20_bar__plus_00_dot_00_bar__plus_02_dot_00 FloorLampType)
        (objectAtLocation FloorLamp_bar__minus_03_dot_20_bar__plus_00_dot_00_bar__plus_02_dot_00 loc_bar__minus_11_bar_7_bar_0_bar_0)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_3_bar_30 loc_bar__minus_11_bar_7_bar_0_bar_0) 11)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_3_bar_30 loc_bar__minus_5_bar__minus_8_bar_2_bar_30) 12)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_3_bar_30 loc_bar__minus_6_bar_5_bar_3_bar_45) 12)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_3_bar_30 loc_bar_0_bar_0_bar_0_bar_30) 13)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_3_bar_30 loc_bar_4_bar__minus_3_bar_1_bar_45) 16)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_3_bar_30 loc_bar_6_bar__minus_7_bar_2_bar_0) 22)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_3_bar_30 loc_bar_7_bar__minus_5_bar_1_bar_0) 21)
        (= (distance loc_bar__minus_10_bar__minus_2_bar_3_bar_30 loc_bar_9_bar_2_bar_1_bar_60) 24)
        (= (distance loc_bar__minus_11_bar_7_bar_0_bar_0 loc_bar__minus_10_bar__minus_2_bar_3_bar_30) 11)
        (= (distance loc_bar__minus_11_bar_7_bar_0_bar_0 loc_bar__minus_5_bar__minus_8_bar_2_bar_30) 22)
        (= (distance loc_bar__minus_11_bar_7_bar_0_bar_0 loc_bar__minus_6_bar_5_bar_3_bar_45) 8)
        (= (distance loc_bar__minus_11_bar_7_bar_0_bar_0 loc_bar_0_bar_0_bar_0_bar_30) 19)
        (= (distance loc_bar__minus_11_bar_7_bar_0_bar_0 loc_bar_4_bar__minus_3_bar_1_bar_45) 26)
        (= (distance loc_bar__minus_11_bar_7_bar_0_bar_0 loc_bar_6_bar__minus_7_bar_2_bar_0) 32)
        (= (distance loc_bar__minus_11_bar_7_bar_0_bar_0 loc_bar_7_bar__minus_5_bar_1_bar_0) 31)
        (= (distance loc_bar__minus_11_bar_7_bar_0_bar_0 loc_bar_9_bar_2_bar_1_bar_60) 26)
        (= (distance loc_bar__minus_5_bar__minus_8_bar_2_bar_30 loc_bar__minus_10_bar__minus_2_bar_3_bar_30) 12)
        (= (distance loc_bar__minus_5_bar__minus_8_bar_2_bar_30 loc_bar__minus_11_bar_7_bar_0_bar_0) 22)
        (= (distance loc_bar__minus_5_bar__minus_8_bar_2_bar_30 loc_bar__minus_6_bar_5_bar_3_bar_45) 15)
        (= (distance loc_bar__minus_5_bar__minus_8_bar_2_bar_30 loc_bar_0_bar_0_bar_0_bar_30) 14)
        (= (distance loc_bar__minus_5_bar__minus_8_bar_2_bar_30 loc_bar_4_bar__minus_3_bar_1_bar_45) 15)
        (= (distance loc_bar__minus_5_bar__minus_8_bar_2_bar_30 loc_bar_6_bar__minus_7_bar_2_bar_0) 13)
        (= (distance loc_bar__minus_5_bar__minus_8_bar_2_bar_30 loc_bar_7_bar__minus_5_bar_1_bar_0) 16)
        (= (distance loc_bar__minus_5_bar__minus_8_bar_2_bar_30 loc_bar_9_bar_2_bar_1_bar_60) 25)
        (= (distance loc_bar__minus_6_bar_5_bar_3_bar_45 loc_bar__minus_10_bar__minus_2_bar_3_bar_30) 12)
        (= (distance loc_bar__minus_6_bar_5_bar_3_bar_45 loc_bar__minus_11_bar_7_bar_0_bar_0) 8)
        (= (distance loc_bar__minus_6_bar_5_bar_3_bar_45 loc_bar__minus_5_bar__minus_8_bar_2_bar_30) 15)
        (= (distance loc_bar__minus_6_bar_5_bar_3_bar_45 loc_bar_0_bar_0_bar_0_bar_30) 12)
        (= (distance loc_bar__minus_6_bar_5_bar_3_bar_45 loc_bar_4_bar__minus_3_bar_1_bar_45) 19)
        (= (distance loc_bar__minus_6_bar_5_bar_3_bar_45 loc_bar_6_bar__minus_7_bar_2_bar_0) 25)
        (= (distance loc_bar__minus_6_bar_5_bar_3_bar_45 loc_bar_7_bar__minus_5_bar_1_bar_0) 24)
        (= (distance loc_bar__minus_6_bar_5_bar_3_bar_45 loc_bar_9_bar_2_bar_1_bar_60) 19)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar__minus_10_bar__minus_2_bar_3_bar_30) 13)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar__minus_11_bar_7_bar_0_bar_0) 19)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar__minus_5_bar__minus_8_bar_2_bar_30) 14)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar__minus_6_bar_5_bar_3_bar_45) 12)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_4_bar__minus_3_bar_1_bar_45) 8)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_6_bar__minus_7_bar_2_bar_0) 14)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_7_bar__minus_5_bar_1_bar_0) 13)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_9_bar_2_bar_1_bar_60) 12)
        (= (distance loc_bar_4_bar__minus_3_bar_1_bar_45 loc_bar__minus_10_bar__minus_2_bar_3_bar_30) 16)
        (= (distance loc_bar_4_bar__minus_3_bar_1_bar_45 loc_bar__minus_11_bar_7_bar_0_bar_0) 26)
        (= (distance loc_bar_4_bar__minus_3_bar_1_bar_45 loc_bar__minus_5_bar__minus_8_bar_2_bar_30) 15)
        (= (distance loc_bar_4_bar__minus_3_bar_1_bar_45 loc_bar__minus_6_bar_5_bar_3_bar_45) 19)
        (= (distance loc_bar_4_bar__minus_3_bar_1_bar_45 loc_bar_0_bar_0_bar_0_bar_30) 8)
        (= (distance loc_bar_4_bar__minus_3_bar_1_bar_45 loc_bar_6_bar__minus_7_bar_2_bar_0) 7)
        (= (distance loc_bar_4_bar__minus_3_bar_1_bar_45 loc_bar_7_bar__minus_5_bar_1_bar_0) 6)
        (= (distance loc_bar_4_bar__minus_3_bar_1_bar_45 loc_bar_9_bar_2_bar_1_bar_60) 11)
        (= (distance loc_bar_6_bar__minus_7_bar_2_bar_0 loc_bar__minus_10_bar__minus_2_bar_3_bar_30) 22)
        (= (distance loc_bar_6_bar__minus_7_bar_2_bar_0 loc_bar__minus_11_bar_7_bar_0_bar_0) 32)
        (= (distance loc_bar_6_bar__minus_7_bar_2_bar_0 loc_bar__minus_5_bar__minus_8_bar_2_bar_30) 13)
        (= (distance loc_bar_6_bar__minus_7_bar_2_bar_0 loc_bar__minus_6_bar_5_bar_3_bar_45) 25)
        (= (distance loc_bar_6_bar__minus_7_bar_2_bar_0 loc_bar_0_bar_0_bar_0_bar_30) 14)
        (= (distance loc_bar_6_bar__minus_7_bar_2_bar_0 loc_bar_4_bar__minus_3_bar_1_bar_45) 7)
        (= (distance loc_bar_6_bar__minus_7_bar_2_bar_0 loc_bar_7_bar__minus_5_bar_1_bar_0) 4)
        (= (distance loc_bar_6_bar__minus_7_bar_2_bar_0 loc_bar_9_bar_2_bar_1_bar_60) 13)
        (= (distance loc_bar_7_bar__minus_5_bar_1_bar_0 loc_bar__minus_10_bar__minus_2_bar_3_bar_30) 21)
        (= (distance loc_bar_7_bar__minus_5_bar_1_bar_0 loc_bar__minus_11_bar_7_bar_0_bar_0) 31)
        (= (distance loc_bar_7_bar__minus_5_bar_1_bar_0 loc_bar__minus_5_bar__minus_8_bar_2_bar_30) 16)
        (= (distance loc_bar_7_bar__minus_5_bar_1_bar_0 loc_bar__minus_6_bar_5_bar_3_bar_45) 24)
        (= (distance loc_bar_7_bar__minus_5_bar_1_bar_0 loc_bar_0_bar_0_bar_0_bar_30) 13)
        (= (distance loc_bar_7_bar__minus_5_bar_1_bar_0 loc_bar_4_bar__minus_3_bar_1_bar_45) 6)
        (= (distance loc_bar_7_bar__minus_5_bar_1_bar_0 loc_bar_6_bar__minus_7_bar_2_bar_0) 4)
        (= (distance loc_bar_7_bar__minus_5_bar_1_bar_0 loc_bar_9_bar_2_bar_1_bar_60) 10)
        (= (distance loc_bar_9_bar_2_bar_1_bar_60 loc_bar__minus_10_bar__minus_2_bar_3_bar_30) 24)
        (= (distance loc_bar_9_bar_2_bar_1_bar_60 loc_bar__minus_11_bar_7_bar_0_bar_0) 26)
        (= (distance loc_bar_9_bar_2_bar_1_bar_60 loc_bar__minus_5_bar__minus_8_bar_2_bar_30) 25)
        (= (distance loc_bar_9_bar_2_bar_1_bar_60 loc_bar__minus_6_bar_5_bar_3_bar_45) 19)
        (= (distance loc_bar_9_bar_2_bar_1_bar_60 loc_bar_0_bar_0_bar_0_bar_30) 12)
        (= (distance loc_bar_9_bar_2_bar_1_bar_60 loc_bar_4_bar__minus_3_bar_1_bar_45) 11)
        (= (distance loc_bar_9_bar_2_bar_1_bar_60 loc_bar_6_bar__minus_7_bar_2_bar_0) 13)
        (= (distance loc_bar_9_bar_2_bar_1_bar_60 loc_bar_7_bar__minus_5_bar_1_bar_0) 10)
    )

        (:goal
            (and
                (exists (?r - receptacle)
                    (exists (?o - object)
                        (and 
                            (inReceptacle ?o ?r) 
                            (objectType ?o TomatoType) 
                            (receptacleType ?r DiningTableType)
                        )
                    )
                )
                (forall (?re - receptacle)
                    (not (opened ?re))
                )
            )
        )
    )
    