Item subclass: #Juice
    instanceVariableNames: 'isPoisoned'

Juice >> initialize: newName newLocation newIsPoisoned [
    super initialize: newName newLocation
    isPoisoned := newIsPoisoned
]

Juice >> isPoisoned [
    ^ isPoisoned
]

Juice >> isPoisoned: newIsPoisoned [
    isPoisoned := newIsPoisoned
]

Juice >> addPoison [
    self name: ('poisoned ', self name) asString.
    self isPoisoned: true
]
