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

NpcRoom >> hasNpcObject: npc [
    ^ self npcList include: npc
]

NpcRoom >> hasNpcName: npcName [
    ^ self npcList anySatisfy: [:npc | npc name = npcName].
]

NpcRoom >> findNpcByName: npcName [
    ^ self npcList detect: [:npc | npc name = npcName]
]

NpcRoom >> removeNpc: npc [
    | newNpcList |
    newNpcList := self npcList
    newNpcList remove: npc
    self npcList: newNpcList
]

NpcRoom >> roomInfo [
    super roomInfo
    communicatesService printNpcs
]

NpcRoom >> talkToNpc: npcName [
    (self hasNpcName: npcName)
    ifTrue: [
        self correctNpcName: npcName
    ]
    ifFalse: [
        communicatesService wrongNpcName
    ]
]

NpcRoom >> correctNpcName: npcName [
    | npc |
    npc := self findNpcByName: npcName
    (npc isAlive)
    ifTrue: [
        npc interaction
    ]
    ifFalse: [
        communicatesService npcDead
    ]
]
