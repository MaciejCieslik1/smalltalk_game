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
        communicatesService printStringNewLine: 'Name: ', self name asString.
        communicatesService printStringNewLine: 'Alive status: ', self isAlive printString.
        communicatesService printStringNewLine: 'Location: ', self location printString.
        communicatesService printStringNewLine: 'Killable status: ', self isKillable printString.
    ]
]