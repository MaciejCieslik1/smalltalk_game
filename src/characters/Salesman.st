Npc subclass: #Salesman
    instanceVariableNames: 'items'

Salesman >> initialize: [
    super initialize 'salesman' private armory false
    items := #(bulletproofVest, gun)
]

Salesman >> items [
    ^ items
]

Salesman >> items: newItems [
    items := newItems
]

Salesman >> addItem: newItem [
    items add: newItem
]

Salesman >> removeItem: item [
    items remove: item
]

Salesman >> hasItem: item [
    ^ self items include: item
]

Salesman >> createInfo [
    | info |
    info := super createInfo,
            'Items: ', (self items joinSeparatedBy: ', '), String cr.
    ^ info
]

Salesman >> interaction [
    self introductionDialogue
    self hasGun
]

Salesman >> introductionDialogue [
    communicatesService talkToSalesman_1
    communicatesService talkToSalesman_2
]

Salesman >> hasGun [
    (self hasItem: gun)
    ifTrue: [
        communicatesService talkToSalesman_3
        self hasVestAndGun
    ]
    ifFalse: [
        self hasVest
    ]
]

Salesman >> hasVestAndGun [
    (self hasItem: bulletproof)
    ifTrue: [
        communicatesService talkToSalesman_4
        communicatesService talkToSalesman_5
        self abcOptionAllItems
    ]
    ifFalse: [
        communicatesService talkToSalesman_7
        self abOptionNoVest
    ]
]


Salesman >> hasVest [
    (self hasItem: bulletproof)
    ifTrue: [
        communicatesService talkToSalesman_6
        communicatesService talkToSalesman_7
        self abOptionNoGun
    ]
    ifFalse: [
        communicatesService talkToSalesman_8
        inputOption := inputService inputCharacter: ('a')
        communicatesService talkToSalesman_11
    ]
]

Salesman abcOptionAllItems [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b $c)
    (inputOption = $a) 
    ifTrue: [
        self buyGun
    ]
    (inputOption = $b) 
    ifTrue: [
        self buyVest
    ]
    (inputOption = $c) 
    ifTrue: [
        self dontBuy
    ]
]

Salesman abOptionNoVest [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b)
    (inputOption = $a) 
    ifTrue: [
        self buyGun
    ]
    (inputOption = $b) 
    ifTrue: [
        self dontBuy
    ]
]

Salesman abOptionNoGun [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b)
    (inputOption = $a) 
    ifTrue: [
        self buyVest
    ]
    (inputOption = $b) 
    ifTrue: [
        self dontBuy
    ]
]

Salesman >> buyGun [
    self preBuyGunDialogues
    (hero hasItem: amber)
    ifTrue: [
        communicatesService talkToSalesman_13
        communicatesService talkToSalesman_14
        self gunPaymentConfirmation
    ]
    ifFalse: [
        self heroHasNoAmber
    ]
]

Salesman >> preBuyGunDialogues [
    communicatesService talkToSalesman_9
    communicatesService talkToSalesman_12
    communicatesService talkToSalesman_2
]

Salesman >> gunPaymentConfirmation [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b)
    (inputOption = $a) 
    ifTrue: [
        self proceedPaymentGun
    ]
    (inputOption = $b) 
    ifTrue: [
        self dontBuy
    ]
]

Salesman >> heroHasNoAmber [
    communicatesService talkToSalesman_18
    inputOption := inputService inputCharacter: ('a')
    communicatesService talkToSalesman_19
    communicatesService talkToSalesman_25
]

Salesman >> proceedPaymentGun [
    communicatesService talkToSalesman_15
    communicatesService talkToSalesman_24
    communicatesService talkToSalesman_27
    communicatesService talkToSalesman_16
    self transferGunToHero
]

Salesman >> buyVest [
    | vestPrice |
    vestPrice := 1000
    self preBuyVestDialogues
    (hero hasEnoughMoney: vestPrice)
    ifTrue: [
        communicatesService talkToSalesman_13
        communicatesService talkToSalesman_14
        self vestPaymentConfirmation
    ]
    ifFalse: [
        self heroHasNotEnoughMoney
    ]
]

Salesman >> preBuyVestDialogues [
    communicatesService talkToSalesman_10
    communicatesService talkToSalesman_20
    communicatesService talkToSalesman_2
]

Salesman >> vestPaymentConfirmation [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b)
    (inputOption = $a) 
    ifTrue: [
        self proceedPaymentVest
    ]
    (inputOption = $b) 
    ifTrue: [
        self dontBuy
    ]
]

Salesman >> heroHasNotEnoughMoney [
    communicatesService talkToSalesman_22
    inputOption := inputService inputCharacter: ('a')
    communicatesService talkToSalesman_23
    communicatesService talkToSalesman_26
]

Salesman >> dontBuy [
    communicatesService talkToSalesman_17
]

Salesman >> proceedPaymentVest [
    communicatesService talkToSalesman_15
    communicatesService talkToSalesman_24
    communicatesService talkToSalesman_21
    self transferVestToHero
]

Salesman >> transferGunToHero [
    self removeItem: gun
    hero addItem: gun
    hero removeItem: amber
]

Salesman >> transferVestToHero [
    | vestPrice |
    vestPrice := 1000
    self removeItem: bulletproofVest
    hero addItem: bulletproofVest
    hero subtractMoney: vestPrice
]