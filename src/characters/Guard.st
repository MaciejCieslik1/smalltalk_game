Npc subclass: Guard [
    | hasPermission hero |

    initializeWithName: newName location: newLocation isKillable: isKillable hero: newHero[
        super initializeWithName: newName 
            rank: 'private' 
            location: newLocation 
            isKillable: isKillable.
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
