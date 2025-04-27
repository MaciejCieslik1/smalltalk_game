Guard subclass: Guard1 [

    initialize: [
        super initializeWithName: 'guard1' 
            location: securityCheckEntry 
            isKillable: true
    ]

    interaction: [
        (self hasPermission)
        ifTrue: [
            communicatesService authorized
        ]
        ifFalse: [
            self conversation
        ]
    ]

    conversation [
        self introductionDialogue
        self showDialogueOptions
    ]

    introductionDialogue: [
        communicatesService talkToGuard1_1
        communicatesService talkToGuard1_2
        communicatesService talkToGuard1_3
    ]

    showDialogueOptions: [
        (hero hasItem: id): 
        ifTrue: [
            self hasIdDialogueOptionHandling
        ]
        ifFalse: [
            inputService inputCharacter: ('a')
            communicatesService talkToGuard1_5
        ]
    ]

    hasIdDialogueOptionHandling: [
        | inputOption |
        communicatesService talkToGuard1_6
        inputOption := inputService inputCharacter: #($a $b)
        (inputOption = $a) 
        ifTrue: [
            self aOptionHandling
        ]
        (inputOption = $b) 
        ifTrue: [
            self bOptionHandling
        ]
    ]

    aOptionHandling: [
        communicatesService talkToGuard1_5
    ]

    bOptionHandling: [
        communicatesService talkToGuard_HereItIs
        communicatesService talkToGuard1_8
        communicatesService talkToGuard_wayNorthAccessible
        roomService openIdRooms
    ]

    openedRoomsInteraction: [
        communicatesService authorized
    ]

    attacked [
        self npcKilled
        communicatesService killedGuard1
        communicatesService stealMidRankPass
        communicatesService accessToArmory
    ]
]
