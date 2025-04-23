Object subclass: #Room
    instanceVariableNames: 'name isAccessible hasItem itemsList hasNpc adjacentWest adjacentSouth adjacentEast adjacentNorth'

Room >> initialize: newName newIsAccessible newHasItem newItemsList newHasNpc newAdjacentWest newAdjacentSouth newAdjacentEast 
                    newAdjacentNorth [
    name := newName.
    isAccessible := newIsAccessible
    hasItem := newHasItem
    itemsList := newItemsList
    hasNpc := newHasNpc
    adjacentWest := newAdjacentWest
    adjacentSouth := newAdjacentSouth
    adjacentEast := newAdjacentEast
    adjacentNorth := newAdjacentNorth
]

Room >> name [
    ^ name
]

Room >> name: newName [
    name := newName
]

Room >> isAccessible [
    ^ isAccessible
]

Room >> isAccessible: newIsAccessible [
    isAccessible := newIsAccessible
]

Room >> hasItem [
    ^ hasItem
]

Room >> hasItem: newHasItem [
    hasItem := newHasItem
]

Room >> itemsLists [
    ^ itemsList
]

Room >> itemsList: newItemsList [
    itemsList := newItemsList
]

Room >> hasNpc [
    ^ hasNpc
]

Room >> hasNpc: newHasNpc [
    hasNpc := newHasNpc
]

Room >> adjacentWest [
    ^ adjacentWest
]

Room >> adjacentWest: newAdjacentWest [
    adjacentWest := newAdjacentWest
]

Room >> adjacentEast [
    ^ adjacentEast
]

Room >> adjacentEast: newAdjacentEast [
    adjacentEast := newAdjacentEast
]

Room >> adjacentNorth [
    ^ adjacentNorth
]

Room >> adjacentNorth: newAdjacentNorth [
    adjacentNorth := newAdjacentNorth
]

Room >> adjacentSouth [
    ^ adjacentSouth
]

Room >> adjacentSouth: newAdjacentSouth [
    adjacentSouth := newAdjacentSouth
]

Room >> hasItemName: itemName [
    ^ self itemsList anySatisfy: [:item | item name = itemName].
]

Room >> findItemByName: itemName [
    ^ self itemsList detect: [:item | item name = itemName]
]

Room >> removeItem: item [
    itemsList remove: item
]

Room >> roomInfo [
    communicatesService printStringNewLine: self name
    communicatesService printItems
]

Room >> pickUpItem: itemName [
    (self hasItemName: itemName)
    ifTrue: [
        item := self findItemByName: itemName
        item pickUp
    ]
    ifFalse: [
        communicatesService wrongItemName
    ]
]

Room >> interactWithItem: itemName [
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
