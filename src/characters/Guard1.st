Guard subclass: Guard1 [

    initialize: newLocation [
        super initializeWithName: 'guard1' 
            location: newLocation 
            isKillable: true.
    ]

    interaction: hero [
        (self hasPermission)
        ifTrue: [
            communicatesService authorized
        ]
        ifFalse: [
            self conversation: hero
        ].
    ]

    conversation: hero [
        self introductionDialogue.
        self showDialogueOptions: hero.
    ]

    introductionDialogue [
        communicatesService talkToGuard1_1
        communicatesService talkToGuard1_2
        communicatesService talkToGuard1_3
    ]

    showDialogueOptions: hero [
        (hero hasItemWithName: 'id')
        ifTrue: [
            self hasIdDialogueOptionHandling.
        ]
        ifFalse: [
            inputService inputCharacter: ('a').
            communicatesService talkToGuard1_5
        ].
    ]

    hasIdDialogueOptionHandling [
        | inputOption |
        communicatesService talkToGuard1_6.
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self aOptionHandling.
        ].
        (inputOption = $b) 
        ifTrue: [
            self bOptionHandling.
        ].
    ]

    aOptionHandling [
        communicatesService talkToGuard1_5
    ]

    bOptionHandling [
        communicatesService talkToGuard_HereItIs
        communicatesService talkToGuard1_8
        communicatesService talkToGuard_wayNorthAccessible
        roomService openIdRooms
    ]

    openedRoomsInteraction [
        communicatesService authorized
    ]

    attacked [
        self npcKilled.
        communicatesService killedGuard1
        communicatesService stealMidRankPass
        communicatesService accessToArmory
    ]
]
