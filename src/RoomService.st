Object subclass: RoomSevice [

    openIdRooms [
        armory isAccessible: true
        cloakroom isAccessible: true
        emptyRoomA isAccessible: true
        cafeteria isAccessible: true
        medicBay isAccessible: true
        armory isAccessible: true
        lobby isAccessible: true
        socialRoom isAccessible: true
        securityCheckOffices isAccessible: true
        barracks isAccessible: true
    ]

    openOffices [
        conferenceRoom isAccessible: true
        goebbelsOffice isAccessible: true
        fuhrersOffice isAccessible: true
        emptyRoomB isAccessible: true
    ]

    openKitchen [
        kitchen isAccessible: true
        foodStorage isAccessible: true
    ]

    openEmptyRoomB [
        emptyRoomB isAccessible: true
        passage isAccessible: true
    ]

    openArchives [
        archives isAccessible: true
    ]

    openFuhrersQuarters [
        fuhrersQuarters isAccessible: true
    ]

    openKitchenExit [
        kitchenExit isAccessible: true
    ]

    openSecretExit [
        secretExit isAccessible: true
    ]
]
