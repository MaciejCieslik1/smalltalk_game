Guard subclass: #Guard3

Guard3 >> initialize: [
    super initialize: 'guard3' 
        location: fuhrersOffice
        isKillable: true
]

Guard3 >> interaction: [
    communicatesService talkToGuard3_1
]

Guard3 >> interactionShooting: [
    communicatesService talkToGuard3_2
    (hero hasItem: bulletproofVest) 
    ifTrue: [
        self usedVest
    ]
    ifFalse: [
        self notUsedVest
    ]
]

Guard3 >> usedVest: [
    communicatesService talkToGuard3_3
    communicatesService talkToGuard3_4
    communicatesService talkToGuard3_5
    inputService inputCharacter: ('a')
    communicatesService talkToGuard3_6
    communicatesService talkToGuard3_7
    communicatesService talkToGuard3_8
    communicatesService talkToGuard_wayNorthAccessible
]

Guard3 >> notUsedVest: [
    communicatesService talkToGuard3_9
    communicatesService talkToGuard_wakeUpInMedbay
    communicatesService talkToGuard_needVest
    hero getWounded
]

Guard3 >> interactionBeverages: [
    self introductionDialogue
    self chooseJuice
]

Guard3 >> chooseJuice: [
    (hero hasItem: poisonedAppleJuice)
    ifTrue: [
        communicatesService talkToGuard3_12
        inputService inputCharacter: ('a')
        communicatesService talkToGuard3_13
        deliverDrink
    ]
    (hero hasItem: poisonedOrangeJuice)
    ifTrue: [
        communicatesService talkToGuard3_22
        inputService inputCharacter: ('a')
        communicatesService talkToGuard3_23
        deliverDrink
    ]
    (hero hasItem: poisonedMultivitaminaJuice)
    ifTrue: [
        communicatesService talkToGuard3_27
        inputService inputCharacter: ('a')
        communicatesService talkToGuard3_28
        deliverDrink
    ]
]

Guard3 >> introductionDialogue: [
    communicatesService talkToGuard3_10
    communicatesService talkToGuard3_11
]

Guard3 >> deliverDrink: [
    communicatesService talkToGuard3_14
    communicatesService talkToGuard3_15
    communicatesService talkToGuard3_16
    communicatesService talkToGuard3_17
    communicatesService talkToGuard3_18
    communicatesService talkToGuard3_19
    communicatesService talkToGuard3_20
    communicatesService talkToGuard3_21
    roomService openKitchenExit
]

Guard3 >> attacked [
    self guardKilled
    communicatesService killedGuard3
    guard4 interactionShooting
]

Guard3 >> guardKilled: [
    self isAlive: false
]
