Object subclass: #Uniform
    instanceVariableNames: 'name'

Uniform >> initialize: newName [
    name := newName.
]

Uniform >> name [
    ^ name
]

Uniform >> name: newName [
    name := newName
]
