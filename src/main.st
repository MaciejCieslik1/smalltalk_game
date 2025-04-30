FileStream fileIn: 'load.st'.

| game |
game := Game new.
game initializeFields.
game gameLoop.
