Object subclass: RoomSevice [

    openRooms: accessRooms [
        accessRooms do: [:room | 
            room isAccessible: true 
        ].
    ]
]
