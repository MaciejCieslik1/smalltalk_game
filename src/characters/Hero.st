Character subclass: #Hero
    instanceVariableNames: 'items uniform money'

Hero >> initialize: [
    super initialize 'Johannes_Golmer' startExit true
    items := OrderedCollection new
    uniform := military_uniform
    money := 0
]

Hero >> items [
    ^ items
]

Hero >> items: newItems [
    items := newItems
]

Hero >> addItem: newItem [
    items add: newItem
]

Hero >> removeItem: item [
    items remove: item
]

Hero >> hasItem: item [
    ^ self items include: item
]

Hero >> uniform [
    ^ uniform
]

Hero >> uniform: newUniform [
    uniform := newUniform
]

Hero >> money [
    ^ money
]

Hero >> money: newMoney [
    newMoney < 0 ifTrue: [
        Error new signal: 'Money cannot be less than 0'.
    ].
    money := newMoney.
]

Hero >> createInfo [
    | info |
    info := super createInfo,
            'Uniform: ', self uniform, String cr,
            'Money: ', self money, String cr,
            'Items: ', (self items joinSeparatedBy: ', '), String cr.
    ^ info
]

Hero >> hasEnoughMoney: moneyAmount [
    self money amount >= moneyAmount
    ifTrue: [
        ^ true
    ]
    ifFalse: [
        ^ false
    ]
]

Hero >> addMoney: moneyAmount [
    self money: (self money + moneyAmount)
]

Hero >> subtractMoney: moneyAmount [
    self money: (self money - moneyAmount)
]

Hero >> moveTotheRoom: room [
    self location: room
    room heroWalkedIn
]

Hero >> getWounded [
    self moveTotheRoom: medicBay
]

Hero >> attack: target [
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
]

Hero >> attackGuard1 [
    (hero hasItem: baton)
    ifTrue: [
        guard1 attacked
    ]
    ifFalse: [
        communicatesService attackNoBaton
    ]
]

Hero >> attackGuard3 [
    (hero hasItem: gun)
    ifTrue: [
        guard3 attacked
    ]
    ifFalse: [
        communicatesService attackNoGun
    ]
]

Hero >> attackGuard4 [
    (hero hasItem: gun)
    ifTrue: [
        guard4 attacked
    ]
    ifFalse: [
        communicatesService attackNoGun
    ]
]
