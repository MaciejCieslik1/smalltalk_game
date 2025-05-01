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
        cafeteria := NpcRoom new.
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
        fuhrersOffice := NpcRoom new.
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
        nullRoom := NullRoom new.
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
        appleJuice := AppleJuice new.
        appleJuice initialize: cafeteria communicatesService: communicatesService inputService: inputService.
        orangeJuice := OrangeJuice new.
        orangeJuice initialize: cafeteria communicatesService: communicatesService inputService: inputService.
        multivitaminaJuice := MultivitaminaJuice new.
        multivitaminaJuice initialize: cafeteria communicatesService: communicatesService inputService: inputService.
        bandage := Bandage new.
        bandage initialize: medicBay communicatesService: communicatesService inputService: inputService.
        baton := Baton new.
        baton initialize: barracks communicatesService: communicatesService inputService: inputService.
        bulletproofVest := BulletproofVest new.
        bulletproofVest initialize: communicatesService inputService: inputService.
        chloroform := Chloroform new.
        chloroform initialize: medicBay communicatesService: communicatesService inputService: inputService.
        gun := Gun new.
        gun initialize: communicatesService inputService: inputService.
        helmet := Helmet new. 
        helmet initialize: communicatesService inputService: inputService.
        letter := Letter new.
        letter initialize: goebbelsOffice communicatesService: communicatesService inputService: inputService.
        lever := Lever new.
        lever initialize: archives communicatesService: communicatesService inputService: inputService.
        money := Money new.
        money initialize: nil amount: 0 communicatesService: communicatesService inputService: inputService.
        moneyMedicBay := Money new. 
        moneyMedicBay initialize: medicBay amount: 250 communicatesService: communicatesService inputService: inputService.
        moneyKitchen := Money new.
        moneyKitchen initialize: kitchen amount: 250 communicatesService: communicatesService inputService: inputService.
        moneySocialRoom := Money new.
        moneySocialRoom initialize: socialRoom amount: 250 communicatesService: communicatesService inputService: inputService.
        moneyLobby := Money new.
        moneyLobby initialize: lobby amount: 250 communicatesService: communicatesService inputService: inputService.
        poison := Poison new.
        poison initialize: foodStorage communicatesService: communicatesService inputService: inputService.
        rag := Rag new.
        rag initialize: barracks communicatesService: communicatesService inputService: inputService.
        umbrella := Umbrella new. 
        umbrella initialize: cloakroom communicatesService: communicatesService inputService: inputService.
        vitamins := Vitamins new.
        vitamins initialize: medicBay communicatesService: communicatesService inputService: inputService.
    ]

    initializeUniforms [
        militaryUniform := MilitaryUniform new.
        militaryUniform initialize: communicatesService inputService: inputService.
        serviceUniform := ServiceUniform new.
        serviceUniform initialize: communicatesService inputService: inputService.
    ]

    initializeCharacters [
        hero := Hero new.
        hero initialize: entrance recoveryPlace: medicBay uniform: militaryUniform communicatesService: communicatesService 
            inputService: inputService.
        bandit := Bandit new.
        bandit initialize: emptyRoomB hero: hero communicatesService: communicatesService inputService: inputService.
        chef := Chef new.
        chef initialize: cafeteria hero: hero communicatesService: communicatesService inputService: inputService.
        fuhrer := Fuhrer new.
        fuhrer initialize: fuhrersQuarters communicatesService: communicatesService inputService: inputService.
        guard1 := Guard1 new.
        guard1 initialize: securityCheckEntry communicatesService: communicatesService inputService: inputService.
        guard2 := Guard2 new.
        guard2 initialize: securityCheckOffices communicatesService: communicatesService inputService: inputService.
        guard3 := Guard3 new.
        guard3 initialize: fuhrersOffice communicatesService: communicatesService inputService: inputService.
        guard4 := Guard4 new.
        guard4 initialize: fuhrersOffice communicatesService: communicatesService inputService: inputService.
        salesman := Salesman new.
        salesman initialize: armory items: (OrderedCollection withAll: { gun. bulletproofVest }) hero: hero 
            communicatesService: communicatesService inputService: inputService.
        soldier := Soldier new. 
        soldier initialize: barracks helmet: helmet hero: hero communicatesService: communicatesService inputService: inputService.
        waiter := Waiter new. 
        waiter initialize: kitchen uniform: serviceUniform communicatesService: communicatesService inputService: inputService.
    ]

    initializeServiceClasses [
        actionListener := ActionListener new.
        actionListener initialize: hero movement: movement communicatesService: communicatesService inputService: inputService.
        map := Map new.
        map initialize: hero nullRoom: nullRoom passage: passage communicatesService: communicatesService. 
        movement := Movement new.
        movement initialize: hero nullRoom: nullRoom passage: passage communicatesService: communicatesService.
        roomService := RoomService new.
    ]

    gameLoop [
        | hasHeroEscaped |
        hasHeroEscaped := false.
        communicatesService help.
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
