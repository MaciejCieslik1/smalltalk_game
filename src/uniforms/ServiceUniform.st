Uniform subclass: ServiceUniform [

    initialize [
        super initializeWithName: 
            name := 'service_uniform'.
    ]

    description [
        communicatesService serviceUniformDescription
    ]
]