Npc subclass: Waiter [
    | uniform |
    initialize: newLocation uniform: newUniform [
        super initializeWithName: 'waiter' rank: 'civil' location: newLocation isKillable: false.
        uniform := newUniform
    ]

    interaction [
        communicatesService talkToWaiter_1
    ]

    attacked [
        | inputOption |
        self npcKilled.
        communicatesService waiterKilled
        communicatesService waiterStealUniformOption.
        inputOption := inputService inputCharacter: ('a').
        communicatesService waiterStealUniform
        hero changeUniform: uniform
    ]
]