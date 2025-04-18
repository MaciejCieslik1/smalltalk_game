NoneNpcRoom subclass: #ConferenceRoom

ConferenceRoom >> initialize [
    super initialize: 'conference room'
        isAccessible: false
        hasItem: false
        itemsList: (OrderedCollection new).
]
