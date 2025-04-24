Juice subclass: #MultivitaminaJuice

MultivitaminaJuice >> initialize [
    super initialize: 'multivitamina_juice'
        location: cafeteria
        isPoisoned: false
]

MultivitaminaJuice >> description [
    communicatesService multivitaminaJuiceDescription
]
