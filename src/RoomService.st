Object subclass: RoomService [

    openRooms: accessRooms [
        accessRooms do: [:room | 
            room isAccessible: true 
        ].
    ]
]
