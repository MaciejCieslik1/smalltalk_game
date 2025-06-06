Room subclass: NpcRoom [
    | npcList |

    initializeWithName: newName 
        isAccessible: newIsAccessible 
        hasItem: newHasItem 
        itemsList: newItemsList 
        npcList: newNpcList 
        communicatesService: newCommunicatesService
        inputService: newInputService
    [
        super initializeWithName: newName 
            isAccessible: newIsAccessible
            hasItem: newHasItem 
            itemsList: newItemsList 
            hasNpc: true
            communicatesService: newCommunicatesService
            inputService: newInputService.
        npcList := newNpcList.
    ]

    npcList [
        ^ npcList
    ]

    npcList: newNpcList [
        npcList := newNpcList
    ]

    hasNpcObject: npc [
        ^ self npcList include: npc
    ]

    hasNpcName: npcName [
        ^ self npcList anySatisfy: [:npc | npc name = npcName].
    ]

    hasNpcWithName: npcName [
        npcList do: [:npc |
            (npc name = npcName) 
            ifTrue: [
                ^ true
            ].
        ].
        ^ false
    ]

    findNpcByName: npcName [
        ^ self npcList detect: [:npc | npc name = npcName]
    ]

    removeNpc: npc [
        | newNpcList |
        newNpcList := self npcList.
        newNpcList remove: npc.
        self npcList: newNpcList.
        self checkIfNpcListEmpty.
    ]

    addNpcs: npcs [
        npcs do: [:npc | 
            npcs add: npc
        ].
    ]

    checkIfNpcListEmpty [
        (self npcList isEmpty)
        ifTrue: [
            self hasNpc: false 
        ]
    ]

    roomInfo [
        super roomInfo
        communicatesService printNpcs
    ]

    talkToNpc: npcName [
        (self hasNpcName: npcName)
        ifTrue: [
            self correctNpcName: npcName
        ]
        ifFalse: [
            communicatesService wrongNpcName
        ]
    ]

    correctNpcName: npcName [
        | npc |
        npc := self findNpcByName: npcName.
        (npc isAlive)
        ifTrue: [
            npc interaction
        ]
        ifFalse: [
            communicatesService npcDead
        ]
    ]
]
