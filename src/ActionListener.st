Object subclass: ActionListener [ 
    | communicatesService inputService movement |

    initialize: newCommunicatesService 
        inputService: newInputService
    [
        communicatesService := newCommunicatesService.
        inputService := newInputService
    ]

    chooseAction: hero [
        | result command argument |
        [
            result := inputService inputCommand.
            command := result first.
            argument := result second.
            (command = '0' and: [ argument = '0' ])
        ] whileTrue.
        (command = 'go')
        ifTrue: [
            self checkArgumentGo: argument
        ].
        (command = 'pick')
        ifTrue: [
            self checkArgumentPick: argument
        ].
        (command = 'interact')
        ifTrue: [
            self checkArgumentInteract: argument
        ].
        (command = 'attack')
        ifTrue: [
            self checkArgumentAttack: argument
        ].
        (command = 'info')
        ifTrue: [
            self checkArgumentInfo: argument
        ].
        (command = 'description')
        ifTrue: [
            self checkArgumentDescription: argument
        ].
        (command = 'poison')
        ifTrue: [
            self checkArgumentPoison: hero argument2: argument
        ].
        (command = 'chloroform')
        ifTrue: [
            self checkArgumentChloroform: argument
        ].
        (command = 'help')
        ifTrue: [
            communicatesService help
        ].
    ]

    checkArgumentGo: argument [
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

    checkArgumentPick: hero argument2: argument [
        | validArguments |
        validArguments := #('lever' 'apple_juice' 'orange_juice' 'multivitamina_juice' 'poison' 'vitamins' 'bandage' 'baton' 'chloroform'
                            'umbrella' 'rag' 'chloroform_rag' 'letter' 'poisoned_apple_juice' 'poisoned_orange_juice' 
                            'poisoned_multivitamina_juice' 'money' 'id' 'mid_rank_pass' 'red_key' 'amber').
        (validArguments includes: argument)
        ifTrue: [
            self pickCheckIfItemAccessible: hero
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    pickCheckIfItemAccessible: hero argument2: argument [
        (hero location hasItemName: argument)
        ifTrue: [
            hero location pickUpItem: argument
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    checkArgumentInteract: hero argument2: argument [
        | validArguments |
        validArguments := #('lever' 'apple_juice' 'orange_juice' 'multivitamina_juice' 'poison' 'vitamins' 'bandage' 'baton' 'chloroform'
                            'umbrella' 'rag' 'chloroform_rag' 'letter' 'poisoned_apple_juice' 'poisoned_orange_juice' 
                            'poisoned_multivitamina_juice' 'money' 'id' 'mid_rank_pass' 'red_key' 'amber').
        (validArguments includes: argument)
        ifTrue: [
            self interactCheckIfItemAccessible: hero
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    interactCheckIfItemAccessible: hero argument2: argument [
        (hero location hasItemName: argument)
        ifTrue: [
            hero location interactWithItem: argument
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    checkArgumentAttack: hero argument2: argument [
        | validArguments |
        validArguments := #('guard1' 'guard3' 'guard4' 'waiter').
        (validArguments includes: argument)
        ifTrue: [
            self attackCheckIfRoomHasNpc: hero
        ]
        ifFalse: [
            communicatesService cannotAttackPerson
        ]
    ]

    attackCheckIfRoomHasNpc: hero npc: npcName [
        (hero location hasNpc)
        ifTrue: [
            self attackCheckIfNpcAccessible: npcName
        ]
        ifFalse: [
            communicatesService roomHasNoNpc
        ]
    ]

    attackCheckIfNpcAccessible: hero npc: npcName [
        (hero location findNpcByName: npcName)
        ifTrue: [
            hero attack: npcName
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    checkArgumentInfo: hero argument2: argument [
        | validArguments |
        validArguments := #('bandit' 'chef' 'adolf' 'guard1' 'guard2' 'guard3' 'guard4' 'Johannes_Golmer' 'salesman' 'soldier' 'waiter').
        (validArguments includes: argument)
        ifTrue: [
            self displayInfoCheckIfRoomHasNpc: hero argument2: argument
        ]
        ifFalse: [
            communicatesService cannotDisplayInfo
        ]
    ]

    displayInfoCheckIfRoomHasNpc: hero npc: npcName [
        (hero location hasNpc)
        ifTrue: [
            self displayInfoCheckIfNpcAccessible: hero npc: npcName
        ]
        ifFalse: [
            communicatesService roomHasNoNpc
        ]
    ]

    displayInfoCheckIfNpcAccessible: hero npc: npcName [
        | npc npcInfo |
        (hero location findNpcByName: npcName)
        ifTrue: [
            npc := hero location findNpcByName: npcName.
            npcInfo := npc createInfo.
            communicatesService printStringNewLine: npcInfo
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    dipslayNpcInfo: hero npc: npcName [
        | npc npcInfo |
        npc := hero location findNpcByName: npcName. 
        npcInfo := npc createInfo. 
        communicatesService printStringNewLine: npcInfo
    ]

    checkArgumentPoison: hero argument2: argument [
        | validArguments |
        validArguments := #('appleJuice' 'orangeJuice' 'multivitaminaJuice').
        (validArguments includes: argument)
        ifTrue: [
            hero addPoison: argument
        ]
        ifFalse: [
            communicatesService cannotPoisonItem
        ]
    ]

    checkArgumentChloroform: hero argument2: argument [
        | validArguments rag |
        validArguments := 'rag'.
        (validArguments = argument)
        ifTrue: [
            self addChloroformToRag: hero rag: validArguments
        ]
        ifFalse: [
            communicatesService cannotChlorofomItem
        ]
    ]

    addChloroformToRag: hero rag: ragName [
        | rag |
        (hero hasItemWithName: ragName)
        ifTrue: [
            rag := hero findItemWithName: ragName
            hero addChloroform: rag 
        ]
    ]
]
