Character subclass: #Npc
    instanceVariableNames: 'rank'

Npc >> initialize: newName newRank newLocation newIsKillable [
    super initialize: newName 
        location: newLocation
        isKillable: newIsKillable
    rank := newRank
]

Npc >> rank [
    ^ rank
]

Npc >> rank: newRank [
    rank := newRank
]

Npc >> createInfo [
    | info |
    info := super createInfo, 
            'Rank: ', self rank, String cr.
    ^ info
]

Npc >> npcKilled: [
    self isAlive: false
    self location removeNpc: self
]
