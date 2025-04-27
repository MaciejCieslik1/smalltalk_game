Object subclass: Item [
    | name location |

    initializeWithName: newName location: newLocation [
        name := newName.
        location := newLocation.
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
        "hero addItem: self."
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
