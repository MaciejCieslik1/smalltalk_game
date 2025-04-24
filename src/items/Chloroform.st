Item subclass: #Chloroform

Chloroform >> initialize [
    super initialize: 'chloroform'
        location: medicBay
]

Chloroform >> description [
    communicatesService chloroformDescription
]
