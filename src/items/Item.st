Object subclass: Item [
    | name location communicatesService inputService |

    initializeWithName: newName 
        location: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        name := newName.
        location := newLocation.
        communicatesService := newCommunicatesService.
        inputService := newInputService.
    ]

    name [
        ^ name
    ]

    name: newName [
        name := newName
    ]

    location [
        ^ location
    ]

    location: newLocation [
        location := newLocation
    ]

    pickUp [
        hero addItem: self.
        location removeItem: self.
        (self itemsLists isEmpty)
        ifTrue: [
            self hasItem: false 
        ]
    ]

    interact [
        " This method is overwritten by subclass "
    ]

    description [
        " This method is overwritten by subclass "
    ]
]
