Juice subclass: #AppleJuice

AppleJuice >> initialize [
    super initialize: 'apple_juice'
        location: cafeteria
        isPoisoned: false
]

AppleJuice >> description [
    communicatesService appleJuiceDescription
]
