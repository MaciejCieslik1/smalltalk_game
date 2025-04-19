Guard subclass: #Guard4

Guard4 >> initialize: [
    super initialize: 'guard4' 
        location: fuhrersOffice
        isKillable: true
]

Guard4 >> interaction: [
    self introductionDialogue
    self chooseDialogueOption
]

Guard4 >> introductionDialogue: [
    communicatesService talkToGuard4_1
    communicatesService talkToGuard4_2
    communicatesService talkToGuard4_3
]

Guard4 >> chooseDialogueOption: [
    ((hero uniform = serviceUniform) and: [
    (hero hasItem: poisonedAppleJuice) 
    or: [hero hasItem: poisonedOrangeJuice] 
    or: [hero hasItem: poisonedMultivitaminaJuice]])
    ifTrue: [
        self trueWaiterCondition
    ]
    ifFalse: [
        self falseWaiterCondition
    ]
]

Guard4 >> trueWaiterCondition: [
    communicatesService talkToGuard4_6
    inputOption := inputService inputCharacter: #($a $b)
    (inputOption = $a) 
    ifTrue: [
        self aOptionWaiterCondition
    ]
    (inputOption = $b) 
    ifTrue: [
        self bOptionWaiterCondition
    ]
]

Guard4 >> aOptionWaiterCondition: [
    communicatesService talkToGuard4_4
    communicatesService talkToGuard4_5
]

Guard4 >> bOptionWaiterCondition: [
    communicatesService talkToGuard4_7
    communicatesService talkToGuard4_6
    guard3 interactionBeverages
]

Guard4 >> falseWaiterCondition: [
    inputService inputCharacter: ('a')
    communicatesService talkToGuard4_4
    communicatesService talkToGuard4_5
]

Guard4 >> interactionShooting: [
    communicatesService talkToGuard4_8
    (hero hasItem: bulletproofVest) 
    ifTrue: [
        self usedVest
    ]
    ifFalse: [
        self notUsedVest
    ]
]

Guard4 >> usedVest: [
    communicatesService talkToGuard4_9
    communicatesService talkToGuard4_10
    communicatesService talkToGuard4_11
    inputService inputCharacter: ('a')
    communicatesService talkToGuard4_12
    communicatesService talkToGuard4_13
    communicatesService talkToGuard4_14
    communicatesService talkToGuard_wayNorthAccessible
]

Guard4 >> notUsedVest: [
    communicatesService talkToGuard4_15
    communicatesService talkToGuard_wakeUpInMedbay
    communicatesService talkToGuard_needVest
    hero getWounded
]

Guard4 >> guardKilled: [
    self isAlive: false
]
