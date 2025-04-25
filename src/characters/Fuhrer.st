Npc subclass: #Fuhrer

Fuhrer >> initialize: [
    super initialize 'adolf' fuhrer fuhrersQuarters true
]

Fuhrer >> interaction: [
    self intruductionDialogue
    self chooseDialogueOption
    self endingDialogue
    self npcKilled
    communicatesService hitlerShot
    ending endCredits
]

Fuhrer >> intruductionDialogue: [
    communicatesService talkToFuhrer_1
    communicatesService talkToFuhrer_2
    communicatesService talkToFuhrer_3
    communicatesService talkToFuhrer_4
    communicatesService talkToFuhrer_5
]

Fuhrer >> chooseDialogueOption: [
    | inputOption |
    inputOption := inputService inputCharacter: #($a $b $c).
    (inputOption = $a) 
    ifTrue: [
        communicatesService talkToFuhrer_6
    ]
    (inputOption = $b) 
    ifTrue: [
        communicatesService talkToFuhrer_7
    ]
    (inputOption = $c) 
    ifTrue: [
        communicatesService talkToFuhrer_8
    ]
]

Fuhrer >> endingDialogue: [
    communicatesService talkToFuhrer_9
    communicatesService talkToFuhrer_10
    communicatesService talkToFuhrer_11
    communicatesService talkToFuhrer_12
    inputService inputCharacter: ('a').
    communicatesService talkToFuhrer_13
]
