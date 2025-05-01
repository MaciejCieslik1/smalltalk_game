Guard subclass: Guard2 [
    | hasHigherPermission | 

    initialize: newLocation 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'guard2'
            location: newLocation 
            isKillable: false
            communicatesService: newCommunicatesService 
            inputService: newInputService.
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
        communicatesService talkToGuard2_1
        communicatesService talkToGuard2_2
        communicatesService talkToGuard2_3
    ]

    showDialogueOptions [
        (hero hasUniformWithName = 'service_uniform' and: [hero hasPoisonedJuice])
        ifTrue: [
            self usedServiceUniform.
        ]
        ifFalse: [
            self usedMilitaryUniform.
        ].
    ]

    usedServiceUniform [
        | inputOption |
        communicatesService talkToGuard2_13.
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
        communicatesService talkToGuard2_4
        communicatesService talkToGuard2_5
    ]

    bOptionWaiter [
        communicatesService talkToGuard2_13
        communicatesService talkToGuard2_14
        communicatesService talkToGuard2_wayWestAccessible
        roomService openOffices
    ]

    usedMilitaryUniform [
        self dipslayDialogues.
        (hero hasItemWithName: 'redKey')
        ifTrue: [
            self heroHasRedKey.
        ]
        ifFalse: [
            (hero hasItemWithName: 'midRankPass')
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
        (hero hasItemWithName: 'midRankPass')
        ifTrue: [
            communicatesService talkToGuard2_8
        ].
        (hero hasItemWithName: 'redKey')
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
        communicatesService talkToGuard2_4
        communicatesService talkToGuard2_5
    ]

    bOptionMilitaryUniform [
        communicatesService talkToGuard2_15
        communicatesService talkToGuard2_7
    ]

    cOptionMilitaryUniform [
        communicatesService talkToGuard2_15
        communicatesService talkToGuard2_11
        communicatesService talkToGuard_wayNorthAccessible
        roomService openArchives
    ]

    dOptionMilitaryUniform [
        communicatesService talkToGuard2_15
        communicatesService talkToGuard2_11
        communicatesService talkToGuard2_wayWestAccessible
        roomService openOffices
    ]
]
