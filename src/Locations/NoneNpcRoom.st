Room subclass: #NoneNpcRoom
    instanceVariableNames: 'npcList'

NoneNpcRoom >> initialize: newName newIsAccessible newHasItem newItemsList[
    super initialize: newName 
        isAccessible: newIsAccessible 
        hasItem: newHasItem 
        itemsList: newItemsList 
        hasNpc: false
]
