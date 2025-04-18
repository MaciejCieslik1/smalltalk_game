Npc subclass: #Bandit

Bandit >> initialize: [
    super initialize 'bandit' private emptyRoomB true
]

Bandit >> attackHero: hero [
    (hero hasItem: baton)
    ifTrue: [
        self banditKilled
    ]
    ifFalse: [
        hero heroKilled
    ]
]

Bandit >> banditKilled: [
    bandit isAlive: false
]