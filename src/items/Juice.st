Item subclass: #Juice
    instanceVariableNames: 'isPoisoned'

Juice >> initialize: newName newIsPoisoned [
    super initialize: newName
    isPoisoned := newIsPoisoned
]

Juice >> isPoisoned [
    ^ isPoisoned
]

Juice >> isPoisoned: newIsPoisoned [
    isPoisoned := newIsPoisoned
]
