Person subclass: Hero [
    instanceVariableNames: 'items uniform money'

    initialize: [
        super initializeWithName: 'Johannes_Golmer' location: startExit isKillable: true
        items := OrderedCollection new
        uniform := military_uniform
        money := 0
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
        info := super createInfo,
                'Uniform: ', self uniform, String cr,
                'Money: ', self money, String cr,
                'Items: ', (self items joinSeparatedBy: ', '), String cr.
        ^ info
    ]

    hasEnoughMoney: moneyAmount [
        self money amount >= moneyAmount
        ifTrue: [
            ^ true
        ]
        ifFalse: [
            ^ false
        ]
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
        self moveTotheRoom: medicBay
    ]

    attack: target [
        (target = 'guard1')
        ifTrue: [
            self attackGuard1
        ]
        (target = 'guard3')
        ifTrue: [
            self attackGuard3
        ]
        (target = 'guard4')
        ifTrue: [
            self attackGuard4
        ]
        (target = 'waiter')
        ifTrue: [
            self attackWaiter
        ]
    ]

    attackGuard1 [
        (hero hasItem: baton)
        ifTrue: [
            guard1 attacked
        ]
        ifFalse: [
            communicatesService attackNoBaton
        ]
    ]

    attackGuard3 [
        (hero hasItem: gun)
        ifTrue: [
            guard3 attacked
        ]
        ifFalse: [
            communicatesService attackNoGun
        ]
    ]

    attackGuard4 [
        (hero hasItem: gun)
        ifTrue: [
            guard4 attacked
        ]
        ifFalse: [
            communicatesService attackNoGun
        ]
    ]

    attackWaiter [
        (hero hasItem: baton)
        ifTrue: [
            waiter attacked
        ]
        ifFalse: [
            communicatesService attackNoBaton
        ]
    ]

    changeUniform: newUniform [
        self uniform: newUniform
    ]

    addPoison: juice [
        juice addPoison
        self removeItem: poison
    ]

    addChloroform: rag [
        rag addChloroform
        self removeItem: chloroform
    ]

    hasPoisonedJuice [
        (appleJuice isPoisoned)
        ifTrue: [
            ^ true
        ]
        (orangeJuice isPoisoned)
        ifTrue: [
            ^ true
        ]
        (multivitaminaJuice isPoisoned)
        ifTrue: [
            ^ true
        ]
        ^ false
    ]
]