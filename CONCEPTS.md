## Concepts

### Universe

All games have at least one 'universe'. There may be multiple kinds of gameworld in the future, but this current implementation is of a world with a grid of cells.

### The grid

The grid has a width and height, and contains a set of cells. Each cell can have up to three walls, but not four - as four walls would make it inaccessible.

Walls are procedurally generated on initialisation, but they don't have to be immutable, and stored as edges within the Grid class singleton instance. 

Players move between cells, but cannot move through a wall. A player's X, Y co-ordinate position will be within a discrete cell at all times.

### Cells

Cells are implemented with an awareness of their up to 8 neighbours - North, North-East, East, South-East, South, South-West, West, North-West (when described in a clock-wise direction). The cell is the context of the Player's (or any game object's) position, and will respond to the logic of where the player is allowed to move.

e.g. ``#can_move?(:north) # => true or false``


