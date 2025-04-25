Object subclass: #Game

Game >> initializeGlobalObjects [
    self initializeLocations
    self initializeItems
    self initializeUniforms
    self initializeCharacters
]

Game >> initializeLocations [
    initializedArchives := Archives new
    Smalltalk at: #archives put: initializedArchives.
    initializedArmory := Armory new
    Smalltalk at: #armory put: initializedArmory.
    initializedBarracks := Barracks new
    Smalltalk at: #barracks put: initializedBarracks.
    initializedCafeteria := Cafeteria new
    Smalltalk at: #cafeteria put: initializedCafeteria.
    initializedCloakroom := Cloakroom new
    Smalltalk at: #cloakroom put: initializedCloakroom.
    initializedConferenceRoom := ConferenceRoom new
    Smalltalk at: #conferenceRoom put: initializedConferenceRoom.
    initializedEmptyRoomA := EmptyRoomA new
    Smalltalk at: #emptyRoomA put: initializedEmptyRoomA.
    initializedEmptyRoomB := EmptyRoomB new
    Smalltalk at: #emptyRoomB put: initializedEmptyRoomB.
    initializedEntrance := Entrance new
    Smalltalk at: #entrance put: initializedEntrance.
    initializedFoodStorage := FoodStorage new
    Smalltalk at: #foodStorage put: initializedFoodStorage.
    initializedFuhrersOffice := FuhrersOffice new
    Smalltalk at: #fuhrersOffice put: initializedFuhrersOffice.
    initializedFuhrersQuarters := FuhrersQuarters new
    Smalltalk at: #fuhrersQuarters put: initializedFuhrersQuarters.
    initializedGoebbelsOffice := GoebbelsOffice new
    Smalltalk at: #goebbelsOffice put: initializedGoebbelsOffice.
    initializedKitchen := Kitchen new
    Smalltalk at: #kitchen put: initializedKitchen.
    initializedKitchenExit := KitchenExit new
    Smalltalk at: #kitchenExit put: initializedKitchenExit.
    initializedLobby := Lobby new
    Smalltalk at: #lobby put: initializedLobby.
    initializedMedicBay := MedicBay new
    Smalltalk at: #medicBay put: initializedMedicBay.
    initializedNullRoom := NullRoom new
    Smalltalk at: #nullRoom put: initializedNullRoom.
    initializedSecretExit := SecretExit new
    Smalltalk at: #secretExit put: initializedSecretExit.
    initializedSecurityCheckEntry := SecurityCheckEntry new
    Smalltalk at: #securityCheckEntry put: initializedSecurityCheckEntry.
    initializedSecurityCheckOffices := SecurityCheckOffices new
    Smalltalk at: #securityCheckOffices put: initializedSecurityCheckOffices.
    initializedSocialRoom := SocialRoom new
    Smalltalk at: #socialRoom put: initializedSocialRoom.
]
