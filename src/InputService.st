Object subclass: #InputService
    | character |

InputService >> inputCharacter: charList
    | character |
    character := ''.
    [
        character := FileStream stdin next.
        (charList includes: character) ifTrue: [^character].
    ] whileTrue.
