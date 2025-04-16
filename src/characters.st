Object subclass: #Character
    instanceVariableNames: 'name isAlive rank location isKillable'

Character >> initializeWithParams: newName newIsAlive newRank newLocation newKillable [
    name := newName.
    isAlive := newIsAlive.
    rank := newRank.
    location := newLocation.
    isKillable := newKillable.
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

Character >> rank [
    ^ rank
]

Character >> rank: newRank [
    rank := newRank
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
