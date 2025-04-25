Object subclass: #Map

Map >> createMap [
    | firstLevelRoomsList secondLevelRoomsList thirdLevelRoomsList fourthLevelRoomsList fifthLevelRoomsList sixthLevelRoomsList |
    sixthLevelRoomsList := #(secretExit, fuhrersQuarters, goebbelsOffice, archives, nullRoom, nullRoom, nullRoom)
    fifthLevelRoomsList := #(nullRoom, fuhrersOffice, conferenceRoom, securityCheckOffices, barracks, nullRoom, nullRoom)
    fourthLevelRoomsList := #(nullRoom, emptyRoomB, passage, lobby, socialRoom, foodStorage, kitchenExit)
    thirdLevelRoomsList := #(nullRoom, nullRoom, nullRoom, emptyRoomA, cafeteria, kitchen, nullRoom)
    secondLevelRoomsList := #(nullRoom, nullRoom, nullRoom, cloaroom, medicBay, nullRoom, nullRoom)
    firstLevelRoomsList := #(nullRoom, nullRoom, entrance, securityCheckEntry, armory, nullRoom, nullRoom)
]
