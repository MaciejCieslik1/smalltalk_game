Object subclass: ActionListener [ 
    | hero movement map communicatesService inputService |

    initialize: newHero
        movement: newMovement
        map: newMap
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        hero := newHero.
        movement := newMovement.
        map := newMap.
        communicatesService := newCommunicatesService.
        inputService := newInputService
    ]

    chooseAction [
        | result command argument |
        [
            result := (inputService inputCommand) asString substrings: ' '.
            command := result first asString.
            argument := result second asString.
            (command = '0' and: [ argument = '0' ])
        ] whileTrue.
        (command = 'go')
        ifTrue: [
            self checkArgumentGo: argument
        ].
        (command = 'talk')
        ifTrue: [
            self checkArgumentTalk: argument
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
            self checkArgumentPoison: argument
        ].
        (command = 'chloroform')
        ifTrue: [
            self checkArgumentChloroform: argument
        ].
        (command = 'map')
        ifTrue: [
            map createMap 
        ].
        (command = 'help')
        ifTrue: [
            communicatesService help
        ].
        (command = 'room')
        ifTrue: [
            self checkArgumentRoom
        ].
        (command = 'quit')
        ifTrue: [
            ^ true
        ].
        ^ false.
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

    checkArgumentTalk: argument [
        | npc |
        (hero location hasNpcName: argument)
        ifTrue: [
            npc := hero location findNpcByName: argument.
            npc interaction.
        ]
        ifFalse: [
            communicatesService invalidArgument
        ].
    ]

    checkArgumentPick: argument [
        | validArguments |
        validArguments := #('lever' 'apple_juice' 'orange_juice' 'multivitamina_juice' 'poison' 'vitamins' 'bandage' 'baton' 'chloroform'
                            'umbrella' 'rag' 'chloroform_rag' 'letter' 'poisoned_apple_juice' 'poisoned_orange_juice' 
                            'poisoned_multivitamina_juice' 'money' 'id' 'mid_rank_pass' 'red_key' 'amber').
        (validArguments includes: argument)
        ifTrue: [
            self pickCheckIfItemAccessible: argument
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    pickCheckIfItemAccessible: argument [
        (hero location hasItemName: argument)
        ifTrue: [
            hero location pickUpItem: argument character: hero
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    checkArgumentInteract: argument [
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

    interactCheckIfItemAccessible: argument [
        (hero location hasItemName: argument)
        ifTrue: [
            hero location interactWithItem: argument
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    checkArgumentAttack: argument [
        | validArguments |
        validArguments := #('guard1' 'guard3' 'guard4' 'waiter').
        (validArguments includes: argument)
        ifTrue: [
            self attackCheckIfRoomHasNpc: argument
        ]
        ifFalse: [
            communicatesService cannotAttackPerson
        ]
    ]

    attackCheckIfRoomHasNpc: npcName [
        (hero location hasNpc)
        ifTrue: [
            self attackCheckIfNpcAccessible: npcName
        ]
        ifFalse: [
            communicatesService roomHasNoNpc
        ]
    ]

    attackCheckIfNpcAccessible: npcName [
        (hero location findNpcByName: npcName)
        ifTrue: [
            hero attack: npcName
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    checkArgumentInfo: argument [
        | validArguments |
        validArguments := #('bandit' 'chef' 'adolf' 'guard1' 'guard2' 'guard3' 'guard4' 'Johannes_Golmer' 'salesman' 'soldier' 'waiter').
        (validArguments includes: argument)
        ifTrue: [
            self displayInfoCheckIfRoomHasNpc: argument
        ].
        (argument = 'hero')
        ifTrue: [
            self displayInfoHero: argument
        ]
        ifFalse: [
            communicatesService cannotDisplayInfo
        ].
    ]

    displayInfoCheckIfRoomHasNpc: npcName [
        (hero location hasNpc)
        ifTrue: [
            self displayInfoCheckIfNpcAccessible: npcName
        ]
        ifFalse: [
            communicatesService roomHasNoNpc
        ]
    ]

    displayInfoCheckIfNpcAccessible: npcName [
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

    dipslayNpcInfo: npcName [
        | npc npcInfo |
        npc := hero location findNpcByName: npcName. 
        npcInfo := npc createInfo. 
        communicatesService printStringNewLine: npcInfo
    ]

    displayInfoHero: argument [
        | heroInfo |
        hero createInfo.
    ]

    checkArgumentPoison: argument [
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

    checkArgumentChloroform: argument [
        | validArguments rag |
        validArguments := 'rag'.
        (validArguments = argument)
        ifTrue: [
            self addChloroformToRag: validArguments
        ]
        ifFalse: [
            communicatesService cannotChlorofomItem
        ]
    ]

    addChloroformToRag: ragName [
        | rag |
        (hero hasItemWithName: ragName)
        ifTrue: [
            rag := hero findItemWithName: ragName
            hero addChloroform: rag 
        ]
    ]

    checkArgumentRoom [
        communicatesService printStringNewLine: hero location name.
        communicatesService printItems: hero location itemsList.
        (hero location hasNpc)
        ifTrue: [
            communicatesService printNpcs: hero location npcList.
        ]
        ifFalse: [
            communicatesService printStringNewLine: 'Npcs: '.
        ]   
    ]
]
