Person subclass: Npc [
    | rank |

    initializeWithName: newName 
        rank: newRank 
        location: newLocation 
        isKillable: newIsKillable
        communicatesService: newCommunicatesService 
        inputService: newInputService
    [
        super initializeWithName: newName 
            location: newLocation
            isKillable: newIsKillable
            communicatesService: newCommunicatesService 
            inputService: newInputService.
        rank := newRank
    ]

    rank [
        ^ rank
    ]

    rank: newRank [
        rank := newRank
    ]

    createInfo [
        | info |
        info := super createInfo, 
                'Rank: ', self rank, String cr.
        ^ info
    ]

    npcKilled [
        self isAlive: false.
        self location removeNpc: self.
    ]
]
