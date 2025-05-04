Npc subclass: Salesman [
    | items hero |

    initialize: newLocation 
        items: newItems 
        hero: newHero 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'salesman' 
            rank: 'private' 
            location: newLocation 
            isKillable: false
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        items := OrderedCollection new.
        hero := newHero.
        newItems do: [:item |
            items add: item. 
        ].
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

    findItemWithName: itemName [
        items do: [:item |
            (item name = itemName) 
            ifTrue: [
                ^ item
            ].
        ].
        ^ nil
    ]


    createInfo [
        | info |
        info := super createInfo,
                'Items: ', (self items joinSeparatedBy: ', '), String cr.
        ^ info
    ]

    interaction [
        self introductionDialogue.
        self hasGun.
    ]

    introductionDialogue [
        communicatesService talkToSalesman_1.
        communicatesService talkToSalesman_2.
    ]

    hasGun [
        (self hasItemWithName: 'gun')
        ifTrue: [
            communicatesService talkToSalesman_3.
            self hasVestAndGun.
        ]
        ifFalse: [
            self hasVest.
        ].
    ]

    hasVestAndGun [
        (self hasItemWithName: 'bulletproof')
        ifTrue: [
            communicatesService talkToSalesman_4.
            communicatesService talkToSalesman_5.
            self abcOptionAllItems.
        ]
        ifFalse: [
            communicatesService talkToSalesman_7.
            self abOptionNoVest.
        ].
    ]


    hasVest [
        | inputOption |
        (self hasItemWithName: 'bulletproof')
        ifTrue: [
            communicatesService talkToSalesman_6.
            communicatesService talkToSalesman_7.
            self abOptionNoGun.
        ]
        ifFalse: [
            communicatesService talkToSalesman_8.
            inputOption := inputService inputCharacter: ('a').
            communicatesService talkToSalesman_11.
        ].
    ]

    abcOptionAllItems [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b $c).
        (inputOption = $a) 
        ifTrue: [
            self buyGun.
        ].
        (inputOption = $b) 
        ifTrue: [
            self buyVest.
        ].
        (inputOption = $c) 
        ifTrue: [
            self dontBuy.
        ].
    ]

    abOptionNoVest [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self buyGun.
        ].
        (inputOption = $b) 
        ifTrue: [
            self dontBuy.
        ].
    ]

    abOptionNoGun [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self buyVest.
        ].
        (inputOption = $b) 
        ifTrue: [
            self dontBuy.
        ].
    ]

    buyGun [
        self preBuyGunDialogues.
        (hero hasItemWithName: 'amber')
        ifTrue: [
            communicatesService talkToSalesman_13.
            communicatesService talkToSalesman_14.
            self gunPaymentConfirmation.
        ]
        ifFalse: [
            self heroHasNoAmber.
        ].
    ]

    preBuyGunDialogues [
        communicatesService talkToSalesman_9.
        communicatesService talkToSalesman_12.
        communicatesService talkToSalesman_2.
    ]

    gunPaymentConfirmation [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self proceedPaymentGun.
        ].
        (inputOption = $b) 
        ifTrue: [
            self dontBuy.
        ].
    ]

    heroHasNoAmber [
        | inputOption |
        communicatesService talkToSalesman_18.
        inputOption := inputService inputCharacter: #($a).
        communicatesService talkToSalesman_19.
        communicatesService talkToSalesman_25.
    ]

    proceedPaymentGun [
        communicatesService talkToSalesman_15.
        communicatesService talkToSalesman_24.
        communicatesService talkToSalesman_27.
        communicatesService talkToSalesman_16.
        self transferGunToHero.
    ]

    buyVest [
        | vestPrice |
        vestPrice := 1000.
        self preBuyVestDialogues.
        (hero hasEnoughMoney: vestPrice)
        ifTrue: [
            communicatesService talkToSalesman_13.
            communicatesService talkToSalesman_14.
            self vestPaymentConfirmation.
        ]
        ifFalse: [
            self heroHasNotEnoughMoney.
        ].
    ]

    preBuyVestDialogues [
        communicatesService talkToSalesman_10.
        communicatesService talkToSalesman_20.
        communicatesService talkToSalesman_2.
    ]

    vestPaymentConfirmation [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self proceedPaymentVest.
        ].
        (inputOption = $b) 
        ifTrue: [
            self dontBuy.
        ].
    ]

    heroHasNotEnoughMoney [
        | inputOption |
        communicatesService talkToSalesman_22.
        inputOption := inputService inputCharacter: ('a').
        communicatesService talkToSalesman_23.
        communicatesService talkToSalesman_26.
    ]

    dontBuy [
        communicatesService talkToSalesman_17
    ]

    proceedPaymentVest: hero [
        communicatesService talkToSalesman_15.
        communicatesService talkToSalesman_24.
        communicatesService talkToSalesman_21.
        self transferVestToHero: hero.
    ]

    transferGunToHero [
        | gun amber |
        (self hasItemWithName: 'gun')
        ifTrue: [
            gun := self findItemWithName: 'gun'.
            self removeItem: gun.
            hero addItem: gun.
            self transferGunHasHeroHasAmber.
        ]
    ]

    transferGunHasHeroHasAmber [
        | amber |
        (self hasItemWithName: 'amber')
        ifTrue: [
            amber := self findItemWithName: 'amber'.
            hero removeItem: amber.
            self proceedPaymentGun.
        ].
    ]

    transferVestToHero [
        | vestPrice bulletproofVest |
        vestPrice := 1000.
        (self hasItemWithName: 'bulletproofVest')
        ifTrue: [
            bulletproofVest := self findItemWithName: 'bulletproofVest'.
            self removeItem: bulletproofVest.
            hero addItem: bulletproofVest.
            hero subtractMoney: vestPrice.
        ].
    ]
]
