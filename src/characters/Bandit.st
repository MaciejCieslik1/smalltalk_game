Npc subclass: #Bandit

Bandit >> initialize: [
    super initialize: 'bandit' 
        rank := private 
        location: emptyRoomB 
        isKillable: true
]

Bandit >> interaction: [
    bandit introductionDialogue
    (hero hasItem: helmet)
    ifTrue: [
        self figthUsingHelmet
    ]
    ifFalse: [
        self figthWithoutHelmet
    ]
]

Bandit >> introductionDialogue :[
    communicatesService talkToBandit_1
    communicatesService talkToBandit_2
    communicatesService talkToBandit_3
    inputService inputCharacter: ('a')
    communicatesService talkToBandit_4
    communicatesService talkToBandit_5
    communicatesService talkToBandit_6
]

Bandit >> figthUsingHelmet: [
    communicatesService talkToBandit_7
    communicatesService talkToBandit_8
    (hero hasItem: baton)
    ifTrue: [
        self figthUsingBaton
    ]
    ifFalse: [
        self figthUsingFists
    ]
]

Bandit >> figthWithoutHelmet: [
    communicatesService talkToBandit_19
    communicatesService talkToBandit_17
    (hero hasItem: baton)
    ifTrue: [
        communicatesService talkToBandit_20
    ]
    ifFalse: [
        communicatesService talkToBandit_21
    ]
    hero heroKilled
]


Bandit >> figthUsingBaton: [
    communicatesService talkToBandit_9
    inputService inputCharacter: ('a')
    communicatesService talkToBandit_10
    communicatesService talkToBandit_11
    communicatesService talkToBandit_12
    self npcKilled
]

Bandit >> figthUsingFists: [
    communicatesService talkToBandit_13
    inputService inputCharacter: ('a')
    communicatesService talkToBandit_14
    communicatesService talkToBandit_15
    communicatesService talkToBandit_16
    communicatesService talkToBandit_17
    communicatesService talkToBandit_18
    hero getWounded
]
