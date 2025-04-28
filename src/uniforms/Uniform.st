Object subclass: Uniform [
    | name communicatesService inputService |

    initializeWithName: newName 
        communicatesService: newCommunicatesService
        inputService: newInputService
    [
        name := newName.
        communicatesService := newCommunicatesService.
        inputService := newInputService.
    ]

    name [
        ^ name
    ]

    name: newName [
        name := newName
    ]
]
