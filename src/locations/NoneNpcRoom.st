Room subclass: #NoneNpcRoom
    instanceVariableNames: 'npcList'

NoneNpcRoom >> initialize: newName newIsAccessible newHasItem newItemsList newAdjacentWest newAdjacentSouth newAdjacentEast
                            newAdjacentNorth[
    super initialize: newName 
        isAccessible: newIsAccessible 
        hasItem: newHasItem 
        itemsList: newItemsList 
        hasNpc: false
        adjacentWest := newAdjacentWest
        adjacentSouth := newAdjacentSouth
        adjacentEast := newAdjacentEast
        adjacentNorth := newAdjacentNorth
]
