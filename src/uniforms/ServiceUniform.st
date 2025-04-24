Uniform subclass: #ServiceUniform

ServiceUniform >> initialize [
    super initialize: 
        name := 'service_uniform'.
]

ServiceUniform >> description [
    communicatesService serviceUniformDescription
]
