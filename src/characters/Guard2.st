Guard subclass: Guard2 [
    | hasHigherPermission juices | 

    initialize: newLocation 
        hero: newHero 
        roomService: newRoomService
        juices: newJuices
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'guard2'
            location: newLocation 
            isKillable: false
            hero: newHero 
            roomService: newRoomService
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        juices := newJuices.
        hasHigherPermission := false.
    ]

    interaction [
        (self hasPermission and: [self hasHigherPermission])
        ifTrue: [
            communicatesService authorized
        ]
        ifFalse: [
            self conversation.
        ].
    ]

    conversation [
        self introductionDialogue.
        self showDialogueOptions.
    ]

    introductionDialogue [
        communicatesService talkToGuard2_1.
        communicatesService talkToGuard2_2.
        communicatesService talkToGuard2_3.
    ]

    showDialogueOptions [
        ((hero hasUniformWithName: 'service_uniform') and: [hero hasPoisonedJuice: juices])
        ifTrue: [
            self usedServiceUniform.
        ]
        ifFalse: [
            self usedMilitaryUniform.
        ].
    ]

    usedServiceUniform [
        | inputOption |
        communicatesService talkToGuard2_12.
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self aOptionWaiter.
        ].
        (inputOption = $b) 
        ifTrue: [
            self bOptionWaiter.
        ].
    ]

    aOptionWaiter [
        communicatesService talkToGuard2_4.
        communicatesService talkToGuard2_5.
    ]

    bOptionWaiter [
        communicatesService talkToGuard2_13.
        communicatesService talkToGuard2_14.
        communicatesService talkToGuard2_wayWestAccessible.
        roomService openOffices.
        hero hasShowedRedKey: true.
    ]

    usedMilitaryUniform [
        self dipslayDialogues.
        (hero hasItemWithName: 'red_key')
        ifTrue: [
            self heroHasRedKey.
        ]
        ifFalse: [
            (hero hasItemWithName: 'mid_rank_pass')
            ifTrue: [
                self heroHasMidPass.
            ]
            ifFalse: [
                self heroHasId.
            ].
        ].
    ]

    dipslayDialogues [
        (hero hasItemWithName: 'id')
        ifTrue: [
            communicatesService talkToGuard2_6
        ].
        (hero hasItemWithName: 'mid_rank_pass')
        ifTrue: [
            communicatesService talkToGuard2_8
        ].
        (hero hasItemWithName: 'red_key')
        ifTrue: [
            communicatesService talkToGuard2_10
        ].
    ]

    heroHasRedKey [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b $c $d).
        (inputOption = $a) 
        ifTrue: [
            self aOptionMilitaryUniform.
        ].
        (inputOption = $b) 
        ifTrue: [
            self bOptionMilitaryUniform.
        ].
        (inputOption = $c) 
        ifTrue: [
            self cOptionMilitaryUniform.
        ].
        (inputOption = $d) 
        ifTrue: [
            self dOptionMilitaryUniform.
        ].
    ]

    heroHasMidPass [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b $c).
        (inputOption = $a) 
        ifTrue: [
            self aOptionMilitaryUniform.
        ].
        (inputOption = $b) 
        ifTrue: [
            self bOptionMilitaryUniform.
        ].
        (inputOption = $c) 
        ifTrue: [
            self cOptionMilitaryUniform.
        ].
    ]

    heroHasId [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self aOptionMilitaryUniform.
        ].
        (inputOption = $b) 
        ifTrue: [
            self bOptionMilitaryUniform.
        ].
    ]

    aOptionMilitaryUniform [
        communicatesService talkToGuard2_4.
        communicatesService talkToGuard2_5.
    ]

    bOptionMilitaryUniform [
        communicatesService talkToGuard2_15.
        communicatesService talkToGuard2_7.
    ]

    cOptionMilitaryUniform [
        communicatesService talkToGuard2_15.
        communicatesService talkToGuard2_11.
        communicatesService talkToGuard_wayNorthAccessible.
        roomService openArchives.
    ]

    dOptionMilitaryUniform [
        communicatesService talkToGuard2_15.
        communicatesService talkToGuard2_11.
        communicatesService talkToGuard2_wayWestAccessible.
        roomService openOffices.
        hero hasShowedRedKey: true.
    ]
]
