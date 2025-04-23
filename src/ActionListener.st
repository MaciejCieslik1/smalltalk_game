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
    | validArguments |
    validArguments := #('n' 'w' 's' 'e').
    (validArguments includes: argument)
    ifTrue: [
        movement go: argument
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self >> checkArgumentPick: argument [
    | validArguments |
    validArguments := #('lever' 'apple_juice' 'orange_juice' 'multivitamina_juice' 'poison' 'vitamins' 'bandage' 'baton' 'chloroform'
                        'umbrella' 'rag' 'chloroform_rag' 'letter' 'poisoned_apple_juice' 'poisoned_orange_juice' 
                        'poisoned_multivitamina_juice' 'money' 'id' 'mid_rank_pass' 'red_key' 'amber').
    (validArguments includes: argument)
    ifTrue: [
        hero location pickUpItem: argument
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self >> checkArgumentInteract: argument [
    | validArguments |
    validArguments := #('lever' 'apple_juice' 'orange_juice' 'multivitamina_juice' 'poison' 'vitamins' 'bandage' 'baton' 'chloroform'
                        'umbrella' 'rag' 'chloroform_rag' 'letter' 'poisoned_apple_juice' 'poisoned_orange_juice' 
                        'poisoned_multivitamina_juice' 'money' 'id' 'mid_rank_pass' 'red_key' 'amber').
    (validArguments includes: argument)
    ifTrue: [
        hero location interactWithItem: argument
    ]
    ifFalse: [
        communicatesService invalidArgument
    ]
]

self >> checkArgumentAttack: argument [
    | validArguments |
    validArguments := #('guard1' 'guard3' 'guard4').
    (validArguments includes: argument)
    ifTrue: [
        hero attack: argument
    ]
    ifFalse: [
        communicatesService cannotAttackPerson
    ]
]
