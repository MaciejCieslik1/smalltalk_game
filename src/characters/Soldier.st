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
        items := OrderedCollection new.
        items add: newHelmet.
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
        ^ self items includes: item
    ]

    hasPlayedCards [
        ^ hasPlayedCards
    ]

    hasPlayedCards: newHasPlayedCards [
        hasPlayedCards := newHasPlayedCards
    ]

    createInfo [
        communicatesService printStringNewLine: 'Name: ', self name asString.
        communicatesService printStringNewLine: 'Alive status: ', self isAlive printString.
        communicatesService printStringNewLine: 'Location: ', self location name printString.
        communicatesService printStringNewLine: 'Killable status: ', self isKillable printString.
        communicatesService printStringNewLine: 'Rank: ', self rank printString.
        communicatesService printItems: self items.
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
        communicatesService talkToSoldier_1.
        communicatesService talkToSoldier_2.
        communicatesService talkToSoldier_3.
        communicatesService talkToSoldier_4.
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
        communicatesService talkToSoldier_5.
        communicatesService talkToSoldier_6.
    ]

    heroWantsToPlay [
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
        communicatesService talkToSoldier_8.
        communicatesService talkToSoldier_9.
        communicatesService talkToSoldier_10.
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
