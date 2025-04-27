Object subclass: Room [
    | name isAccessible hasItem itemsList hasNpc wasVisisted adjacentWest adjacentSouth adjacentEast adjacentNorth | 

    initializeWithName: newName 
        isAccessible: newIsAccessible 
        hasItem: newHasItem 
        itemsLists: newItemsList 
        hasNpc: newHasNpc
        adjacentWest: newAdjacentWest 
        adjacentSouth: newAdjacentSouth 
        adjacentEast: newAdjacentEast 
        adjacentNorth: newAdjacentNorth 
    [
        name := newName.
        isAccessible := newIsAccessible.
        hasItem := newHasItem.
        itemsList := newItemsList.
        hasNpc := newHasNpc.
        wasVisisted := false.
        adjacentWest := newAdjacentWest.
        adjacentSouth := newAdjacentSouth.
        adjacentEast := newAdjacentEast.
        adjacentNorth := newAdjacentNorth.
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

    roomInfo [
        communicatesService printStringNewLine: self name
        communicatesService printItems
    ]

    pickUpItem: itemName [
        (self hasItemName: itemName)
        ifTrue: [
            item := self findItemByName: itemName
            item pickUp
        ]
        ifFalse: [
            communicatesService wrongItemName
        ]
    ]

    interactWithItem: itemName [
        | item |
        (self hasItemName: itemName)
        ifTrue: [
            item := self findItemByName: itemName
            item interact
        ]
        ifFalse: [
            communicatesService wrongItemName
        ]
    ]

    heroWalkedIn [
        self wasVisisted: true
        actionListener chooseAction 
    ]
]
