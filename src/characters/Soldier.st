Npc subclass: Soldier [
    | items hasPlayedCards hero |

    initialize: newLocation 
        helmet: newHelmet 
        hero: newHero 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'soldier' 
            rank: 'private' 
            location: newLocation 
            isKillable: false
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        items := Array with: newHelmet.
        hasPlayedCards := false.
        hero := newHero.
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

    interaction [
        (self hasPlayedCards)
        ifTrue: [
            self alreadyPlayedOption
        ]
        ifFalse: [
            self firstGameOption.
        ].
    ]

    alreadyPlayedOption [
        communicatesService talkToSoldier_12
    ]

    firstGameOption [
        self introductionDialogue.
        self hasHeroWillToPlay.
    ]

    introductionDialogue [
        communicatesService talkToSoldier_1
        communicatesService talkToSoldier_2
        communicatesService talkToSoldier_3
        communicatesService talkToSoldier_4
    ]

    hasHeroWillToPlay [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self heroDoesNotWantToPlay.
        ].
        (inputOption = $b) 
        ifTrue: [
            self heroWantsToPlay.
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
            self heroHasUmbrella.
        ]
        ifFalse: [
            self herohasNotUmbrella.
        ].
    ]

    heroHasUmbrella [
        communicatesService talkToSoldier_8
        communicatesService talkToSoldier_9
        communicatesService talkToSoldier_10
        communicatesService talkToSoldier_11.
        self heroWon.
    ]

    herohasNotUmbrella [
        communicatesService talkToSoldier_13
    ]

    heroWon [
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
