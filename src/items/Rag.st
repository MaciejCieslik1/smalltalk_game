Item subclass: Rag [
    | isChloroformed | 

    initialize [
        super initializeWithName: 'rag' 
            location: barracks
            isChloroformed: false.
    ]

    isChloroformed [
        ^ isChloroformed
    ]

    isChloroformed: newIsChloroformed [
        isChloroformed := newIsChloroformed.
    ]

    description [
        communicatesService ragDescription.
    ]

    addChloroform [
        self name: ('chloroformed ', self name) asString.
        self isChloroformed: true.
    ]
]