Object subclass: #ActionListener 

ActionListener >> chooseAction [
    | result command argument |
    [
        result := inputService inputCommand.
        command := result first
        argument := result second
        (command = '0' and: [ argument = '0' ])
    ] whileTrue.
    (command = 'go')
    ifTrue: [
        self checkArgumentGo: argument
    ]
    (command = 'pick')
    ifTrue: [
        self checkArgumentPick: argument
    ]
    (command = 'interact')
    ifTrue: [
        self checkArgumentInteract: argument
    ]
    (command = 'attack')
    ifTrue: [
        self checkArgumentAttack: argument
    ]
]

self >> checkArgumentGo: argument [

]

self >> checkArgumentPick: argument [

]


self >> checkArgumentInteract: argument [

]

self >> checkArgumentAttack: argument [

]
