Npc subclass: #Waiter

Waiter >> initialize: [
    super initialize 'waiter' civil kitchen false
]

Waiter >> interaction: [
    communicatesService talkToWaiter_1
]

Waiter >> attacked [
    | inputOption |
    self npcKilled
    communicatesService waiterKilled
    communicatesService waiterStealUniformOption
    inputOption := inputService inputCharacter: ('a')
    communicatesService waiterStealUniform
    hero changeUniform: serviceUniform
]
