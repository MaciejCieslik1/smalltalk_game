Npc subclass: Bandit [
    | hero |
    initialize: newLocation hero: newHero [
        super initializeWithName: 'bandit' rank: 'private' location: newLocation isKillable: true.
        hero := newHero
    ]

    interaction [
        self introductionDialogue.
        (hero hasItemWithName: 'helmet')
        ifTrue: [
            self figthUsingHelmet.
        ]
        ifFalse: [
            self figthWithoutHelmet.
        ].
    ]

    introductionDialogue [
        communicatesService talkToBandit_1
        communicatesService talkToBandit_2
        communicatesService talkToBandit_3.
        inputService inputCharacter: ('a').
        communicatesService talkToBandit_4
        communicatesService talkToBandit_5
        communicatesService talkToBandit_6
    ]

    figthUsingHelmet [
        communicatesService talkToBandit_7
        communicatesService talkToBandit_8.
        (hero hasItemWithName: 'baton')
        ifTrue: [
            self figthUsingBaton.
        ]
        ifFalse: [
            self figthUsingFists.
        ].
    ]

    figthWithoutHelmet [
        communicatesService talkToBandit_19
        communicatesService talkToBandit_17.
        (hero hasItemWithName: 'baton')
        ifTrue: [
            communicatesService talkToBandit_20
        ]
        ifFalse: [
            communicatesService talkToBandit_21
        ].
        hero heroKilled
    ]


    figthUsingBaton [
        communicatesService talkToBandit_9.
        inputService inputCharacter: ('a').
        communicatesService talkToBandit_10
        communicatesService talkToBandit_11
        communicatesService talkToBandit_12.
        self npcKilled.
    ]

    figthUsingFists [
        communicatesService talkToBandit_13.
        inputService inputCharacter: ('a').
        communicatesService talkToBandit_14
        communicatesService talkToBandit_15
        communicatesService talkToBandit_16
        communicatesService talkToBandit_17
        communicatesService talkToBandit_18
        hero getWounded
    ]
]
