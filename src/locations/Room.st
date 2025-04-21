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