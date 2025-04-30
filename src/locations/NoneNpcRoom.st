Room subclass: NoneNpcRoom [

    initializeWithName: newName 
        isAccessible: newIsAccessible 
        hasItem: newHasItem 
        itemsList: newItemsList 
        communicatesService: newCommunicatesService
        inputService: newInputService
    [
        super initializeWithName: newName 
            isAccessible: newIsAccessible 
            hasItem: newHasItem 
            itemsList: newItemsList 
            hasNpc: false
            communicatesService: newCommunicatesService
            inputService: newInputService
    ]
]