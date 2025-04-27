Item subclass: Juice [
    | isPoisoned |

    initializeWithName: newName location: newLocation isPoisoned: newIsPoisoned [
        super initializeWithName: newName location: newLocation.
        isPoisoned := newIsPoisoned
    ]

    isPoisoned [
        ^ isPoisoned
    ]

    isPoisoned1: newIsPoisoned [
        isPoisoned := newIsPoisoned
    ]

    addPoison [
        self name: ('poisoned ', self name) asString.
        self isPoisoned: true
    ]
]