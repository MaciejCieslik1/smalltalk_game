Object subclass: #Character
    instanceVariableNames: 'name isAlive location isKillable'

Character >> initialize: newName newLocation newIsKillable [
    name := newName.
    isAlive := true.
    location := newLocation.
    isKillable := newIsKillable.
]

Character >> name [
    ^ name
]

Character >> name: newName [
    name := newName
]

Character >> isAlive [
    ^ isAlive
]

Character >> isAlive: newIsAlive [
    isAlive := newIsAlive
]

Character >> location [
    ^ location
]

Character >> location: newLocation [
    location := newLocation
]

Character >> isKillable [
    ^ isKillable
]

Character >> isKillable: newKillable [
    isKillable := newKillable
]

Character >> createInfo [
    | info |
    info := 'Name: ', self name asString, String cr,
            'Alive status: ', self isAlive asString, String cr,
            'Location: ', self location asString, String cr,
            'Killable status: ', self isKillable asString, String cr.
    ^ info
]