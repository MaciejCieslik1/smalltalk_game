NpcRoom subclass: Cafeteria [

    initialize [
        super initializeWithName: 'cafeteria'
            isAccessible: false
            hasItem: true
            itemsList: (OrderedCollection new)
            npcList: (OrderedCollection new).
            adjacentWest: emptyRoomA
            adjacentSouth: medicBay
            adjacentEast: kitchen
            adjacentNorth: socialRoom
        itemsList add: apple_juice
        itemsList add: orange_juice
        itemsList add: multivitamina_juice
        npcList add: chef.
    ]
]
