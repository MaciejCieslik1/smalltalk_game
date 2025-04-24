Item subclass: #Letter

Letter >> initialize [
    super initialize: 'letter'
        location: goebbelsOffice
]

Letter >> description [
    communicatesService letterDescription
]
