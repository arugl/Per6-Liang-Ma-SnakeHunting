AP Computer Science final project for David Liang and Scott Ma.
Stuyvesant High School- Mr. Konstantinovich, Period 6

GAME CONCEPT:
The goal of the game is to kill an autopiloted "snake". The snake moves across a board searching for food tiles scattered
around the board. When it reaches a food tile, it consumes the food and grows one unit longer. The snake is autopiloted
by the computer.

The user controls a "gun" at the bottom of the screen that shoots missiles at the snake. The gun can be moved left and
right with arrow keys, but the missiles move only in a straight line in the direction it was originally shot.
If a bullet hits any member of the snake, that member dies. In addition, the members before the area where the snake was 
shot and after the area where the snake was shot separate into two new snakes, if possible. If either of the new snakes 
are less than two units long, they automatically die. The goal for the user is to kill all snakes on the board. For each
extra snake on the board, one extra food particle will appear up to a certain limit. Snakes are autoprogrammed to move 
towards the closest food unit.

For the user to lose, one snake must "bite" another snake (can be itself). Snakes, by default, will avoid hitting other
snakes whenever possible. As a result, biting will only occur when there are too many snakes on the board.

TO-ADD (TENTATIVE):
- power-ups
- ammo limits for the gun
- options menu to alter the number of snakes on the board, food pellet maximums, etc
- giving each member of the snake a number to display (2,4,8,16,32, up to 2048) on its chest