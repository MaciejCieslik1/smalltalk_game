Npc subclass: #Chef

Chef >> initialize: [
    super initialize 'chef' civil cafateria false
]

Chef >> conversationWithHero: [
    self introductionDialogue
    self showDialogueOptions
    self dialogueOptionHandling 
]   

Chef >> introductionDialogue: [
    communicatesService talkToChef_1
    communicatesService talkToChef_2
    communicatesService talkToChef_3
] 

Chef >> showDialogueOptions: [
    (hero hasItem: id)
    ifTrue: [
        communicatesService talkToChef_6
    ]
    (hero hasItem: midRankPass)
    ifTrue: [
        communicatesService talkToChef_8
    ]
] 

Chef >> dialogueOptionHandling: [
    (hero hasItem: midRankPass)
    ifTrue: [
        self midRankPassOptionHandling
    ]
    ifFalse: [
        self noneMidRankPassOptionHandling
    ]
]

Chef >> midRankPassOptionHandling: [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b $c).
    (inputOption = $a) 
    ifTrue: [
        self aOptionHandling
    ]
    (inputOption = $b) 
    ifTrue: [
        self bOptionHandling
    ]
    (inputOption = $c) 
    ifTrue: [
        self cOptionHandling
    ]
]

Chef >> noneMidRankPassOptionHandling: [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b).
    (inputOption = $a) 
    ifTrue: [
        self aOptionHandling
    ]
    (inputOption = $b) 
    ifTrue: [
        self bOptionHandling
    ]
]

Chef >> aOptionHandling: [
    communicatesService talkToChef_4
    communicatesService talkToChef_5
]

Chef >> bOptionHandling: [
    communicatesService talkToChef_9
    communicatesService talkToBandit_7
]

Chef >> cOptionHandling: [
    communicatesService talkToChef_9
    communicatesService talkToBandit_10
    communicatesService talkToChef_wayEastAcessible
    roomService openMiddlePassRooms
]