Npc subclass: Chef [
    | hero roomService |

    initialize: newLocation 
        hero: newHero 
        roomService: newRoomService
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'chef' 
            rank: 'civil' 
            location: newLocation 
            isKillable: false
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        hero := newHero.
        roomService := newRoomService.
    ]

    interaction [
        self introductionDialogue.
        self showDialogueOptions.
        self dialogueOptionHandling.
    ]   

    introductionDialogue [
        communicatesService talkToChef_1.
        communicatesService talkToChef_2.
        communicatesService talkToChef_3.
    ] 

    showDialogueOptions  [
        (hero hasItemWithName: 'id')
        ifTrue: [
            communicatesService talkToChef_6
        ].
        (hero hasItemWithName: 'mid_rank_pass')
        ifTrue: [
            communicatesService talkToChef_8
        ].
    ] 

    dialogueOptionHandling [
        (hero hasItemWithName: 'mid_rank_pass')
        ifTrue: [
            self midRankPassOptionHandling
        ]
        ifFalse: [
            self noneMidRankPassOptionHandling
        ].
    ]

    midRankPassOptionHandling [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b $c).
        (inputOption = $a) 
        ifTrue: [
            self aOptionHandling
        ].
        (inputOption = $b) 
        ifTrue: [
            self bOptionHandling
        ].
        (inputOption = $c) 
        ifTrue: [
            self cOptionHandling
        ].
    ]

    noneMidRankPassOptionHandling [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b).
        (inputOption = $a) 
        ifTrue: [
            self aOptionHandling
        ].
        (inputOption = $b) 
        ifTrue: [
            self bOptionHandling
        ].
    ]

    aOptionHandling [
        communicatesService talkToChef_4.
        communicatesService talkToChef_5.
    ]

    bOptionHandling [
        communicatesService talkToChef_9.
        communicatesService talkToChef_7.
    ]

    cOptionHandling [
        communicatesService talkToChef_9.
        communicatesService talkToChef_10.
        communicatesService talkToChef_wayEastAcessible.
        roomService openKitchen.
    ]

    openedRoomsInteraction [
        communicatesService authorized
    ]
]
