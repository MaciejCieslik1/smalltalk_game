Object subclass: InputService [
    | communicatesService |

    initialize: newCommunicatesService [
        communicatesService := newCommunicatesService.
    ]

    inputCharacter: charList [
        | character |
        character := ''.
        [
            communicatesService chooseAction.
            character := FileStream stdin next.
            (charList includes: character) 
            ifTrue: [
                ^ character
            ]
            ifFalse: [
                communicatesService incorrectInput
            ] 
        ] whileTrue.
    ]

    inputCommand [
        | parts command argument validCommands inputString |
        validCommands := #('go' 'pick' 'interact' 'attack' 'info' 'description' 'poison' 'chloroform').
        communicatesService chooseAction.
        inputString := FileStream stdin nextLine.

        (inputString = 'help')
        ifTrue: [
            ^ inputString
        ]
        ifFalse: [
            ^ self commandNotHelp: inputString.
        ]
    ]

    commandNotHelp: inputString argument2: validCommands [
        | parts command argument |
        parts := inputString substrings: ' '.
        parts size = 2 ifFalse: [ 
            communicatesService invalidCommand.
            ^ Array with: '0' with: '0'
        ].

        command := parts first.
        argument := parts second.

        (validCommands includes: command)
        ifTrue: [
            ^ Array with: command with: argument 
        ]
        ifFalse: [
            communicatesService invalidCommand.
            ^ Array with: '0' with: '0'
        ].
    ]
]