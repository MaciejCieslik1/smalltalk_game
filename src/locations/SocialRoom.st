NoneNpcRoom subclass: #SocialRoom

SocialRoom >> initialize [
    super initialize: 'social room'
        isAccessible: false
        hasItem: true
        itemsList: (OrderedCollection new).
    itemsList add: money3.
]
