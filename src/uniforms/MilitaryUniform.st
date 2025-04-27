Uniform subclass: MilitaryUniform [

    initialize [
        super initializeWithName: 
            name := 'military_uniform'.
    ]

    description [
        communicatesService militaryUniformDescription
    ]
]