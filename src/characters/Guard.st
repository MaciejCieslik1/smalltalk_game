Npc subclass: Guard [
    | hasPermission hero |

    initializeWithName: newName 
        location: newLocation 
        isKillable: isKillable 
        hero: newHero 
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
        hero := newHero.
    ]

    hasPermission [
        ^ hasPermission
    ]

    hasPermission: newHasPermission [
        hasPermission := newHasPermission
    ]
]
