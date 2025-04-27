Npc subclass: Guard [
    | hasPermission |

    initializeWithName: newName newLocation isKillable[
        super initializeWithName: newName 
            rank: private 
            location: newLocation 
            isKillable: isKillable
        hasPermission := false
    ]

    hasPermission [
        ^ hasPermission
    ]

    hasPermission: newHasPermission [
        hasPermission := newHasPermission
    ]
]
