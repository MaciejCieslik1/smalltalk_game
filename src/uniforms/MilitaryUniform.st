Uniform subclass: MilitaryUniform [

    MilitaryUniform class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'military_uniform'.
    ]

    description [
        communicatesService militaryUniformDescription
    ]
]
