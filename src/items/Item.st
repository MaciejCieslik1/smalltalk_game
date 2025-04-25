Object subclass: #Item
    instanceVariableNames: 'name location'

Item >> initialize: newName newLocation [
    name := newName.
    location := newLocation.
]

Item >> name [
    ^ name
]

Item >> name: newName [
    name := newName
]

Item >> location [
    ^ location
]

Item >> location: newLocation [
    location := newLocation
]

Item >> pickUp [
    hero addItem: self
    self location removeItem: self
    (self itemsList isEmpty)
    ifTrue: [
        self hasItem: false 
    ]
]

Item >> interact [
    " This method is overwritten by subclass "
]

Item >> description [
    " This method is overwritten by subclass "
]
