Object subclass: #ActionListener 

ActionListener >> chooseAction [
    | result command argument |
    [
        result := inputService inputCommand.
        command := result first
        argument := result second
        (command = '0' and: [ argument = '0' ])
    ] whileTrue.
    (command = 'go')
    ifTrue: [
        self checkArgumentGo: argument
    ]
    (command = 'pick')
    ifTrue: [
        self checkArgumentPick: argument
    ]
    (command = 'interact')
    ifTrue: [
        self checkArgumentInteract: argument
    ]
    (command = 'attack')
    ifTrue: [
        self checkArgumentAttack: argument
    ]
    (command = 'info')
    ifTrue: [
        self checkArgumentInfo: argument
    ]
    (command = 'description')
    ifTrue: [
        self checkArgumentDescription: argument
    ]
]

self >> checkArgumentGo: argument [
    | validArguments |
    validArguments := #('n' 'w' 's' 'e').
    (validArguments includes: argument)
    ifTrue: [
        movement go: argument
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self >> checkArgumentPick: argument [
    | validArguments |
    validArguments := #('lever' 'apple_juice' 'orange_juice' 'multivitamina_juice' 'poison' 'vitamins' 'bandage' 'baton' 'chloroform'
                        'umbrella' 'rag' 'chloroform_rag' 'letter' 'poisoned_apple_juice' 'poisoned_orange_juice' 
                        'poisoned_multivitamina_juice' 'money' 'id' 'mid_rank_pass' 'red_key' 'amber').
    (validArguments includes: argument)
    ifTrue: [
        self pickCheckIfItemAccessible
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self pickCheckIfItemAccessible: [
    (hero location hasItemName: argument)
    ifTrue: [
        hero location pickUpItem: argument
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self >> checkArgumentInteract: argument [
    | validArguments |
    validArguments := #('lever' 'apple_juice' 'orange_juice' 'multivitamina_juice' 'poison' 'vitamins' 'bandage' 'baton' 'chloroform'
                        'umbrella' 'rag' 'chloroform_rag' 'letter' 'poisoned_apple_juice' 'poisoned_orange_juice' 
                        'poisoned_multivitamina_juice' 'money' 'id' 'mid_rank_pass' 'red_key' 'amber').
    (validArguments includes: argument)
    ifTrue: [
        self interactCheckIfItemAccessible
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self interactCheckIfItemAccessible: [
    (hero location hasItemName: argument)
    ifTrue: [
        hero location interactWithItem: argument
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self >> checkArgumentAttack: argument [
    | validArguments |
    validArguments := #('guard1' 'guard3' 'guard4' 'waiter').
    (validArguments includes: argument)
    ifTrue: [
        self attackCheckIfRoomHasNpc
    ]
    ifFalse: [
        communicatesService cannotAttackPerson
    ]
]

self attackCheckIfRoomHasNpc: npcName [
    (hero location hasNpc)
    ifTrue: [
        self attackCheckIfNpcAccessible: npcName
    ]
    ifFalse: [
        communicatesService roomHasNoNpc
    ]
]

self attackCheckIfNpcAccessible: npcName[
    (hero location findNpcByName: npcName)
    ifTrue: [
        hero attack: npcName
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self >> checkArgumentInfo: argument [
    | validArguments |
    validArguments := #('bandit' 'chef' 'adolf' 'guard1' 'guard2' 'guard3' 'guard4' 'Johannes_Golmer' 'salesman' 'soldier' 'waiter').
    (validArguments includes: argument)
    ifTrue: [
        self displayInfoCheckIfRoomHasNpc: argument
    ]
    ifFalse: [
        communicatesService cannotDisplayInfo
    ]
]

self displayInfoCheckIfRoomHasNpc: npcName [
    (hero location hasNpc)
    ifTrue: [
        self displayInfoCheckIfNpcAccessible: npcName
    ]
    ifFalse: [
        communicatesService roomHasNoNpc
    ]
]

self displayInfoCheckIfNpcAccessible: npcName[
    | npc npcInfo |
    (hero location findNpcByName: npcName)
    ifTrue: [
        npc := hero location findNpcByName: argument 
        npcInfo := npc createInfo 
        communicatesService printStringNewLine: npcInfo
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self >> dipslayNpcInfo: npcName [
    | npc npcInfo|
    npc := hero location findNpcByName: argument 
    npcInfo := npc createInfo 
    communicatesService printStringNewLine: npcInfo
]
