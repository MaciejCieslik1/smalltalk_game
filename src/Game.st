Object subclass: Game [
    | communicatesService archives armory barracks cafeteria cloakroom conferenceRoom emptyRoomA emptyRoomB entrance foodStorage |
    |  fuhrersOffice fuhrersQuarters goebbelsOffice kitchen kitchenExit lobby medicBay nullRoom secretExit securityCheckEntry passage |
    |  securityCheckOffices socialRoom appleJuice orangeJuice multivitaminaJuice bandage baton bulletproofVest chloroform gun helmet |
    |  letter lever moneyMedicBay moneyKitchen moneySocialRoom moneyLobby poison rag umbrella vitamins militaryUniform |
    |  id midRankPass redKey amber |
    |  serviceUniform bandit chef fuhrer guard1 guard2 guard3 guard4 hero salesman soldier waiter actionListener inputService map |
    |  movement roomService levelMatrix |

    initializeFields [
        self initializeCommunicationService.
        self initializeLocations.
        self initializeItems.
        self initializeUniforms.
        self initializeCharacters.
        self initializeServiceClasses.
        self deployItems.
        self deployNpcs.
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
        levelMatrix := self createLevelMatrix.
    ]

    initializeAdjacentRooms [
        archives addAdjacentRooms: nullRoom west: nullRoom south: securityCheckOffices east: nullRoom.
        armory addAdjacentRooms: nullRoom west: securityCheckEntry south: nullRoom east: nullRoom.
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
        nullRoom addAdjacentRooms: nullRoom west: nullRoom south: nullRoom east: nullRoom.
        secretExit addAdjacentRooms: nullRoom west: nullRoom south: nullRoom east: fuhrersQuarters. 
        securityCheckEntry addAdjacentRooms: cloakroom west: entrance south: nullRoom east: armory. 
        securityCheckOffices addAdjacentRooms: archives west: conferenceRoom south: lobby east: nullRoom. 
        socialRoom addAdjacentRooms: barracks west: lobby south: cafeteria east: nullRoom.  
        passage addAdjacentRooms: nullRoom west: emptyRoomB south: nullRoom east: lobby.  
    ]

    createLevelMatrix [
        | firstLevelRoomsList secondLevelRoomsList thirdLevelRoomsList fourthLevelRoomsList fifthLevelRoomsList sixthLevelRoomsList matrix |

        sixthLevelRoomsList := OrderedCollection new.
        sixthLevelRoomsList add: secretExit.
        sixthLevelRoomsList add: fuhrersQuarters.
        sixthLevelRoomsList add: goebbelsOffice.
        sixthLevelRoomsList add: archives.
        sixthLevelRoomsList add: nullRoom.
        sixthLevelRoomsList add: nullRoom.
        sixthLevelRoomsList add: nullRoom.

        fifthLevelRoomsList := OrderedCollection new.
        fifthLevelRoomsList add: nullRoom.
        fifthLevelRoomsList add: fuhrersOffice.
        fifthLevelRoomsList add: conferenceRoom.
        fifthLevelRoomsList add: securityCheckOffices.
        fifthLevelRoomsList add: barracks.
        fifthLevelRoomsList add: nullRoom.
        fifthLevelRoomsList add: nullRoom.

        fourthLevelRoomsList := OrderedCollection new.
        fourthLevelRoomsList add: nullRoom.
        fourthLevelRoomsList add: emptyRoomB.
        fourthLevelRoomsList add: passage.
        fourthLevelRoomsList add: lobby.
        fourthLevelRoomsList add: socialRoom.
        fourthLevelRoomsList add: foodStorage.
        fourthLevelRoomsList add: kitchenExit.

        thirdLevelRoomsList := OrderedCollection new.
        thirdLevelRoomsList add: nullRoom.
        thirdLevelRoomsList add: nullRoom.
        thirdLevelRoomsList add: nullRoom.
        thirdLevelRoomsList add: emptyRoomA.
        thirdLevelRoomsList add: cafeteria.
        thirdLevelRoomsList add: kitchen.
        thirdLevelRoomsList add: nullRoom.

        secondLevelRoomsList := OrderedCollection new.
        secondLevelRoomsList add: nullRoom.
        secondLevelRoomsList add: nullRoom.
        secondLevelRoomsList add: nullRoom.
        secondLevelRoomsList add: cloakroom.
        secondLevelRoomsList add: medicBay.
        secondLevelRoomsList add: nullRoom.
        secondLevelRoomsList add: nullRoom.

        firstLevelRoomsList := OrderedCollection new.
        firstLevelRoomsList add: nullRoom.
        firstLevelRoomsList add: nullRoom.
        firstLevelRoomsList add: entrance.
        firstLevelRoomsList add: securityCheckEntry.
        firstLevelRoomsList add: armory.
        firstLevelRoomsList add: nullRoom.
        firstLevelRoomsList add: nullRoom.

        matrix := OrderedCollection new.
        matrix add: sixthLevelRoomsList.
        matrix add: fifthLevelRoomsList.
        matrix add: fourthLevelRoomsList.
        matrix add: thirdLevelRoomsList.
        matrix add: secondLevelRoomsList.
        matrix add: firstLevelRoomsList.

        ^ matrix.
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
        id := Id new.
        id initialize: entrance communicatesService: communicatesService inputService: inputService.
        midRankPass := MidRankPass new.
        midRankPass initialize: communicatesService inputService: inputService.
        redKey := RedKey new.
        redKey initialize: goebbelsOffice communicatesService: communicatesService inputService: inputService.
        amber := Amber new.
        amber initialize: goebbelsOffice communicatesService: communicatesService inputService: inputService.
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
        guard1 initialize: securityCheckEntry hero: hero communicatesService: communicatesService inputService: inputService.
        guard2 := Guard2 new.
        guard2 initialize: securityCheckOffices hero: hero communicatesService: communicatesService inputService: inputService.
        guard3 := Guard3 new.
        guard3 initialize: fuhrersOffice hero: hero communicatesService: communicatesService inputService: inputService.
        guard4 := Guard4 new.
        guard4 initialize: fuhrersOffice hero: hero communicatesService: communicatesService inputService: inputService.
        salesman := Salesman new.
        salesman initialize: armory items: (OrderedCollection withAll: { gun. bulletproofVest }) hero: hero 
            communicatesService: communicatesService inputService: inputService.
        soldier := Soldier new. 
        soldier initialize: barracks helmet: helmet hero: hero communicatesService: communicatesService inputService: inputService.
        waiter := Waiter new. 
        waiter initialize: kitchen uniform: serviceUniform communicatesService: communicatesService inputService: inputService.
    ]

    initializeServiceClasses [
        map := Map new.
        map initialize: hero nullRoom: nullRoom passage: passage levelMatrix: levelMatrix communicatesService: communicatesService.
        movement := Movement new.
        movement initialize: hero nullRoom: nullRoom passage: passage communicatesService: communicatesService. 
        actionListener := ActionListener new.
        actionListener initialize: hero movement: movement map: map communicatesService: communicatesService 
            inputService: inputService.
        roomService := RoomService new.
    ]

    deployItems [
        entrance itemsList add: id. 
        cloakroom itemsList add: umbrella.
        medicBay addItems: (OrderedCollection with: vitamins with: bandage with: chloroform with: moneyMedicBay).
        cafeteria addItems: (OrderedCollection with: appleJuice with: orangeJuice with: multivitaminaJuice).
        barracks addItems: (OrderedCollection with: baton with: rag).
        lobby itemsList add: moneyLobby.
        socialRoom itemsList add: moneySocialRoom.
        kitchen itemsList add: moneyKitchen.
        archives itemsList add: lever.
        goebbelsOffice itemsList: (OrderedCollection with: amber with: redKey with: letter).
    ]

    deployNpcs [
        securityCheckEntry npcList add: guard1.
        armory npcList add: salesman.
        cafeteria npcList add: chef.
        barracks npcList add: soldier.
        securityCheckOffices npcList add: guard2.
        emptyRoomB npcList add: bandit.
        fuhrersOffice npcList add: guard3.
        fuhrersOffice npcList add: guard4.
        fuhrersQuarters npcList add: fuhrer.
    ]

    gameLoop [
        | hasHeroEscaped quit |
        hasHeroEscaped := false.
        quit := false.
        entrance wasVisited: true.
        communicatesService help.
        [ hasHeroEscaped or:[quit] ] whileFalse: [
            quit := actionListener chooseAction
        ].
        (hasHeroEscaped)
        ifTrue: [
            self ending
        ].
    ]

    ending [
        communicatesService thanks. 
        communicatesService thanksForPlaying. 
        communicatesService youWon. 
        communicatesService typeQToExit. 
    ]
]
