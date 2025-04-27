Object subclass: Uniform [
    | name |

    initializeWithName: newName [
        name := newName.
    ]

    name [
        ^ name
    ]

    name: newName [
        name := newName
    ]
]
