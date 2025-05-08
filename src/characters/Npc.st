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
        communicatesService printStringNewLine: 'Name: ', self name asString.
        communicatesService printStringNewLine: 'Alive status: ', self isAlive printString.
        communicatesService printStringNewLine: 'Location: ', self location name printString.
        communicatesService printStringNewLine: 'Killable status: ', self isKillable printString.
        communicatesService printStringNewLine: 'Rank: ', self rank printString.
    ]

    npcKilled [
        self isAlive: false.
        self location removeNpc: self.
    ]
]
