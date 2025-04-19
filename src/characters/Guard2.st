Guard subclass: #Guard2

Guard2 >> initialize: [
    super initialize: 'guard2'
        location: securityCheckOffices 
        isKillable: false
]

Guard2 >> interaction: [
    self introductionDialogue
    self showDialogueOptions
]

Guard2 >> introductionDialogue: [
    communicatesService talkToGuard2_1
    communicatesService talkToGuard2_2
    communicatesService talkToGuard2_3
]

Guard2 >> showDialogueOptions: [
    (hero uniform == serviceUniform): 
    ifTrue: [
        self usedServiceUniform
    ]
    ifFalse: [
        self usedMilitaryUniform
    ]
]

Guard2 >> usedServiceUniform: [
    | inputOption |
    communicatesService talkToGuard2_13
    inputOption := inputService inputCharacter: #($a $b)
    (inputOption = $a) 
    ifTrue: [
        self aOptionWaiter
    ]
    (inputOption = $b) 
    ifTrue: [
        self bOptionWaiter
    ]
]

Guard2 >> aOptionWaiter: [
    communicatesService talkToGuard2_4
    communicatesService talkToGuard2_5
]

Guard2 >> bOptionWaiter: [
    communicatesService talkToGuard2_13
    communicatesService talkToGuard2_14
    communicatesService talkToGuard2_wayWestAccessible
]

Guard2 >> usedMilitaryUniform: [
    self dipslayDialogues
    (hero hasItem: redKey):
    ifTrue: [
        self heroHasRedKey
    ]
    ifFalse: [
        (hero hasItem: midRankPass):
        ifTrue: [
            self heroHasMidPass
        ]
        ifFalse: [
            self heroHasId
        ]
    ]
]

Guard2 >> dipslayDialogues: [
    (hero hasItem: id): 
    ifTrue: [
        communicatesService talkToGuard2_6
    ]
    (hero hasItem: midRankPass): 
    ifTrue: [
        communicatesService talkToGuard2_8
    ]
    (hero hasItem: redKey): 
    ifTrue: [
        communicatesService talkToGuard2_10
    ]
]

Guard2 >> heroHasRedKey: [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b $c $d)
    (inputOption = $a) 
    ifTrue: [
        self aOptionMilitaryUniform
    ]
    (inputOption = $b) 
    ifTrue: [
        self bOptionMilitaryUniform
    ]
    (inputOption = $c) 
    ifTrue: [
        self cOptionMilitaryUniform
    ]
    (inputOption = $d) 
    ifTrue: [
        self dOptionMilitaryUniform
    ]
]

Guard2 >> heroHasMidPass: [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b $c)
    (inputOption = $a) 
    ifTrue: [
        self aOptionMilitaryUniform
    ]
    (inputOption = $b) 
    ifTrue: [
        self bOptionMilitaryUniform
    ]
    (inputOption = $c) 
    ifTrue: [
        self cOptionMilitaryUniform
    ]
]

Guard2 >> heroHasId: [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b)
    (inputOption = $a) 
    ifTrue: [
        self aOptionMilitaryUniform
    ]
    (inputOption = $b) 
    ifTrue: [
        self bOptionMilitaryUniform
    ]
]

Guard2 >> aOptionMilitaryUniform: [
    communicatesService talkToGuard2_4
    communicatesService talkToGuard2_5
]

Guard2 >> bOptionMilitaryUniform: [
    communicatesService talkToGuard2_15
    communicatesService talkToGuard2_7
]

Guard2 >> cOptionMilitaryUniform: [
    communicatesService talkToGuard2_15
    communicatesService talkToGuard2_11
    communicatesService talkToGuard_wayNorthAccessible
    roomService openArchives
]

Guard2 >> dOptionMilitaryUniform: [
    communicatesService talkToGuard2_15
    communicatesService talkToGuard2_11
    communicatesService talkToGuard2_wayWestAccessible
    roomService openOffices
]