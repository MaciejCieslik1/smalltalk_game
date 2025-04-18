Room subclass: #NpcRoom
    instanceVariableNames: 'npcList'

NpcRoom >> initialize: newName newIsAccessible newHasItem newItemsList newNpcList [
    super initialize: newName 
    isAccessible := newIsAccessible
    hasItem := newHasItem 
    itemsList := newItemsList 
    hasNpc := true 
    npcList := newNpcList
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