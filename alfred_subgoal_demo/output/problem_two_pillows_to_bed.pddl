
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
        RemoteControl_bar__plus_00_dot_20_bar__plus_00_dot_55_bar__plus_02_dot_10 - object
        CellPhone_bar__minus_01_dot_40_bar__plus_00_dot_45_bar__plus_03_dot_10 - object
        Pillow_bar__minus_01_dot_60_bar__plus_00_dot_45_bar__plus_02_dot_90 - object
        Pillow_bar__minus_02_dot_00_bar__plus_00_dot_78_bar__minus_00_dot_10 - object
        Towel_bar__plus_03_dot_40_bar__plus_00_dot_45_bar__minus_03_dot_40 - object
        Newspaper_bar__plus_01_dot_40_bar__plus_00_dot_65_bar__plus_02_dot_40 - object
        Book_bar__plus_00_dot_30_bar__plus_00_dot_55_bar__plus_01_dot_80 - object
        Bed_bar__plus_00_dot_00_bar__plus_00_dot_50_bar__plus_02_dot_00 - receptacle
        SideTable_bar__plus_01_dot_50_bar__plus_00_dot_60_bar__plus_02_dot_50 - receptacle
        Desk_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_00_dot_00 - receptacle
        Sofa_bar__minus_01_dot_50_bar__plus_00_dot_40_bar__plus_03_dot_00 - receptacle
        Drawer_bar__minus_02_dot_10_bar__plus_00_dot_50_bar__plus_00_dot_20 - receptacle
        GarbageCan_bar__plus_02_dot_00_bar__plus_00_dot_00_bar__minus_01_dot_00 - receptacle
        TowelHolder_bar__plus_03_dot_00_bar__plus_01_dot_20_bar__minus_02_dot_50 - receptacle
        BathtubBasin_bar__plus_03_dot_50_bar__plus_00_dot_40_bar__minus_03_dot_50 - receptacle
        loc_bar__minus_5_bar_10_bar_0_bar_30 - location
        loc_bar__minus_6_bar_0_bar_3_bar_30 - location
        loc_bar__minus_6_bar_1_bar_3_bar_60 - location
        loc_bar_0_bar_0_bar_0_bar_30 - location
        loc_bar_0_bar_6_bar_0_bar_30 - location
        loc_bar_11_bar__minus_8_bar_1_bar_0 - location
        loc_bar_12_bar__minus_11_bar_2_bar_30 - location
        loc_bar_5_bar_8_bar_1_bar_45 - location
        loc_bar_7_bar__minus_3_bar_1_bar_60 - location
    )
    (:init
        (= (totalCost) 0)
        (atLocation agent1 loc_bar_0_bar_0_bar_0_bar_30)
        (receptacleType Bed_bar__plus_00_dot_00_bar__plus_00_dot_50_bar__plus_02_dot_00 BedType)
        (receptacleAtLocation Bed_bar__plus_00_dot_00_bar__plus_00_dot_50_bar__plus_02_dot_00 loc_bar_0_bar_6_bar_0_bar_30)
        (receptacleType SideTable_bar__plus_01_dot_50_bar__plus_00_dot_60_bar__plus_02_dot_50 SideTableType)
        (receptacleAtLocation SideTable_bar__plus_01_dot_50_bar__plus_00_dot_60_bar__plus_02_dot_50 loc_bar_5_bar_8_bar_1_bar_45)
        (receptacleType Desk_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_00_dot_00 DeskType)
        (receptacleAtLocation Desk_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_00_dot_00 loc_bar__minus_6_bar_0_bar_3_bar_30)
        (receptacleType Sofa_bar__minus_01_dot_50_bar__plus_00_dot_40_bar__plus_03_dot_00 SofaType)
        (receptacleAtLocation Sofa_bar__minus_01_dot_50_bar__plus_00_dot_40_bar__plus_03_dot_00 loc_bar__minus_5_bar_10_bar_0_bar_30)
        (receptacleType Drawer_bar__minus_02_dot_10_bar__plus_00_dot_50_bar__plus_00_dot_20 DrawerType)
        (receptacleAtLocation Drawer_bar__minus_02_dot_10_bar__plus_00_dot_50_bar__plus_00_dot_20 loc_bar__minus_6_bar_1_bar_3_bar_60)
        (openable Drawer_bar__minus_02_dot_10_bar__plus_00_dot_50_bar__plus_00_dot_20)
        (receptacleType GarbageCan_bar__plus_02_dot_00_bar__plus_00_dot_00_bar__minus_01_dot_00 GarbageCanType)
        (receptacleAtLocation GarbageCan_bar__plus_02_dot_00_bar__plus_00_dot_00_bar__minus_01_dot_00 loc_bar_7_bar__minus_3_bar_1_bar_60)
        (receptacleType TowelHolder_bar__plus_03_dot_00_bar__plus_01_dot_20_bar__minus_02_dot_50 TowelHolderType)
        (receptacleAtLocation TowelHolder_bar__plus_03_dot_00_bar__plus_01_dot_20_bar__minus_02_dot_50 loc_bar_11_bar__minus_8_bar_1_bar_0)
        (receptacleType BathtubBasin_bar__plus_03_dot_50_bar__plus_00_dot_40_bar__minus_03_dot_50 BathtubBasinType)
        (receptacleAtLocation BathtubBasin_bar__plus_03_dot_50_bar__plus_00_dot_40_bar__minus_03_dot_50 loc_bar_12_bar__minus_11_bar_2_bar_30)
        (objectType RemoteControl_bar__plus_00_dot_20_bar__plus_00_dot_55_bar__plus_02_dot_10 RemoteControlType)
        (objectAtLocation RemoteControl_bar__plus_00_dot_20_bar__plus_00_dot_55_bar__plus_02_dot_10 loc_bar_0_bar_6_bar_0_bar_30)
        (inReceptacle RemoteControl_bar__plus_00_dot_20_bar__plus_00_dot_55_bar__plus_02_dot_10 Bed_bar__plus_00_dot_00_bar__plus_00_dot_50_bar__plus_02_dot_00)
        (objectType CellPhone_bar__minus_01_dot_40_bar__plus_00_dot_45_bar__plus_03_dot_10 CellPhoneType)
        (objectAtLocation CellPhone_bar__minus_01_dot_40_bar__plus_00_dot_45_bar__plus_03_dot_10 loc_bar__minus_5_bar_10_bar_0_bar_30)
        (inReceptacle CellPhone_bar__minus_01_dot_40_bar__plus_00_dot_45_bar__plus_03_dot_10 Sofa_bar__minus_01_dot_50_bar__plus_00_dot_40_bar__plus_03_dot_00)
        (objectType Pillow_bar__minus_01_dot_60_bar__plus_00_dot_45_bar__plus_02_dot_90 PillowType)
        (objectAtLocation Pillow_bar__minus_01_dot_60_bar__plus_00_dot_45_bar__plus_02_dot_90 loc_bar__minus_5_bar_10_bar_0_bar_30)
        (inReceptacle Pillow_bar__minus_01_dot_60_bar__plus_00_dot_45_bar__plus_02_dot_90 Sofa_bar__minus_01_dot_50_bar__plus_00_dot_40_bar__plus_03_dot_00)
        (objectType Pillow_bar__minus_02_dot_00_bar__plus_00_dot_78_bar__minus_00_dot_10 PillowType)
        (objectAtLocation Pillow_bar__minus_02_dot_00_bar__plus_00_dot_78_bar__minus_00_dot_10 loc_bar__minus_6_bar_0_bar_3_bar_30)
        (inReceptacle Pillow_bar__minus_02_dot_00_bar__plus_00_dot_78_bar__minus_00_dot_10 Desk_bar__minus_02_dot_00_bar__plus_00_dot_75_bar__plus_00_dot_00)
        (objectType Towel_bar__plus_03_dot_40_bar__plus_00_dot_45_bar__minus_03_dot_40 TowelType)
        (objectAtLocation Towel_bar__plus_03_dot_40_bar__plus_00_dot_45_bar__minus_03_dot_40 loc_bar_12_bar__minus_11_bar_2_bar_30)
        (inReceptacle Towel_bar__plus_03_dot_40_bar__plus_00_dot_45_bar__minus_03_dot_40 BathtubBasin_bar__plus_03_dot_50_bar__plus_00_dot_40_bar__minus_03_dot_50)
        (objectType Newspaper_bar__plus_01_dot_40_bar__plus_00_dot_65_bar__plus_02_dot_40 NewspaperType)
        (objectAtLocation Newspaper_bar__plus_01_dot_40_bar__plus_00_dot_65_bar__plus_02_dot_40 loc_bar_5_bar_8_bar_1_bar_45)
        (inReceptacle Newspaper_bar__plus_01_dot_40_bar__plus_00_dot_65_bar__plus_02_dot_40 SideTable_bar__plus_01_dot_50_bar__plus_00_dot_60_bar__plus_02_dot_50)
        (objectType Book_bar__plus_00_dot_30_bar__plus_00_dot_55_bar__plus_01_dot_80 BookType)
        (objectAtLocation Book_bar__plus_00_dot_30_bar__plus_00_dot_55_bar__plus_01_dot_80 loc_bar_0_bar_6_bar_0_bar_30)
        (inReceptacle Book_bar__plus_00_dot_30_bar__plus_00_dot_55_bar__plus_01_dot_80 Bed_bar__plus_00_dot_00_bar__plus_00_dot_50_bar__plus_02_dot_00)
        (= (distance loc_bar__minus_5_bar_10_bar_0_bar_30 loc_bar__minus_6_bar_0_bar_3_bar_30) 12)
        (= (distance loc_bar__minus_5_bar_10_bar_0_bar_30 loc_bar__minus_6_bar_1_bar_3_bar_60) 11)
        (= (distance loc_bar__minus_5_bar_10_bar_0_bar_30 loc_bar_0_bar_0_bar_0_bar_30) 16)
        (= (distance loc_bar__minus_5_bar_10_bar_0_bar_30 loc_bar_0_bar_6_bar_0_bar_30) 10)
        (= (distance loc_bar__minus_5_bar_10_bar_0_bar_30 loc_bar_11_bar__minus_8_bar_1_bar_0) 35)
        (= (distance loc_bar__minus_5_bar_10_bar_0_bar_30 loc_bar_12_bar__minus_11_bar_2_bar_30) 39)
        (= (distance loc_bar__minus_5_bar_10_bar_0_bar_30 loc_bar_5_bar_8_bar_1_bar_45) 13)
        (= (distance loc_bar__minus_5_bar_10_bar_0_bar_30 loc_bar_7_bar__minus_3_bar_1_bar_60) 26)
        (= (distance loc_bar__minus_6_bar_0_bar_3_bar_30 loc_bar__minus_5_bar_10_bar_0_bar_30) 12)
        (= (distance loc_bar__minus_6_bar_0_bar_3_bar_30 loc_bar__minus_6_bar_1_bar_3_bar_60) 2)
        (= (distance loc_bar__minus_6_bar_0_bar_3_bar_30 loc_bar_0_bar_0_bar_0_bar_30) 7)
        (= (distance loc_bar__minus_6_bar_0_bar_3_bar_30 loc_bar_0_bar_6_bar_0_bar_30) 13)
        (= (distance loc_bar__minus_6_bar_0_bar_3_bar_30 loc_bar_11_bar__minus_8_bar_1_bar_0) 26)
        (= (distance loc_bar__minus_6_bar_0_bar_3_bar_30 loc_bar_12_bar__minus_11_bar_2_bar_30) 30)
        (= (distance loc_bar__minus_6_bar_0_bar_3_bar_30 loc_bar_5_bar_8_bar_1_bar_45) 20)
        (= (distance loc_bar__minus_6_bar_0_bar_3_bar_30 loc_bar_7_bar__minus_3_bar_1_bar_60) 17)
        (= (distance loc_bar__minus_6_bar_1_bar_3_bar_60 loc_bar__minus_5_bar_10_bar_0_bar_30) 11)
        (= (distance loc_bar__minus_6_bar_1_bar_3_bar_60 loc_bar__minus_6_bar_0_bar_3_bar_30) 2)
        (= (distance loc_bar__minus_6_bar_1_bar_3_bar_60 loc_bar_0_bar_0_bar_0_bar_30) 8)
        (= (distance loc_bar__minus_6_bar_1_bar_3_bar_60 loc_bar_0_bar_6_bar_0_bar_30) 12)
        (= (distance loc_bar__minus_6_bar_1_bar_3_bar_60 loc_bar_11_bar__minus_8_bar_1_bar_0) 27)
        (= (distance loc_bar__minus_6_bar_1_bar_3_bar_60 loc_bar_12_bar__minus_11_bar_2_bar_30) 31)
        (= (distance loc_bar__minus_6_bar_1_bar_3_bar_60 loc_bar_5_bar_8_bar_1_bar_45) 19)
        (= (distance loc_bar__minus_6_bar_1_bar_3_bar_60 loc_bar_7_bar__minus_3_bar_1_bar_60) 18)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar__minus_5_bar_10_bar_0_bar_30) 16)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar__minus_6_bar_0_bar_3_bar_30) 7)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar__minus_6_bar_1_bar_3_bar_60) 8)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_0_bar_6_bar_0_bar_30) 7)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_11_bar__minus_8_bar_1_bar_0) 20)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_12_bar__minus_11_bar_2_bar_30) 24)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_5_bar_8_bar_1_bar_45) 14)
        (= (distance loc_bar_0_bar_0_bar_0_bar_30 loc_bar_7_bar__minus_3_bar_1_bar_60) 11)
        (= (distance loc_bar_0_bar_6_bar_0_bar_30 loc_bar__minus_5_bar_10_bar_0_bar_30) 10)
        (= (distance loc_bar_0_bar_6_bar_0_bar_30 loc_bar__minus_6_bar_0_bar_3_bar_30) 13)
        (= (distance loc_bar_0_bar_6_bar_0_bar_30 loc_bar__minus_6_bar_1_bar_3_bar_60) 12)
        (= (distance loc_bar_0_bar_6_bar_0_bar_30 loc_bar_0_bar_0_bar_0_bar_30) 7)
        (= (distance loc_bar_0_bar_6_bar_0_bar_30 loc_bar_11_bar__minus_8_bar_1_bar_0) 26)
        (= (distance loc_bar_0_bar_6_bar_0_bar_30 loc_bar_12_bar__minus_11_bar_2_bar_30) 30)
        (= (distance loc_bar_0_bar_6_bar_0_bar_30 loc_bar_5_bar_8_bar_1_bar_45) 8)
        (= (distance loc_bar_0_bar_6_bar_0_bar_30 loc_bar_7_bar__minus_3_bar_1_bar_60) 17)
        (= (distance loc_bar_11_bar__minus_8_bar_1_bar_0 loc_bar__minus_5_bar_10_bar_0_bar_30) 35)
        (= (distance loc_bar_11_bar__minus_8_bar_1_bar_0 loc_bar__minus_6_bar_0_bar_3_bar_30) 26)
        (= (distance loc_bar_11_bar__minus_8_bar_1_bar_0 loc_bar__minus_6_bar_1_bar_3_bar_60) 27)
        (= (distance loc_bar_11_bar__minus_8_bar_1_bar_0 loc_bar_0_bar_0_bar_0_bar_30) 20)
        (= (distance loc_bar_11_bar__minus_8_bar_1_bar_0 loc_bar_0_bar_6_bar_0_bar_30) 26)
        (= (distance loc_bar_11_bar__minus_8_bar_1_bar_0 loc_bar_12_bar__minus_11_bar_2_bar_30) 5)
        (= (distance loc_bar_11_bar__minus_8_bar_1_bar_0 loc_bar_5_bar_8_bar_1_bar_45) 23)
        (= (distance loc_bar_11_bar__minus_8_bar_1_bar_0 loc_bar_7_bar__minus_3_bar_1_bar_60) 10)
        (= (distance loc_bar_12_bar__minus_11_bar_2_bar_30 loc_bar__minus_5_bar_10_bar_0_bar_30) 39)
        (= (distance loc_bar_12_bar__minus_11_bar_2_bar_30 loc_bar__minus_6_bar_0_bar_3_bar_30) 30)
        (= (distance loc_bar_12_bar__minus_11_bar_2_bar_30 loc_bar__minus_6_bar_1_bar_3_bar_60) 31)
        (= (distance loc_bar_12_bar__minus_11_bar_2_bar_30 loc_bar_0_bar_0_bar_0_bar_30) 24)
        (= (distance loc_bar_12_bar__minus_11_bar_2_bar_30 loc_bar_0_bar_6_bar_0_bar_30) 30)
        (= (distance loc_bar_12_bar__minus_11_bar_2_bar_30 loc_bar_11_bar__minus_8_bar_1_bar_0) 5)
        (= (distance loc_bar_12_bar__minus_11_bar_2_bar_30 loc_bar_5_bar_8_bar_1_bar_45) 27)
        (= (distance loc_bar_12_bar__minus_11_bar_2_bar_30 loc_bar_7_bar__minus_3_bar_1_bar_60) 14)
        (= (distance loc_bar_5_bar_8_bar_1_bar_45 loc_bar__minus_5_bar_10_bar_0_bar_30) 13)
        (= (distance loc_bar_5_bar_8_bar_1_bar_45 loc_bar__minus_6_bar_0_bar_3_bar_30) 20)
        (= (distance loc_bar_5_bar_8_bar_1_bar_45 loc_bar__minus_6_bar_1_bar_3_bar_60) 19)
        (= (distance loc_bar_5_bar_8_bar_1_bar_45 loc_bar_0_bar_0_bar_0_bar_30) 14)
        (= (distance loc_bar_5_bar_8_bar_1_bar_45 loc_bar_0_bar_6_bar_0_bar_30) 8)
        (= (distance loc_bar_5_bar_8_bar_1_bar_45 loc_bar_11_bar__minus_8_bar_1_bar_0) 23)
        (= (distance loc_bar_5_bar_8_bar_1_bar_45 loc_bar_12_bar__minus_11_bar_2_bar_30) 27)
        (= (distance loc_bar_5_bar_8_bar_1_bar_45 loc_bar_7_bar__minus_3_bar_1_bar_60) 14)
        (= (distance loc_bar_7_bar__minus_3_bar_1_bar_60 loc_bar__minus_5_bar_10_bar_0_bar_30) 26)
        (= (distance loc_bar_7_bar__minus_3_bar_1_bar_60 loc_bar__minus_6_bar_0_bar_3_bar_30) 17)
        (= (distance loc_bar_7_bar__minus_3_bar_1_bar_60 loc_bar__minus_6_bar_1_bar_3_bar_60) 18)
        (= (distance loc_bar_7_bar__minus_3_bar_1_bar_60 loc_bar_0_bar_0_bar_0_bar_30) 11)
        (= (distance loc_bar_7_bar__minus_3_bar_1_bar_60 loc_bar_0_bar_6_bar_0_bar_30) 17)
        (= (distance loc_bar_7_bar__minus_3_bar_1_bar_60 loc_bar_11_bar__minus_8_bar_1_bar_0) 10)
        (= (distance loc_bar_7_bar__minus_3_bar_1_bar_60 loc_bar_12_bar__minus_11_bar_2_bar_30) 14)
        (= (distance loc_bar_7_bar__minus_3_bar_1_bar_60 loc_bar_5_bar_8_bar_1_bar_45) 14)
    )

                (:goal
                    (and
                        (exists (?r - receptacle)
                            (exists (?o1 - object)
                                (and 
                                    (objectType ?o1 PillowType) 
                                    (receptacleType ?r BedType)
                                    (inReceptacle ?o1 ?r)
                                    (exists (?o2 - object)
                                        (and
                                            (not (= ?o1 ?o2))
                                            (objectType ?o2 PillowType)
                                            (receptacleType ?r BedType)
                                            (inReceptacle ?o2 ?r) 
                                        )
                                    )
                                )
                            )
                        )
                        (forall (?re - receptacle)
                            (not (opened ?re))
                        )
                    )
                )
            )
            