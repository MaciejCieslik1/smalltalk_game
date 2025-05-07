Person subclass: Hero [
    | items uniform money recoveryPlace hasShowedRedKey |

    initialize: newLocation 
        recoveryPlace: newRecoveryPlace 
        uniform: newUniform
        communicatesService: newCommunicatesService 
        inputService: newInputService 
    [
        super initializeWithName: 'Johannes_Golmer' 
            location: newLocation 
            isKillable: true 
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        items := OrderedCollection new.
        uniform := newUniform.
        money := 0.
        recoveryPlace := newRecoveryPlace.
        hasShowedRedKey := false.
    ]

    items [
        ^ items
    ]

    items: newItems [
        items := newItems
    ]

    addItem: newItem [
        items add: newItem
    ]

    removeItem: item [
        items remove: item
    ]

    hasItem: item [
        ^ self items includes: item
    ]

    hasItemWithName: itemName [
        items do: [:item |
            (item name = itemName) 
            ifTrue: [
                ^ true
            ].
        ].
        ^ false
    ]

    hasUniformWithName: uniformName [
        (self uniform name = uniformName)
        ifTrue: [
            ^ true
        ].
        ^ false
    ]

    findItemWithName: itemName [
        items do: [:item |
            (item name = itemName) 
            ifTrue: [
                ^ item
            ].
        ].
        ^ nil
    ]

    uniform [
        ^ uniform
    ]

    uniform: newUniform [
        uniform := newUniform
    ]

    money [
        ^ money
    ]

    money: newMoney [
        newMoney < 0 ifTrue: [
            Error new signal: 'Money cannot be less than 0'.
        ].
        money := newMoney.
    ]

    hasShowedRedKey [
        ^ hasShowedRedKey
    ]

    hasShowedRedKey: newHasShowedRedKey [
        hasShowedRedKey := newHasShowedRedKey
    ]

    createInfo [
        | info |
        communicatesService printStringNewLine: 'Name: ', self name asString.
        communicatesService printStringNewLine: 'Alive status: ', self isAlive printString.
        communicatesService printStringNewLine: 'Location: ', self location name printString.
        communicatesService printStringNewLine: 'Killable status: ', self isKillable printString.
        communicatesService printStringNewLine: 'Uniform: ', self uniform name.
        communicatesService printStringNewLine: 'Money: ', self money asString.
        communicatesService printItems: self items.
    ]

    hasEnoughMoney: moneyAmount [
        self money >= moneyAmount
        ifTrue: [
            ^ true
        ]
        ifFalse: [
            ^ false
        ].
    ]

    addMoney: moneyAmount [
        self money: (self money + moneyAmount)
    ]

    subtractMoney: moneyAmount [
        self money: (self money - moneyAmount)
    ]

    moveTotheRoom: room [
        self location: room.
        room wasVisited: true 
    ]

    getWounded [
        self moveTotheRoom: recoveryPlace
    ]

    attack: target [
        | attackedNpc sideNpc |
        (target = 'guard1')
        ifTrue: [
            attackedNpc := self location findNpcByName: target.
            self attackGuard1: attackedNpc.
        ].
        (target = 'guard3')
        ifTrue: [
            attackedNpc := self location findNpcByName: target.
            sideNpc := self location findNpcByName: 'guard4'.
            self attackGuard3: attackedNpc sideNpc: sideNpc.
        ].
        (target = 'guard4')
        ifTrue: [
            attackedNpc := self location findNpcByName: target.
            self attackGuard4: attackedNpc.
        ].
        (target = 'waiter')
        ifTrue: [
            attackedNpc := self location findNpcByName: target.
            self attackWaiter: attackedNpc.
        ].
    ]

    attackGuard1: guard1 [
        (self hasItemWithName: 'baton')
        ifTrue: [
            guard1 attacked
        ]
        ifFalse: [
            communicatesService attackNoBaton
        ].
    ]

    attackGuard3: guard3 sideNpc: guard4 [
        (self hasItemWithName: 'gun')
        ifTrue: [
            guard3 attacked: guard4
        ]
        ifFalse: [
            communicatesService attackNoGun
        ].
    ]

    attackGuard4: guard4 [
        (self hasItemWithName: 'gun')
        ifTrue: [
            guard4 attacked
        ]
        ifFalse: [
            communicatesService attackNoGun
        ].
    ]

    attackWaiter: waiter [
        (self hasItemWithName: 'baton')
        ifTrue: [
            waiter attacked
        ]
        ifFalse: [
            communicatesService attackNoBaton
        ].
    ]

    changeUniform: newUniform [
        self uniform: newUniform
    ]

    addPoison: juice poison: poison [
        juice addPoison.
        self removeItem: poison.
    ]

    addChloroform: rag chloroform: chloroform [
        rag addChloroform.
        self removeItem: chloroform.
    ]

    hasPoisonedJuice: juices [
        juices do: [:juice |
            (juice isPoisoned) 
            ifTrue: [
                ^ true
            ].
        ].
        ^ false
    ]
]