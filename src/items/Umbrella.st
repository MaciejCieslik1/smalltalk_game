Item subclass: #Umbrella

Umbrella >> initialize [
    super initialize: 'umbrella'
        location: cloakroom
]

Umbrella >> description [
    communicatesService umbrellaDescription
]
