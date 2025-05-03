Item subclass: MidRankPass [

    initialize: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'mid_rank_pass'
            location: nil
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    description [
        communicatesService midRankPassDescription.
    ]
]
