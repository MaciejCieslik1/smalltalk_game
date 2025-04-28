Object subclass: Person [
   | name isAlive location isKillable communicatesService inputService |

    initializeWithName: newName 
        location: newLocation 
        isKillable: newIsKillable 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        name := newName.
        isAlive := true.
        location := newLocation.
        isKillable := newIsKillable.
        communicatesService := newCommunicatesService.
        inputService := newInputService.
    ]

    name [
        ^ name
    ]

    name: newName [
        name := newName
    ]

    isAlive [
        ^ isAlive
    ]

    isAlive: newIsAlive [
        isAlive := newIsAlive
    ]

    location [
        ^ location
    ]

    location: newLocation [
        location := newLocation
    ]

    isKillable [
        ^ isKillable
    ]

    isKillable: newKillable [
        isKillable := newKillable
    ]

    createInfo [
        | info |
        info := 'Name: ', self name asString, String cr,
                'Alive status: ', self isAlive asString, String cr,
                'Location: ', self location asString, String cr,
                'Killable status: ', self isKillable asString, String cr.
        ^ info
    ]
]