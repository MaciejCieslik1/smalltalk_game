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
