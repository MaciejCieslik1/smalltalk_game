Npc subclass: #Guard
    instanceVariableNames: 'hasPermission'

Guard >> initialize: newName newLocation [
    super initialize newName private newLocation true
    hasPermission := false
]

Guard >> hasPermission [
    ^ hasPermission
]

Guard >> hasPermission: newHasPermission [
    hasPermission := newHasPermission
]