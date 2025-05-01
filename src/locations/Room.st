Object subclass: Room [
    | name isAccessible hasItem itemsList hasNpc wasVisisted adjacentWest adjacentSouth adjacentEast adjacentNorth communicatesService |
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
        wasVisisted := false.
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

    itemsLists [
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

    wasVisisted [
        ^ wasVisisted
    ]

    wasVisisted: newWasVisited [
        wasVisisted := newWasVisited
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
            item := self findItemByName: itemName
            item pickUp: hero
        ]
        ifFalse: [
            communicatesService wrongItemName
        ]
    ]

    interactWithItem: itemName character: hero [
        | item |
        (self hasItemName: itemName)
        ifTrue: [
            item := self findItemByName: itemName
            item interact: hero
        ]
        ifFalse: [
            communicatesService wrongItemName
        ]
    ]

    heroWalkedIn [
        self wasVisisted: true
        actionListener chooseAction 
    ]

    addAdjacentRooms: adjacentNorth west: adjacentWest south: adjacentSouth east: adjacentEast [
        self adjacentNorth: adjacentNorth.
        self adjacentWest: adjacentWest.
        self adjacentSouth: adjacentSouth.
        self adjacentEast: adjacentEast.
    ]
]
