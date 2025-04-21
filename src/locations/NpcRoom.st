Room subclass: #NpcRoom
    instanceVariableNames: 'npcList'

NpcRoom >> initialize: newName newIsAccessible newHasItem newItemsList newNpcList newAdjacentWest newAdjacentSouth newAdjacentEast
                        newAdjacentNorth[
    super initialize: newName 
    isAccessible := newIsAccessible
    hasItem := newHasItem 
    itemsList := newItemsList 
    hasNpc := true 
    npcList := newNpcList
    adjacentWest := newAdjacentWest
    adjacentSouth := newAdjacentSouth
    adjacentEast := newAdjacentEast
    adjacentNorth := newAdjacentNorth
]

NpcRoom >> npcList [
    ^ npcList
]

NpcRoom >> npcList: newNpcList [
    npcList := newNpcList
]

NpcRoom >> hasNpc: npc [
    ^ self npcList include: npc
]