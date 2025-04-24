Item subclass: #Bandage

Bandage >> initialize [
    super initialize: 'bandage'
        location: medicBay
]

Bandage >> description [
    communicatesService bandageDescription
]
