Npc subclass: Chef [
    | hero |

    initialize: newLocation 
        hero: newHero 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'chef' 
            rank: 'civil' 
            location: newLocation 
            isKillable: false
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        hero := newHero
    ]

    interaction [
        self introductionDialogue.
        self showDialogueOptions.
        self dialogueOptionHandling.
    ]   

    introductionDialogue [
        communicatesService talkToChef_1
        communicatesService talkToChef_2
        communicatesService talkToChef_3
    ] 

    showDialogueOptions  [
        (hero hasItemWithName: 'id')
        ifTrue: [
            communicatesService talkToChef_6
        ].
        (hero hasItemWithName: 'midRankPass')
        ifTrue: [
            communicatesService talkToChef_8
        ].
    ] 

    dialogueOptionHandling [
        (hero hasItemWithName: 'midRankPass')
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
        communicatesService talkToChef_4
        communicatesService talkToChef_5
    ]

    bOptionHandling [
        communicatesService talkToChef_9
        communicatesService talkToBandit_7
    ]

    cOptionHandling [
        communicatesService talkToChef_9
        communicatesService talkToBandit_10
        communicatesService talkToChef_wayEastAcessible
        roomService openKitchen
    ]

    openedRoomsInteraction [
        communicatesService authorized
    ]
]
