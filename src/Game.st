Object subclass: Game [
    | communicatesService archives armory barracks cafeteria cloakroom conferenceRoom emptyRoomA emptyRoomB entrance foodStorage |
    |  fuhrersOffice fuhrersQuarters goebbelsOffice kitchen kitchenExit lobby medicBay nullRoom secretExit securityCheckEntry passage |
    |  securityCheckOffices socialRoom appleJuice orangeJuice multivitaminaJuice bandage baton bulletproofVest chloroform gun helmet |
    |  letter lever money moneyMedicBay moneyKitchen moneySocialRoom moneyLobby poison rag umbrella vitamins militaryUniform |
    |  serviceUniform bandit chef fuhrer guard1 guard2 guard3 guard4 hero salesman soldier waiter actionListener inputService map |
    |  movement roomService |

    initializeFields [
        self initializeCommunicationService.
        self initializeLocations.
        self initializeItems.
        self initializeUniforms.
        self initializeCharacters.
        self initializeServiceClasses.
    ]

    initializeCommunicationService [
        communicatesService := CommunicatesService new.
        inputService := InputService newInitialize: communicatesService.
    ]

    initializeLocations [
        archives := Archives new.
        archives initialize: communicatesService inputService: inputService.
        armory := Armory newInitialize.
        barracks := Barracks newInitialize.
        cafeteria := Cafeteria newInitialize.
        cloakroom := Cloakroom newInitialize.
        conferenceRoom := ConferenceRoom newInitialize.
        emptyRoomA := EmptyRoomA newInitialize.
        emptyRoomB := EmptyRoomB newInitialize.
        entrance := Entrance newInitialize.
        foodStorage := FoodStorage newInitialize.
        fuhrersOffice := FuhrersOffice newInitialize.
        fuhrersQuarters := FuhrersQuarters newInitialize.
        goebbelsOffice := GoebbelsOffice newInitialize.
        kitchen := Kitchen newInitialize.
        kitchenExit := KitchenExit newInitialize.
        lobby := Lobby newInitialize.
        medicBay := MedicBay newInitialize.
        nullRoom := NullRoom newInitialize.
        secretExit := SecretExit newInitialize.
        securityCheckEntry := SecurityCheckEntry newInitialize.
        securityCheckOffices := SecurityCheckOffices newInitialize.
        socialRoom := SocialRoom newInitialize.
        passage := Passage newInitialize.

        self initializeAdjacentRooms.
    ]

    initializeAdjacentRooms [
        archives addAdjacentRooms: nullRoom west: nullRoom south: securityCheckOffices east: nullRoom.
        barracks addAdjacentRooms: nullRoom west: nullRoom south: socialRoom east: nullRoom. 
        cafeteria addAdjacentRooms: socialRoom west: emptyRoomA south: medicBay east: kitchen.
        cloakroom addAdjacentRooms: emptyRoomA west: nullRoom south: securityCheckEntry east: nullRoom. 
        conferenceRoom addAdjacentRooms: goebbelsOffice west: fuhrersOffice south: nullRoom east: securityCheckOffices. 
        emptyRoomA addAdjacentRooms: nullRoom west: nullRoom south: securityCheckOffices east: nullRoom. 
        emptyRoomB addAdjacentRooms: fuhrersOffice west: nullRoom south: nullRoom east: passage. 
        entrance addAdjacentRooms: nullRoom west: nullRoom south: nullRoom east: securityCheckEntry. 
        foodStorage addAdjacentRooms: nullRoom west: nullRoom south: kitchen east: kitchenExit. 
        fuhrersOffice addAdjacentRooms: fuhrersQuarters west: nullRoom south: emptyRoomB east: conferenceRoom. 
        fuhrersQuarters addAdjacentRooms: nullRoom west: secretExit south: fuhrersOffice east: nullRoom. 
        goebbelsOffice addAdjacentRooms: nullRoom west: nullRoom south: conferenceRoom east: nullRoom. 
        kitchen addAdjacentRooms: foodStorage west: cafeteria south: nullRoom east: nullRoom. 
        kitchenExit addAdjacentRooms: nullRoom west: foodStorage south: nullRoom east: nullRoom. 
        lobby addAdjacentRooms: securityCheckOffices west: passage south: cloakroom east: cafeteria. 
        medicBay addAdjacentRooms: cafeteria west: nullRoom south: nullRoom east: nullRoom. 
        secretExit addAdjacentRooms: nullRoom west: nullRoom south: nullRoom east: fuhrersQuarters. 
        securityCheckEntry addAdjacentRooms: cloakroom west: entrance south: nullRoom east: armory. 
        securityCheckOffices addAdjacentRooms: archives west: conferenceRoom south: lobby east: nullRoom. 
        socialRoom addAdjacentRooms: barracks west: lobby south: cafeteria east: nullRoom.  
        passage addAdjacentRooms: nullRoom west: emptyRoomB south: nullRoom east: lobby.  
    ]

    initializeItems [
        appleJuice := AppleJuice newInitialize: cafeteria.
        orangeJuice := OrangeJuice newInitialize: cafeteria.
        multivitaminaJuice := MultivitaminaJuice newInitialize: cafeteria.
        bandage := Bandage newInitialize: medicBay.
        baton := Baton newInitialize: barracks.
        bulletproofVest := BulletproofVest newInitialize.
        chloroform := Chloroform newInitialize: medicBay.
        gun := Gun newInitialize.
        helmet := Helmet newInitialize.
        letter := Letter newInitialize: goebbelsOffice.
        lever := Lever newInitialize: archives.
        money := Money newInitialize: nil amount: 0.
        moneyMedicBay := Money newInitialize: medicBay amount: 250.
        moneyKitchen := Money newInitialize: kitchen amount: 250.
        moneySocialRoom := Money newInitialize: socialRoom amount: 250.
        moneyLobby := Money newInitialize: lobby amount: 250.
        poison := Poison newInitialize: foodStorage.
        rag := Rag newInitialize: barracks.
        umbrella := Umbrella newInitialize: cloakroom.
        vitamins := Vitamins newInitialize: medicBay.
    ]

    initializeUniforms [
        militaryUniform := MilitaryUniform newInitialize.
        serviceUniform := ServiceUniform newInitialize.
    ]

    initializeCharacters [
        hero := Hero newInitialize: entrance recoveryPlace: medicBay uniform: militaryUniform.
        bandit := Bandit newInitialize: emptyRoomB hero: hero.
        chef := Chef newInitialize: cafeteria hero: hero.
        fuhrer := Fuhrer newInitialize: fuhrersQuarters hero: hero.
        guard1 := Guard1 newInitialize: securityCheckEntry hero: hero.
        guard2 := Guard2 newInitialize: securityCheckOffices hero: hero.
        guard3 := Guard3 newInitialize: fuhrersOffice hero: hero.
        guard4 := Guard4 newInitialize: fuhrersOffice hero: hero.
        salesman := Salesman newInitialize: armory items: OrderedCollection withAll: { gun. bulletproofVest } hero: hero.
        soldier := Soldier newInitialize: barracks item: helmet hero: hero.
        waiter := Waiter newInitialize: kitchen uniform: serviceUniform.
    ]

    initializeServiceClasses [
        actionListener := ActionListener newInitialize.
        map := Map newInitialize: communicatesService nullRoom: nullRoom passage: passage.
        movement := Movement newInitialize: communicatesService nullRoom: nullRoom passage: passage.
        roomService := RoomService new.
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
        communicatesService thanks. 
        communicatesService thanksForPlaying. 
        communicatesService youWon. 
        communicatesService typeQToExit. 
    ]
]
