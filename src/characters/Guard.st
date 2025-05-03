Npc subclass: Guard [
    | hasPermission hero roomService |

    initializeWithName: newName 
        location: newLocation 
        isKillable: isKillable 
        hero: newHero 
        roomService: newRoomService
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: newName 
            rank: 'private' 
            location: newLocation 
            isKillable: isKillable
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        hasPermission := false.
        roomService := newRoomService.
        hero := newHero.
    ]

    hasPermission [
        ^ hasPermission
    ]

    hasPermission: newHasPermission [
        hasPermission := newHasPermission
    ]
]
