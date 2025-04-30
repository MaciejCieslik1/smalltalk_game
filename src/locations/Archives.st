NoneNpcRoom subclass: Archives [

    Archives class >> newInitialize: newCommunicatesService inputService: newInputService [
        ^ super new initialize: newCommunicatesService inputService: newInputService.
    ]

    initialize: newCommunicatesService inputService: newInputService [
        super initializeWithName: 'archives'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            communicatesService: newCommunicatesService
            inputService: newInputService
    ]
]
