Character subclass: #Hero
    instanceVariableNames: 'items uniform money'

Hero >> initialize: [
    super initialize 'Johannes Golmer' startExit true
    items := OrderedCollection new
    uniform := military_uniform
    money := 0
]
