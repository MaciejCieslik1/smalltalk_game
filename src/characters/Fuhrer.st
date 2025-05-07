Npc subclass: Fuhrer [
    | roomService |

    initialize: newLocation 
        roomService: newRoomService
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'adolf' 
            rank: 'fuhrer' 
            location: newLocation 
            isKillable: true
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        roomService := newRoomService.
    ]

    interaction [
        self intruductionDialogue.
        self chooseDialogueOption.
        self endingDialogue.
        self npcKilled.
        communicatesService hitlerShot.
        communicatesService secretExitAccessible.
        roomService openSecretExit.
    ]

    intruductionDialogue [
        communicatesService talkToFuhrer_1.
        communicatesService talkToFuhrer_2.
        communicatesService talkToFuhrer_3.
        communicatesService talkToFuhrer_4.
        communicatesService talkToFuhrer_5.
    ]

    chooseDialogueOption [
        | inputOption |
        inputOption := inputService inputCharacter: #($a $b $c).
        (inputOption = $a) 
        ifTrue: [
            communicatesService talkToFuhrer_6
        ].
        (inputOption = $b) 
        ifTrue: [
            communicatesService talkToFuhrer_7
        ].
        (inputOption = $c) 
        ifTrue: [
            communicatesService talkToFuhrer_8
        ].
    ]

    endingDialogue [
        communicatesService talkToFuhrer_9.
        communicatesService talkToFuhrer_10.
        communicatesService talkToFuhrer_11.
        communicatesService talkToFuhrer_12.
        inputService inputCharacter: ('a').
        communicatesService talkToFuhrer_13
    ]
]