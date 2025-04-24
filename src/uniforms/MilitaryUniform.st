Uniform subclass: #MilitaryUniform

MilitaryUniform >> initialize [
    super initialize: 
        name := 'military_uniform'.
]

MilitaryUniform >> description [
    communicatesService militaryUniformDescription
]