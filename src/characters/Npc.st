Character subclass: #Npc
    instanceVariableNames: 'rank'

Npc >> initialize: newName newRank newLocation newIsKillable [
    super initialize newName newLocation newIsKillable
    rank := newRank
]

Npc >> rank [
    ^ rank
]

Npc >> rank: newRank [
    rank := newRank
]
