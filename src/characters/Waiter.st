Npc subclass: Waiter [

    initialize: [
        super initializeWithName: 'waiter' rank: civil location: kitchen isKillable: false
    ]

    interaction: [
        communicatesService talkToWaiter_1
    ]

    attacked [
        | inputOption |
        self npcKilled
        communicatesService waiterKilled
        communicatesService waiterStealUniformOption
        inputOption := inputService inputCharacter: ('a')
        communicatesService waiterStealUniform
        hero changeUniform: serviceUniform
    ]
]