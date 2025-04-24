Item subclass: #Poison

Poison >> initialize [
    super initialize: 'poison'
        location: foodStorage
]

Poison >> description [
    communicatesService poisonDescription
]
