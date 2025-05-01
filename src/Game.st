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
        archives := NoneNpcRoom new. 
        archives initializeWithName: 'archives' isAccessible: false hasItem: true itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        armory := NpcRoom new.
        armory initializeWithName: 'armory' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        barracks := NpcRoom new.
        barracks initializeWithName: 'barracs' isAccessible: false hasItem: true itemsList: (OrderedCollection new) 
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        cafeteria := NoneNpcRoom new.
        cafeteria initializeWithName: 'cafeteria' isAccessible: false hasItem: true itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        cloakroom := NoneNpcRoom new.
        cloakroom initializeWithName: 'cloakroom' isAccessible: false hasItem: true itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        conferenceRoom := NoneNpcRoom new.
        conferenceRoom initializeWithName: 'conference room' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        emptyRoomA := NoneNpcRoom new.
        emptyRoomA initializeWithName: 'empty room A' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        emptyRoomB := NpcRoom new.
        emptyRoomB initializeWithName: 'empty room B' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        entrance := NoneNpcRoom new.
        entrance initializeWithName: 'entrance' isAccessible: true hasItem: true itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        foodStorage := NoneNpcRoom new.
        foodStorage initializeWithName: 'food storage' isAccessible: false hasItem: true itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        fuhrersOffice := NoneNpcRoom new.
        fuhrersOffice initializeWithName: 'fuhrer''s office' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        fuhrersQuarters := NpcRoom new.
        fuhrersQuarters initializeWithName: 'fuhrer''s quarters' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        goebbelsOffice := NoneNpcRoom new.
        goebbelsOffice initializeWithName: 'goebbels''s office' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        kitchen := NpcRoom new.
        kitchen initializeWithName: 'kitchen' isAccessible: false hasItem: true itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        kitchenExit := NoneNpcRoom new.
        kitchenExit initializeWithName: 'kitchen exit' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        lobby := NoneNpcRoom new.
        lobby initializeWithName: 'lobby' isAccessible: false hasItem: true itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        medicBay := NoneNpcRoom new.
        medicBay initializeWithName: 'medic bay' isAccessible: false hasItem: true itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        nullRoom := NullRoom newInitialize.
        nullRoom initializeWithName: 'null room' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        secretExit := NoneNpcRoom new.
        secretExit initializeWithName: 'secret exit' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        securityCheckEntry := NpcRoom new.
        securityCheckEntry initializeWithName: 'security check (entry)' isAccessible: true hasItem: false itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        securityCheckOffices := NpcRoom new.
        securityCheckOffices initializeWithName: 'security check (offices)' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new) communicatesService: communicatesService inputService: inputService.
        socialRoom := NoneNpcRoom new.
        socialRoom initializeWithName: 'social room' isAccessible: false hasItem: true itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.
        passage := NoneNpcRoom new.
        passage initializeWithName: 'passage' isAccessible: false hasItem: false itemsList: (OrderedCollection new)
            communicatesService: communicatesService inputService: inputService.

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
