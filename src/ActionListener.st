Object subclass: ActionListener [ 
    | hero movement map communicatesService inputService roomService |

    initialize: newHero
        movement: newMovement
        map: newMap
        roomService: newRoomService
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        hero := newHero.
        movement := newMovement.
        map := newMap.
        roomService := newRoomService.
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
        (hero location hasNpc)
        ifTrue: [
            self checkTalkRoomHasNpc: argument
        ]
        ifFalse: [
            communicatesService cannotTalkToPerson
        ].
    ]

    checkTalkRoomHasNpc: argument [
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
            self interactCheckIfItemAccessible: argument
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    interactCheckIfItemAccessible: argument [
        (hero location hasItemName: argument)
        ifTrue: [
            hero location interactWithItem: argument character: hero roomService: roomService
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
        (hero location hasNpcWithName: npcName)
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
        ]
        ifFalse: [
            self checkInfoHero: argument.
        ].
    ]

    checkInfoHero: argument [
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
        (hero location hasNpcWithName: npcName)
        ifTrue: [
            npc := hero location findNpcByName: npcName.
            npc createInfo.
        ]
        ifFalse: [
            communicatesService invalidArgument
        ]
    ]

    displayInfoHero: argument [
        | heroInfo |
        hero createInfo.
    ]

    checkArgumentDescription: argument [
        | validArguments |
        validArguments := #('lever' 'apple_juice' 'orange_juice' 'multivitamina_juice' 'poison' 'vitamins' 'bandage' 'baton' 'chloroform'
                            'umbrella' 'rag' 'chloroform_rag' 'letter' 'poisoned_apple_juice' 'poisoned_orange_juice' 
                            'poisoned_multivitamina_juice' 'money' 'id' 'mid_rank_pass' 'red_key' 'amber').
        (validArguments includes: argument)
        ifTrue: [
            self checkDescriptionRoomHasItem: argument.
        ]
        ifFalse: [
            communicatesService invalidArgument.
        ].
    ]

    checkDescriptionRoomHasItem: argument [
        | item |
        (hero location hasItemWithName: argument)
        ifTrue: [
            item := hero location findItemByName: argument.
            item description.
        ]
        ifFalse: [
            communicatesService roomHasNoItem.
        ].
    ]

    checkArgumentPoison: argument [
        | validArguments juice |
        validArguments := #('apple_juice' 'orange_juice' 'multivitamina_juice').
        (validArguments includes: argument)
        ifTrue: [
            juice := hero findItemWithName: argument.
            self checkHeroHasPoison: juice
        ]
        ifFalse: [
            communicatesService cannotPoisonItem
        ]
    ]

    checkHeroHasPoison: juice [
        | poison2 |
        (hero hasItemWithName: 'poison')
        ifTrue: [
            poison2 := hero findItemWithName: 'poison'.
            hero addPoison: juice poison: poison2.
        ]
        ifFalse: [
            communicatesService poisonNoPoison.
        ].
    ]

    checkArgumentChloroform: argument [
        | validArguments |
        validArguments := 'rag'.
        (validArguments = argument)
        ifTrue: [
            self addChloroformToRag: argument
        ]
        ifFalse: [
            communicatesService cannotChlorofomItem
        ]
    ]

    addChloroformToRag: ragName [
        | rag |
        (hero hasItemWithName: ragName)
        ifTrue: [
            rag := hero findItemWithName: ragName.
            self checkChloroform: rag.
        ]
        ifFalse: [
            communicatesService heroHasNoRag.
        ].
    ]

    checkChloroform: rag [
        | chloroform |
        (hero hasItemWithName: 'chloroform')
        ifTrue: [
            chloroform := hero findItemWithName: 'chloroform'.
            hero addChloroform: rag chloroform: chloroform.
        ]
        ifFalse: [
            communicatesService heroHasNoChloroform.
        ].
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
