Guard subclass: Guard3 [

    initialize: newLocation 
        hero: newHero 
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: 'guard3' 
            location: newLocation
            isKillable: true
            hero: newHero 
            communicatesService: newCommunicatesService 
            inputService: newInputService
    ]

    interaction [
        communicatesService talkToGuard3_1
    ]

    interactionShooting [
        communicatesService talkToGuard3_2.
        (hero hasItemWithItem: 'bulletproofVest') 
        ifTrue: [
            self usedVest.
        ]
        ifFalse: [
            self notUsedVest.
        ].
    ]

    usedVest [
        communicatesService talkToGuard3_3.
        communicatesService talkToGuard3_4.
        communicatesService talkToGuard3_5.
        inputService inputCharacter: ('a').
        communicatesService talkToGuard3_6.
        communicatesService talkToGuard3_7.
        communicatesService talkToGuard3_8.
        communicatesService talkToGuard_wayNorthAccessible.
    ]

    notUsedVest [
        communicatesService talkToGuard3_9.
        communicatesService talkToGuard_wakeUpInMedbay.
        communicatesService talkToGuard_needVest.
        hero getWounded
    ]

    interactionBeverages [
        self introductionDialogue.
        self chooseJuice.
    ]

    chooseJuice: appleJuice juice2: orangeJuice juice3: multivitaminaJuice [
        (appleJuice isPoisoned)
        ifTrue: [
            communicatesService talkToGuard3_12.
            inputService inputCharacter: ('a').
            communicatesService talkToGuard3_13.
            deliverDrink
        ].
        (orangeJuice isPoisoned)
        ifTrue: [
            communicatesService talkToGuard3_22.
            inputService inputCharacter: ('a').
            communicatesService talkToGuard3_23.
            deliverDrink
        ].
        (multivitaminaJuice isPoisoned)
        ifTrue: [
            communicatesService talkToGuard3_27.
            inputService inputCharacter: ('a').
            communicatesService talkToGuard3_28.
            deliverDrink
        ].
    ]

    introductionDialogue [
        communicatesService talkToGuard3_10.
        communicatesService talkToGuard3_11.
    ]

    deliverDrink [
        communicatesService talkToGuard3_14.
        communicatesService talkToGuard3_15.
        communicatesService talkToGuard3_16.
        communicatesService talkToGuard3_17.
        communicatesService talkToGuard3_18.
        communicatesService talkToGuard3_19.
        communicatesService talkToGuard3_20.
        communicatesService talkToGuard3_21.
        roomService openKitchenExit.
    ]

    attacked [
        self npcKilled.
        communicatesService killedGuard3.
        guard4 interactionShooting.
    ]
]
