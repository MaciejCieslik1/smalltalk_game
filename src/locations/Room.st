Object subclass: Room [
    | name isAccessible hasItem itemsList hasNpc wasVisited adjacentWest adjacentSouth adjacentEast adjacentNorth communicatesService |
    | inputService | 

    initializeWithName: newName 
        isAccessible: newIsAccessible 
        hasItem: newHasItem 
        itemsList: newItemsList 
        hasNpc: newHasNpc
        communicatesService: newCommunicatesService
        inputService: newInputService
    [
        name := newName.
        isAccessible := newIsAccessible.
        hasItem := newHasItem.
        itemsList := newItemsList.
        hasNpc := newHasNpc.
        wasVisited := false.
        adjacentWest := nil.
        adjacentSouth := nil.
        adjacentEast := nil.
        adjacentNorth := nil.
        communicatesService := newCommunicatesService.
        inputService := newInputService.
    ]

    name [
        ^ name
    ]

    name: newName [
        name := newName
    ]

    isAccessible [
        ^ isAccessible
    ]

    isAccessible: newIsAccessible [
        isAccessible := newIsAccessible
    ]

    hasItem [
        ^ hasItem
    ]

    hasItem: newHasItem [
        hasItem := newHasItem
    ]

    itemsList [
        ^ itemsList
    ]

    itemsList: newItemsList [
        itemsList := newItemsList
    ]

    hasNpc [
        ^ hasNpc
    ]

    hasNpc: newHasNpc [
        hasNpc := newHasNpc
    ]

    wasVisited [
        ^ wasVisited
    ]

    wasVisited: newWasVisited [
        wasVisited := newWasVisited
    ]

    adjacentWest [
        ^ adjacentWest
    ]

    adjacentWest: newAdjacentWest [
        adjacentWest := newAdjacentWest
    ]

    adjacentEast [
        ^ adjacentEast
    ]

    adjacentEast: newAdjacentEast [
        adjacentEast := newAdjacentEast
    ]

    adjacentNorth [
        ^ adjacentNorth
    ]

    adjacentNorth: newAdjacentNorth [
        adjacentNorth := newAdjacentNorth
    ]

    adjacentSouth [
        ^ adjacentSouth
    ]

    adjacentSouth: newAdjacentSouth [
        adjacentSouth := newAdjacentSouth
    ]

    hasItemName: itemName [
        ^ self itemsList anySatisfy: [:item | item name = itemName].
    ]

    hasItemWithName: itemName [
        itemsList do: [:item |
            (item name = itemName) 
            ifTrue: [
                ^ true
            ].
        ].
        ^ false
    ]

    findItemByName: itemName [
        ^ self itemsList detect: [:item | item name = itemName]
    ]

    removeItem: item [
        itemsList remove: item
    ]

    addItems: items [
        items do: [:item | 
            itemsList add: item
        ].
    ]

    roomInfo [
        communicatesService printStringNewLine: self name
        communicatesService printItems
    ]

    pickUpItem: itemName character: hero [
        | item |
        (self hasItemName: itemName)
        ifTrue: [
            item := self findItemByName: itemName.
            item pickUp: hero
        ]
        ifFalse: [
            communicatesService wrongItemName
        ]
    ]

    interactWithItem: itemName character: hero roomService: roomService [
        | item |
        (self hasItemName: itemName)
        ifTrue: [
            item := self findItemByName: itemName.
            item interact: roomService.
        ]
        ifFalse: [
            communicatesService wrongItemName
        ]
    ]

    addAdjacentRooms: adjacentNorth west: adjacentWest south: adjacentSouth east: adjacentEast [
        self adjacentNorth: adjacentNorth.
        self adjacentWest: adjacentWest.
        self adjacentSouth: adjacentSouth.
        self adjacentEast: adjacentEast.
    ]
]
