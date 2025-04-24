Juice subclass: #OrangeJuice

OrangeJuice >> initialize [
    super initialize: 'orange_juice'
        location: cafeteria
        isPoisoned: false
]

OrangeJuice >> description [
    communicatesService orangeJuiceDescription
]
