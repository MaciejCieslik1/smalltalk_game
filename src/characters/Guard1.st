Guard subclass: Guard1 [
    | midRankPass |

    initialize: newLocation 
        hero: newHero
        roomService: newRoomService
        midRankPass: newMidRankPass
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'guard1' 
            location: newLocation 
            isKillable: true
            hero: newHero
            roomService: newRoomService
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        midRankPass := newMidRankPass.
    ]

    interaction [
        (self hasPermission)
        ifTrue: [
            communicatesService authorized
        ]
        ifFalse: [
            self conversation
        ].
    ]

    conversation [
        self introductionDialogue.
        self showDialogueOptions.
    ]

    introductionDialogue [
        communicatesService talkToGuard1_1.
        communicatesService talkToGuard1_2.
        communicatesService talkToGuard1_3.
    ]

    showDialogueOptions [
        (hero hasItemWithName: 'id')
        ifTrue: [
            self hasIdDialogueOptionHandling.
        ]
        ifFalse: [
            inputService inputCharacter: #($a).
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
        communicatesService talkToGuard_HereItIs.
        communicatesService talkToGuard1_8.
        communicatesService talkToGuard_wayNorthAccessible.
        roomService openIdRooms.
    ]

    openedRoomsInteraction [
        communicatesService authorized
    ]

    attacked [
        self npcKilled.
        communicatesService killedGuard1.
        communicatesService stealMidRankPass.
        communicatesService accessToArmory.
        roomService openArmory.
        hero addItem: midRankPass.
    ]
]
