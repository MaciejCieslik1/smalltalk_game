Object subclass: InputService [
    | communicatesService |

    InputService class >> newInitialize: communicatesService [
        ^ super new initialize: communicatesService.
    ]

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
        | parts command argument inputString |
        communicatesService chooseAction.
        inputString := FileStream stdin nextLine.

        (inputString = 'help')
        ifTrue: [
            ^ inputString, ' empty'
        ]
        ifFalse: [
            ^ self commandNotHelp: inputString.
        ]
    ]

    commandNotHelp: inputString [
        | parts command argument validCommands |
        validCommands := #('go' 'pick' 'interact' 'attack' 'info' 'description' 'poison' 'chloroform' 'map' 'help').
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