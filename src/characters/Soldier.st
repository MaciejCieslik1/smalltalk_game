Npc subclass: #Soldier
    instanceVariableNames: 'items'

Soldier >> initialize: [
    super initialize 'soldier' private barracks false
    items := #(helmet)
    hasPlayedCards := false
]

Soldier >> items [
    ^ items
]

Soldier >> items: newItems [
    items := newItems
]

Soldier >> addItem: newItem [
    items add: newItem
]

Soldier >> removeItem: item [
    items remove: item
]

Soldier >> hasItem: item [
    ^ self items include: item
]

Soldier >> hasPlayedCards [
    ^ hasPlayedCards
]

Soldier >> hasPlayedCards: newHasPlayedCards [
    hasPlayedCards := newHasPlayedCards
]

Soldier >> createInfo: [
    | info |
    info := super createInfo,
            'Items: ', (self items joinSeparatedBy: ', '), String cr.
    ^ info
]

Soldier >> interaction: [
    (self hasPlayedCards)
    ifTrue: [
        self alreadyPlayedOption
    ]
    ifFalse: [
        self firstGameOption
    ]
]

Soldier >> alreadyPlayedOption: [
    communicatesService talkToSoldier_12
]

Soldier >> firstGameOption: [
    self introductionDialogue
    self hasHeroWillToPlay
]

Soldier >> introductionDialogue: [
    communicatesService talkToSoldier_1
    communicatesService talkToSoldier_2
    communicatesService talkToSoldier_3
    communicatesService talkToSoldier_4
]

Soldier >> hasHeroWillToPlay: [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b)
    (inputOption = $a) 
    ifTrue: [
        self heroDoesNotWantToPlay
    ]
    (inputOption = $b) 
    ifTrue: [
        self heroWantsToPlay
    ]
]

Soldier >> heroDoesNotWantToPlay: [
    communicatesService talkToSoldier_5
    communicatesService talkToSoldier_6
]

Soldier >> heroWantsToPlay: [
    communicatesService talkToSoldier_7
    (hero has: umbrella)
    ifTrue: [
        self heroHasUmbrella
    ]
    ifFalse: [
        self herohasNotUmbrella
    ]
]

Soldier >> heroHasUmbrella: [
    communicatesService talkToSoldier_8
    communicatesService talkToSoldier_9
    communicatesService talkToSoldier_10
    communicatesService talkToSoldier_11
    self heroWon
]

Soldier >> herohasNotUmbrella: [
    communicatesService talkToSoldier_13
]

Soldier >> heroWon: [
    self hasPlayedCards: true
    self removeItem: helmet
    hero addItem: helmet
]
