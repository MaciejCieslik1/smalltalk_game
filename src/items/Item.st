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

    pickUp: hero [
        (self name ~= 'lever')
        ifTrue: [
            self pickItemNotLever: hero.
        ]
        ifFalse: [
            communicatesService cannotPickUpItem.
        ].
    ]

    pickItemNotLever: hero [
        hero addItem: self.
        location removeItem: self.
        (location itemsList isEmpty)
        ifTrue: [
            location hasItem: false 
        ]
    ]

    interact: hero [
        communicatesService cannotInteractWithItem.
    ]

    description [
        " This method is overwritten by subclass "
    ]
]
