Npc subclass: Waiter [
    | uniform |

    initialize: newLocation 
        uniform: newUniform 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'waiter' 
            rank: 'civil' 
            location: newLocation 
            isKillable: false
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        uniform := newUniform
    ]

    interaction [
        communicatesService talkToWaiter_1
    ]

    attacked [
        | inputOption |
        self npcKilled.
        communicatesService waiterKilled.
        communicatesService waiterStealUniformOption.
        inputOption := inputService inputCharacter: ('a').
        communicatesService waiterStealUniform.
        hero changeUniform: uniform
    ]
]