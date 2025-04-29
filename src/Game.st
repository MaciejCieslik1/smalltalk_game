Object subclass: Game [
    | communicatesService |

    initializeGlobalObjects [
        self initializeLocations.
        self initializeItems.
        self initializeUniforms.
        self initializeCharacters.
        self initializeServiceClasses.
    ]

    initializeLocations [
        initializedArchives := Archives new
        Smalltalk at: #archives put: initializedArchives.
        initializedArmory := Armory new
        Smalltalk at: #armory put: initializedArmory.
        initializedBarracks := Barracks new
        Smalltalk at: #barracks put: initializedBarracks.
        initializedCafeteria := Cafeteria new
        Smalltalk at: #cafeteria put: initializedCafeteria.
        initializedCloakroom := Cloakroom new
        Smalltalk at: #cloakroom put: initializedCloakroom.
        initializedConferenceRoom := ConferenceRoom new
        Smalltalk at: #conferenceRoom put: initializedConferenceRoom.
        initializedEmptyRoomA := EmptyRoomA new
        Smalltalk at: #emptyRoomA put: initializedEmptyRoomA.
        initializedEmptyRoomB := EmptyRoomB new
        Smalltalk at: #emptyRoomB put: initializedEmptyRoomB.
        initializedEntrance := Entrance new
        Smalltalk at: #entrance put: initializedEntrance.
        initializedFoodStorage := FoodStorage new
        Smalltalk at: #foodStorage put: initializedFoodStorage.
        initializedFuhrersOffice := FuhrersOffice new
        Smalltalk at: #fuhrersOffice put: initializedFuhrersOffice.
        initializedFuhrersQuarters := FuhrersQuarters new
        Smalltalk at: #fuhrersQuarters put: initializedFuhrersQuarters.
        initializedGoebbelsOffice := GoebbelsOffice new
        Smalltalk at: #goebbelsOffice put: initializedGoebbelsOffice.
        initializedKitchen := Kitchen new
        Smalltalk at: #kitchen put: initializedKitchen.
        initializedKitchenExit := KitchenExit new
        Smalltalk at: #kitchenExit put: initializedKitchenExit.
        initializedLobby := Lobby new
        Smalltalk at: #lobby put: initializedLobby.
        initializedMedicBay := MedicBay new
        Smalltalk at: #medicBay put: initializedMedicBay.
        initializedNullRoom := NullRoom new
        Smalltalk at: #nullRoom put: initializedNullRoom.
        initializedSecretExit := SecretExit new
        Smalltalk at: #secretExit put: initializedSecretExit.
        initializedSecurityCheckEntry := SecurityCheckEntry new
        Smalltalk at: #securityCheckEntry put: initializedSecurityCheckEntry.
        initializedSecurityCheckOffices := SecurityCheckOffices new
        Smalltalk at: #securityCheckOffices put: initializedSecurityCheckOffices.
        initializedSocialRoom := SocialRoom new
        Smalltalk at: #socialRoom put: initializedSocialRoom.
    ]

    initializeItems [
        initializedAppleJuice := AppleJuice location new
        Smalltalk at: #appleJuice put: initializedAppleJuice.
        initializedOrangeJuice := OrangeJuice new
        Smalltalk at: #orangeJuice put: initializedOrangeJuice.
        initializedMultivitaminaJuice := MultivitaminaJuice new
        Smalltalk at: #multivitaminaJuice put: initializedMultivitaminaJuice.
        initializedBandage := Bandage new
        Smalltalk at: #bandage put: initializedBandage.
        initializedBaton := Baton new
        Smalltalk at: #baton put: initializedBaton.
        initializedBulletproofVest := BulletproofVest new
        Smalltalk at: #bulletproofVest put: initializedBulletproofVest.
        initializedChloroform := Chloroform new
        Smalltalk at: #chloroform put: initializedChloroform.
        initializedGun := Gun new
        Smalltalk at: #gun put: initializedGun.
        initializedHelmet := Helmet new
        Smalltalk at: #helmet put: initializedHelmet.
        initializedLetter := Letter new
        Smalltalk at: #letter put: initializedLetter.
        initializedLever := Lever new
        Smalltalk at: #lever put: initializedLever.
        initializedMoney := Money name: 'money' location: nil amount: 0
        Smalltalk at: #money put: initializedMoney.
        initializedMoneyMedicBay := Money name: 'money' location: medicBay amount: 250.
        Smalltalk at: #money1 put: initializedMoneyMedicBay.
        initializedMoneyKitchen := Money name: 'money' location: kitchens amount: 250.
        Smalltalk at: #money2 put: initializedMoneyKitchen.
        initializedMoneySocialRoom := Money name: 'money' location: socialRoom amount: 250.
        Smalltalk at: #money3 put: initializedMoneySocialRoom.
        initializedMoneyLobby := Money name: 'money' location: lobby amount: 250.
        Smalltalk at: #money4 put: initializedMoneyLobby.
        initializedPoison := Poison new.
        Smalltalk at: #poison put: initializedPoison.
        initializedRag := Rag new.
        Smalltalk at: #rag put: initializedRag.
        initializedUmbrella := Umbrella new.
        Smalltalk at: #umbrella put: initializedUmbrella.
        initializedVitamins := Vitamins new.
        Smalltalk at: #vitamins put: initializedVitamins.
    ]

    initializeUniforms [
        initializedMilitaryUniform := MilitaryUniform new
        Smalltalk at: #militaryUniform put: initializedMilitaryUniform.
        initializedServiceUniform := ServiceUniform new
        Smalltalk at: #serviceUniform put: initializedServiceUniform.
    ]

    initializeCharacters [
        initializedBandit := Bandit new
        Smalltalk at: #bandit put: initializedBandit.
        initializedChef := Chef new
        Smalltalk at: #chef put: initializedChef.
        initializedFuhrer := Fuhrer new
        Smalltalk at: #fuhrer put: initializedFuhrer.
        initializedGuard1 := Guard1 new
        Smalltalk at: #guard1 put: initializedGuard1.
        initializedGuard2 := Guard2 new
        Smalltalk at: #guard2 put: initializedGuard2.
        initializedGuard3 := Guard3 new
        Smalltalk at: #guard3 put: initializedGuard3.
        initializedGuard4 := Guard4 new
        Smalltalk at: #guard4 put: initializedGuard4.
        initializedHero := Hero new
        Smalltalk at: #hero put: initializedHero.
        initializedSalesman := Salesman new
        Smalltalk at: #salesman put: initializedSalesman.
        initializedSoldier := Soldier new
        Smalltalk at: #soldier put: initializedSoldier.
        initializedWaiter := Waiter new
        Smalltalk at: #waiter put: initializedWaiter.
    ]

    initializeServiceClasses [
        initializedActionListener := ActionListener new
        Smalltalk at: #actionListener put: initializedActionListener.
        initializedInputService := InputService new
        Smalltalk at: #inputService put: initializedInputService.
        initializedMap := Map new
        Smalltalk at: #map put: initializedMap.
        initializedMovement := Movement new
        Smalltalk at: #movement put: initializedMovement.
        initializedRoomService := RoomService new
        Smalltalk at: #roomService put: initializedRoomService.
    ]

    gameLoop [
        | hasHeroEscaped |
        hasHeroEscaped := false.
        [ hasHeroEscaped ] whileFalse: [
            actionListener chooseAction
        ].
        self ending
    ]

    ending [
        communicatesService thanks 
        communicatesService thanksForPlaying 
        communicatesService youWon 
        communicatesService typeQToExit 
    ]
]