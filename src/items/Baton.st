Item subclass: #Baton

Baton >> initialize [
    super initialize: 'baton'
        location: barracks
]

Baton >> description [
    communicatesService batonDescription
]
