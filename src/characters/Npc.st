Person subclass: Npc [
    | rank |

    initializeWithName: newName rank: newRank location: newLocation isKillable: newIsKillable [
        super initialize: newName 
            location: newLocation
            isKillable: newIsKillable
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

    npcKilled: [
        self isAlive: false
        self location removeNpc: self
    ]
]
