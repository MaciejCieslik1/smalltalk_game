Npc subclass: Soldier [
    | items hasPlayedCards |

    initialize: newLocation helmet: newHelmet [
        super initializeWithName: 'soldier' rank: 'private' location: newLocation isKillable: false.
        items := Array with: newHelmet.
        hasPlayedCards := false.
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

    hasPlayedCards [
        ^ hasPlayedCards
    ]

    hasPlayedCards: newHasPlayedCards [
        hasPlayedCards := newHasPlayedCards
    ]

    createInfo [
        | info |
        info := super createInfo,
                'Items: ', (self items joinSeparatedBy: ', '), String cr.
        ^ info
    ]

    interaction: hero [
        (self hasPlayedCards)
        ifTrue: [
            self alreadyPlayedOption
        ]
        ifFalse: [
            self firstGameOption: hero
        ].
    ]

    alreadyPlayedOption [
        communicatesService talkToSoldier_12
    ]

    firstGameOption: hero [
        self introductionDialogue.
        self hasHeroWillToPlay: hero.
    ]

    introductionDialogue [
        communicatesService talkToSoldier_1
        communicatesService talkToSoldier_2
        communicatesService talkToSoldier_3
        communicatesService talkToSoldier_4
    ]

    hasHeroWillToPlay: hero [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self heroDoesNotWantToPlay.
        ].
        (inputOption = $b) 
        ifTrue: [
            self heroWantsToPlay: hero.
        ].
    ]

    heroDoesNotWantToPlay [
        communicatesService talkToSoldier_5
        communicatesService talkToSoldier_6
    ]

    heroWantsToPlay: hero [
        communicatesService talkToSoldier_7.
        (hero hasItemWithName: 'umbrella')
        ifTrue: [
            self heroHasUmbrella: hero.
        ]
        ifFalse: [
            self herohasNotUmbrella.
        ].
    ]

    heroHasUmbrella: hero [
        communicatesService talkToSoldier_8
        communicatesService talkToSoldier_9
        communicatesService talkToSoldier_10
        communicatesService talkToSoldier_11.
        self heroWon: hero.
    ]

    herohasNotUmbrella [
        communicatesService talkToSoldier_13
    ]

    heroWon: hero [
        | helmet |
        self hasPlayedCards: true.
        (self hasItem: items first)
        ifTrue: [
            helmet := items first.
            self removeItem: helmet.
            hero addItem: helmet.
        ]
        
    ]
]
