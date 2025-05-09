# Smalltalk Text Adventure Game

## Overview

Welcome to the **Text Adventure Game**, created in Smalltalk. The main goal is to kill Adolf Hitler in his bunker and escape.

---

## Prerequisites

1. **Install GNU Smalltalk**:
   ```bash
   sudo apt install gnu-smalltalk
   ```

2. **Verify installation**:
   ```bash
   gst --version
   ```

---

## Installation

1. **Clone the repository**:
   ```bash
   https://github.com/MaciejCieslik1/smalltalk_game.git
   ```

---

## How to Play

1. Open your terminal or command prompt.
2. Navigate to the cloned directory and then to src directory:
   ```bash
   cd src
   ```
3. Launch the game:
   ```bash
   gst main.st
   ```

---

## Gameplay Commands

### Useful commands ###
go n - moves hero to the northern room  
go w - moves hero to the western room  
go s - moves hero to the southern room  
go e - moves hero to the eastern room  
talk <npc> - talk to npc  
pick <item> - pick up item  
interact <item> - interact with special item  
attack <npc> - attack npc using weapon  
info <character> - display information about character  
description <item> - display description of item  
poison <item> - poison drink  
chloroform <item> - add chloroform to item  
room - display all items and npc's in the room  
help - display instruction  
quit - exit the game  

### Room legend ###
[X] - room in which hero is present at the moment  
[I] - visited room with item to pick  
[N] - visited room with item npc  
[B] - visited room with both item to pick and npc  
[ ] - visited empty room  
(I) - unvisited room with item to pick, adjacent to the visited one  
(N) - unvisited room with npc, adjacent to the visited one  
(B) - unvisited room with both item to pick and npc, adjacent to the visited one  
( ) - unvisited empty room, adjacent to the visited one  
=== - long horizonal corridor  
'-' - normal horizonal corridor  
'|' - normal vertical corridor  

---
