Guard subclass: #Guard1

Guard1 >> initialize: [
    super initialize 'guard1' private securityCheckEntry true
]

Guard1 >> interaction: [
    self introductionDialogue
    self showDialogueOptions
]

Guard1 >> introductionDialogue: [
    communicatesService talkToGuard1_1
    communicatesService talkToGuard1_2
    communicatesService talkToGuard1_3
]

Guard1 >> showDialogueOptions: [
    (hero hasItem: id): 
    ifTrue: [
        self hasIdDialogueOptionHandling
    ]
    ifFalse: [
        inputService inputCharacter: ('a')
        communicatesService talkToGuard1_5
    ]
]

Guard1 >> hasIdDialogueOptionHandling: [
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

Guard >> aOptionHandling: [
    communicatesService talkToGuard1_5
]

Guard >> bOptionHandling: [
    communicatesService talkToGuard_HereItIs
    communicatesService talkToGuard1_8
    communicatesService talkToGuard_wayNorthAccessible
    roomService openIdRooms
]

Guard >> openedRoomsInteraction: [
    communicatesService authorized
]
