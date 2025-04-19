Npc subclass: #Guard
    instanceVariableNames: 'hasPermission'

Guard >> initialize: newName newLocation isKillable[
    super initialize: newName 
        rank: private 
        location: newLocation 
        isKillable: isKillable
    hasPermission := false
]

Guard >> hasPermission [
    ^ hasPermission
]

Guard >> hasPermission: newHasPermission [
    hasPermission := newHasPermission
]