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


Character subclass: #Npc
    instanceVariableNames: 'rank'

Npc >> initialize: newName newRank newLocation newIsKillable [
    super initialize newName newLocation newIsKillable
    rank := newRank
]


Npc subclass: #Guard

Guard >> initialize: newName newLocation [
    super initialize newName private newLocation true
]


Guard subclass: #Guard1

Guard1 >> initialize: [
    super initialize 'guard1' private securityCheckEntry true
]


Guard subclass: #Guard2

Guard2 >> initialize: [
    super initialize 'guard2' private securityCheckOffices false
]


Guard subclass: #Guard3

Guard3 >> initialize: [
    super initialize 'guard3' private fuhrersOffice true
]


Guard subclass: #Guard4

Guard4 >> initialize: [
    super initialize 'guard4' private fuhrersOffice true
]


Npc subclass: #Soldier
    instanceVariableNames: 'items'

Soldier >> initialize: [
    super initialize 'soldier' private barracks false
    items := #(helmet)
]


Npc subclass: #Salesman
    instanceVariableNames: 'items money'

Salesman >> initialize: [
    super initialize 'salesman' private armory false
    items := #(bulletproofVest, gun)
    money := 10000
]


Npc subclass: #Chef

Chef >> initialize: [
    super initialize 'chef' civil cafateria false
]


Npc subclass: #Bandit

Bandit >> initialize: [
    super initialize 'bandit' private emptyRoomB true
]


Npc subclass: #Waiter

Waiter >> initialize: [
    super initialize 'waiter' civil kitchen false
]


Npc subclass: #Fuhrer

Fuhrer >> initialize: [
    super initialize 'adolf' fuhrer fuhrersQuarters true
]


Character subclass: #Hero
    instanceVariableNames: 'items uniform money'

Hero >> initialize: [
    super initialize 'Johannes Golmer' startExit true
    items := OrderedCollection new
    uniform := military_uniform
    money := 0
]