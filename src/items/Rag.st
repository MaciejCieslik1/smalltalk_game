Item subclass: #Rag
    instanceVariableNames: 'isChloroformed'

Rag >> initialize [
    super initialize: 'rag' 
        location: barracks
        isChloroformed: false
]

Rag >> isChloroformed [
    ^ isChloroformed
]

Rag >> isChloroformed: newIsChloroformed [
    isChloroformed := newIsChloroformed
]

Rag >> description [
    communicatesService ragDescription
]

Rag >> addChloroform [

]
