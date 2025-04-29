Uniform subclass: ServiceUniform [

    ServiceUniform class >> newInitialize [
        ^ super new initialize.
    ]

    initialize [
        super initializeWithName: 'service_uniform'.
    ]

    description [
        communicatesService serviceUniformDescription
    ]
]
