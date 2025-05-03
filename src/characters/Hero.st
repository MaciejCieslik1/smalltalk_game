Person subclass: Hero [
    | items uniform money recoveryPlace |

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
        recoveryPlace := newRecoveryPlace
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
        ^ self items include: item
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

    createInfo [
        | info |
        communicatesService printStringNewLine: 'Name: ', self name asString.
        communicatesService printStringNewLine: 'Alive status: ', self isAlive printString.
        communicatesService printStringNewLine: 'Location: ', self location printString.
        communicatesService printStringNewLine: 'Killable status: ', self isKillable printString.
        communicatesService printStringNewLine: 'Uniform: ', self uniform name.
        communicatesService printStringNewLine: 'Money: ', self money asString.
        communicatesService printItems: self items.
    ]

    hasEnoughMoney: moneyAmount [
        self money amount >= moneyAmount
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
        self location: room
        room heroWalkedIn
    ]

    getWounded [
        self moveTotheRoom: recoveryPlace
    ]

    attack: target [
        (target = 'guard1')
        ifTrue: [
            self attackGuard1
        ].
        (target = 'guard3')
        ifTrue: [
            self attackGuard3
        ].
        (target = 'guard4')
        ifTrue: [
            self attackGuard4
        ].
        (target = 'waiter')
        ifTrue: [
            self attackWaiter
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

    attackGuard3: guard3 [
        (self hasItemWithName: 'gun')
        ifTrue: [
            guard3 attacked
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