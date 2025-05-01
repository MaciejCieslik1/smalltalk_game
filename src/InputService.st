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

        (inputString = 'help' or: [inputString = 'map'] )
        ifTrue: [
            ^ inputString, ' empty'
        ]
        ifFalse: [
            ^ self commandNotHelpOrMap: inputString.
        ]
    ]

    commandNotHelpOrMap: inputString [
        | parts command argument validCommands |
        validCommands := #('go' 'pick' 'interact' 'attack' 'info' 'description' 'poison' 'chloroform' 'map' 'help').
        parts := inputString substrings: ' '.
        parts size = 2 ifFalse: [ 
            communicatesService invalidCommand.
            ^ '0 0'
        ].

        command := parts first.
        argument := parts second.

        (validCommands includes: command)
        ifTrue: [
            ^ '0 0'
        ]
        ifFalse: [
            communicatesService invalidCommand.
            ^ '0 0'
        ].
    ]
]
