Guard subclass: Guard4 [

    initialize: newLocation [
        super initializeWithName: 'guard4' 
            location: newLocation
            isKillable: true
    ]

    interaction [
        (self hasPermission)
        ifTrue: [
            communicatesService authorized
        ]
        ifFalse: [
            self conversation.
        ].
    ]

    conversation: juices [
        self introductionDialogue.
        self chooseDialogueOption: juices.
    ]

    introductionDialogue [
        communicatesService talkToGuard4_1
        communicatesService talkToGuard4_2
        communicatesService talkToGuard4_3
    ]

    chooseDialogueOption: juices [
        (hero hasUniformWithName = 'serviceUniform' and: [hero hasPoisonedJuice: juices]) 
        ifTrue: [
            self trueWaiterCondition.
        ]
        ifFalse: [
            self falseWaiterCondition.
        ].
    ]

    trueWaiterCondition [
        | inputOption |
        communicatesService talkToGuard4_6.
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self aOptionWaiterCondition.
        ].
        (inputOption = $b) 
        ifTrue: [
            self bOptionWaiterCondition.
        ].
    ]

    aOptionWaiterCondition [
        communicatesService talkToGuard4_4
        communicatesService talkToGuard4_5
    ]

    bOptionWaiterCondition [
        communicatesService talkToGuard4_7
        communicatesService talkToGuard4_6
        guard3 interactionBeverages
    ]

    falseWaiterCondition [
        inputService inputCharacter: ('a')
        communicatesService talkToGuard4_4
        communicatesService talkToGuard4_5
    ]

    interactionShooting [
        communicatesService talkToGuard4_8.
        (hero hasItemWithItem: 'bulletproofVest') 
        ifTrue: [
            self usedVest.
        ]
        ifFalse: [
            self notUsedVest.
        ].
    ]

    usedVest [
        communicatesService talkToGuard4_9
        communicatesService talkToGuard4_10
        communicatesService talkToGuard4_11
        inputService inputCharacter: ('a')
        communicatesService talkToGuard4_12
        communicatesService talkToGuard4_13
        communicatesService talkToGuard4_14
        communicatesService talkToGuard_wayNorthAccessible
    ]

    notUsedVest [
        communicatesService talkToGuard4_15
        communicatesService talkToGuard_wakeUpInMedbay
        communicatesService talkToGuard_needVest
        hero getWounded
    ]

    attacked [
        self npcKilled.
        communicatesService killedGuard4
        guard3 interactionShooting
    ]
]
