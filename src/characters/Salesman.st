Npc subclass: #Salesman
    instanceVariableNames: 'items money'

Salesman >> initialize: [
    super initialize 'salesman' private armory false
    items := #(bulletproofVest, gun)
    money := 10000
]
