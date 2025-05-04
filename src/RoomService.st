Object subclass: RoomService [
    | idRooms offices kitchenRooms passageRooms archives fuhrersQuarters kitchenExit secretExit |

    initialize: newIdRooms
        offices: newOffices
        kitchenRooms: newKitchenRooms
        passageRooms: newPassageRooms
        archives: newArchives
        fuhrersQuarters: newFuhrersQuarters
        kitchenExit: newKitchenExit
        secretExit: newSecretExit
    [
        idRooms := newIdRooms.
        offices := newOffices.
        kitchenRooms := newKitchenRooms.
        passageRooms := newPassageRooms.
        archives := newArchives.
        fuhrersQuarters := newFuhrersQuarters.
        kitchenExit := newKitchenExit.
        secretExit := newSecretExit.
    ]

    openIdRooms [
        idRooms do: [:room |
            room isAccessible: true.
        ]
    ]

    openOffices [
        offices do: [:room |
            room isAccessible: true.
        ]
    ]

    openKitchen [
        kitchenRooms do: [:room |
            room isAccessible: true.
        ]
    ]

    openEmptyRoomB [
        passageRooms do: [:room |
            room isAccessible: true.
        ]
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
