Object subclass: #Item
    instanceVariableNames: 'name'

Item >> initialize: newName [
    name := newName.
]

Item >> name [
    ^ name
]

Item >> name: newName [
    name := newName
]
