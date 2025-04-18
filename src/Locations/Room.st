Object subclass: #Room
    instanceVariableNames: 'name isAccessible hasItem itemsList hasNpc'

Room >> initialize: newName newIsAccessible newHasItem newItemsList newHasNpc [
    name := newName.
    isAccessible := newIsAccessible
    hasItem := newHasItem
    itemsList := newItemsList
    hasNpc := newHasNpc
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