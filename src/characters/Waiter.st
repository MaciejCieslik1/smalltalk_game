Npc subclass: Waiter [
    | uniform hero |

    initialize: newLocation 
        uniform: newUniform 
        hero: newHero 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'waiter' 
            rank: 'civil' 
            location: newLocation 
            isKillable: false
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        hero := newHero.
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