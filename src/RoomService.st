Object subclass: #RoomSevice

RoomService >> openIdRooms [
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

RoomService >> openOffices [
    conferenceRoom isAccessible: true
    goebbelsOffice isAccessible: true
    fuhrersOffice isAccessible: true
    emptyRoomB isAccessible: true
]

RoomService >> openKitchen [
    kitchen isAccessible: true
    foodStorage isAccessible: true
]

RoomService >> openEmptyRoomB [
    emptyRoomB isAccessible: true
    passage isAccessible: true
]

RoomService >> openArchives [
    archives isAccessible: true
]

RoomService >> openFuhrersQuarters [
    fuhrersQuarters isAccessible: true
]

RoomService >> openKitchenExit [
    kitchenExit isAccessible: true
]

RoomService >> openSecretExit [
    secretExit isAccessible: true
]

