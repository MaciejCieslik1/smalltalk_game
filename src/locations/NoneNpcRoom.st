Room subclass: NoneNpcRoom [

    initializeWithName: newName 
        isAccessible: newIsAccessible 
        hasItem: newHasItem 
        itemsList: newItemsList 
        adjacentWest: newAdjacentWest 
        adjacentSouth: newAdjacentSouth 
        adjacentEast: newAdjacentEast
        adjacentNorth: newAdjacentNorth
    [
        super initializeWithName: newName 
            isAccessible: newIsAccessible 
            hasItem: newHasItem 
            itemsList: newItemsList 
            hasNpc: false
            adjacentWest: newAdjacentWest
            adjacentSouth: newAdjacentSouth
            adjacentEast: newAdjacentEast
            adjacentNorth: newAdjacentNorth
    ]
]