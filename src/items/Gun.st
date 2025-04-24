Item subclass: #Gun

Gun >> initialize [
    super initialize: 'gun'
        location: nil
]

Gun >> description [
    communicatesService gunDescription
]
