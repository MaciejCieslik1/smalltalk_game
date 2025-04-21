Npc subclass: #Waiter

Waiter >> initialize: [
    super initialize 'waiter' civil kitchen false
]

Waiter >> interaction: [
    communicatesService talkToWaiter_1
]