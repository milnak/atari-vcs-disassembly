# Game Standards and Procedures

Atari 2600 VCS

10/26/87

The following documents the user interface desired for 2600 games. This is meant both to provide a guide to development program and as a check list for finished carts. Please compare these against any existing games. Some of these standards are changed, and they supercede previous standards. Note that these standards may be waived on a case-by-case basis to maintain copyright loyalty or for games with special requirements.

## Power-up

Games should power-up displaying a **Copyright Screen**. Game parameters should be single player and **Default Difficulty**. After about 20 seconds, the game should go into **Auto-Play** mode. From then on the game alternates between **Copyright Screen** and **Auto-Play**. This is called the **Idle Sequence**.

### Copyright Screen

The **Copyright Screen** should contain the first screen from the game or game title (some 2600 games have a title screen and some don't) and the copyright. The ATARI copyright MUST appear in the form:

`© 1987 ATARI CORP.`

or

`copyright 1987 Atari`

Note © MUST be a 'c' within a circle, not in parentheses. The year should be shown as the first year the cartridge is released (if different from the year it was programmed). Some games may also require a copyright message for the licensor. Text to be specified on a per-game basis.

### Auto-Play

**Auto-play** should display typical gameplay. Try to show as many different features of the game as possible. If the game has multiple screens, try to show all or many of them. At power-up, scores should be set to zero, otherwise the most recent scores should be displayed. **Auto-play** should incorporate all game sounds.

## Game Select

Due to limitations of the 2600, game options are usually displayed as option numbers only (referenced in the manual). It is desired, however, that text be used if possible and if it does not take up otherwise needed code space. **Game Select** is usually part of the **Copyright Screen** or the **Auto-Play** display. If any game option is changed, all scores must be zeroed. The following Game Select display is offered as a suggestion for a way to display options using numbers:

```text
+---------------------------------------------------+
|                                                   |
|          GAME                   PLAYERS           |
|                                                   |
|           1                        1              |
```

Alternately, the following is a way to display the options in the better-looking manner, utilizing text:

```text
1 PLAYER

NOVICE

STANDARD

ADVANCED

EXPERT



2 PLAYERS
```

### Entering Game Select Mode

Depressing the **Select** switch at any time will start the **Game Select Mode**. Moving player 1's controller (not pressing the button, which starts the game) during **Copyright Screen** or **Auto-Play** causes **Game Select Mode** to be entered. Whenever the **Game Select Mode** is entered, the current game settings should be displayed.

### Remote Game Select

Any game using a joystick or trackball should use them to change game options. While in the number-style menu screen, player 1's controller should act as follows:

```text
RIGHT   increase game #

LEFT    decrease game #

UP      increase #/players

DOWN    decrease #/players
```

While in the text-style menu screen, the joystick is used somewhat differently:

```text
DOWN    Select difficulty level displayed below currently highlighted one

UP      Select difficulty level displayed above currently highlighted one

RIGHT   Not used

LEFT    Not used
```

(See **2600 DESERT FALCON** for an example of this usage.)

If the controller position is maintained. the game option should be changed about every half second. If the controller was used to start **Game Select Mode**, there should be a half second delay before the same setting changes the game options.

Standards for remote changing of game options using other controllers will be designed on a per-game basis.

### Local Game Select

The **Remote Game Select** is the method of choice due to its convenience, but there is also the standard 2600 game select mechanism. If the **Select** switch is depressed in the **Game Select Mode**, the difficulty is increased by one. If the difficulty was at the maximum, it is wrapped to the minimum and the number of players is increased. If the number of players is at the maximum, it wraps.

If the **Select** switch is held down, the game options should be changed about every half second. If the **Select** switch was used to start the **Game Select Mode**, there should be a half second delay before the same depression of **Select** changes the game options.

### Leaving Game Select Mode

Normally, the player will start a game after selecting his options (see **Starting a Game**). However, if the player leaves the game in the **Game Select Mode** for 30 seconds or so without changing any options, the game should go to the **Copyright Screen** and resume the **Idle Sequence**.

## Gameplay

This section deals with the mechanics of starting, pausing, and ending gameplay.

### Starting a Game

Depressing the **Reset** switch at any time will start a new game using the current game parameters. A press of player 1's fire button during **Copyright Screen**, **Auto-play**, or **Game Select Mode** will start a new game. When a game is started with the joystick button, the game should not use the same button depression for a game action (like firing a shot, for instance). The **Reset** switch should be debounced so it does not start another game until it is first released.

### Pause

The **Color/B&W** switch is used to toggle into and out of **Pause Mode**. The **Pause** feature is only active during actual gameplay. When the **Color/B&W** switch is depressed, video is frozen and audio is turned off. After about 15-30 minutes if there is no input from the player the screen goes blank. While there is a blank screen, and controller inputs (including fire buttons) should re-display the screen without leaving the **Pause** state. A second depression of the **Color/B&W** switch should resume the game as if it had never paused. No sounds or display sequences should be lost.

### Screen Display

For the most part, screen display of licensed/converted games will emulate existing screen display. However. these are offered for consideration in the absence of such guidelines:

* In general, suppress leading zeroes.
* Typically, in a 1-player game, the score for player 1 is displayed on the left side of the screen. However this is not a hard and fast rule and the score in some games may be centered.
* In a 2-player game, if both scores are shown, the score for player 1 is displayed on the left side of the screen and the score for player 2 is displayed on the right side of the screen.
* The number of game lives is indicated by game life markers and the player's object on screen. For game life markers, icons should be used instead of numbers to represent game lives. One game life marker disappears each time a defeat occurs until the player is down to his last remaining game life. At that time, the player's last remaining game life is indicated by the player's object on screen. Example: If '\*' is the game life marker and the player has three game lives left, it should be expressed as '\* \*' (and the player's object on screen) instead of '\* \* \*' or some such scheme.
* If applicable, level of play should be indicated on screen.

### Game End

A **GAME OVER** message should be displayed at the end of each player's game telling which player is out of the game. When all games in progress are over, the game freezes on the screen and the fire button is disabled for 2 seconds while the **GAME OVER** message is displayed. After the 2 second freeze, if the player presses the fire button, the game restarts at the same difficulty level and with the same number of players as was previously selected. If this action is not taken, after 20-30 seconds the game automatically goes to the **Title Screen**/**Copyright Screen** and **Idle Sequence**.

## Game Options

This section deals with the various options the player can choose. Most games naturally fall into the 'One Player' or 'Two Player Alternating' mold. Game programmers are encouraged to explore the possibilities of **Competitive** and **Team** play options. In 2-player alternating mode, player 1's joystick should be deactivated while it is player 2's turn, and vice versa.

### Difficulty Settings

All games should provide a range of difficulty settings. This is to provide a fun game for everyone from a video-game addict to your grandmother. The **Default Difficulty** should be one higher than **Novice**. The number of settings will change from game to game, but a sample progression might be:

1) **Novice:** This should be very easy for anyone with any gaming ability, and is geared toward very young and very old players.
2) **Standard:** A setting which involves skill to play, but not much. This is the level that most people would play for their first game.
3) **Advanced:** A setting which is about 'arcade' level, perhaps a bit easier.
4) **Expert:** This is a 'killer' setting, but not so hard that no one will be able to enjoy it. This is for the kids who play your game every day and get very, very good at it. Keep in mind that they aren't putting quarters in.

In addition to the difficulty levels listed above, players may be handicapped by using the difficulty switches. See the **Difficulty** Switches section below.

### Competitive Play

Competitive play is a version where one player is playing predominately against the other player, and the objective is to have a higher score at the end of the game than the other player.

* In COMPETITIVE play, the players can kill each other, typically by shooting each other. Points are awarded to the player who killed the other.
* Collisions between players can be death for both, obstructive collisions, or just passing through, depending on what makes sense for the game.
* Each player has an individual score displayed on the screen.
* Each player has an individual pool of lives which is displayed on the screen. When a player is killed, he loses one of these lives. Gameplay might stop at any death, or continue smoothly, depending on the game.
* Victory is based on high score at game's end. A message such as "Player 1 WINS" should be displayed.
The game ends when both players are out of lives or one player is out and the other player has more points, depending on the game.

### Team Play

**Team** play is a version where both players are playing together as a team and the objective is to maximize the team score. Some features of **Team** play are:

* The players cannot kill each other.
* There is a common pool of lives that the players pull from. When either player dies, a life is lost from the common pool. If the pool runs out, and the remaining player gains a bonus life, it is given to the inactive player. The game ends when the lives run out and both players are dead.
* There may be a common score and individual scores displayed.

## Controllers

For a 1-player game, always read the left-most controller. For a multi-player game, assign controllers from left to right. Controllers should only be shared for:

* Games which use all controllers for one player (like Robotron).
* Games with more players than controllers.

Games which use non-standard controllers should support joysticks if possible. Any mixture of valid controllers should be allowed for multi-player games.

## Difficulty Switches

Players of differing skills may be handicapped by using the difficulty switches. The 'A' position (advanced) is the more difficult setting, and the 'B' position (beginner) is the easier setting. Any game using these switches should poll them frequently.

## No-Defeat Mode

In a non-release version of all games, a no-defeat mode should be included for testing, documenting, and sales purposes. A way is needed for moderately-skilled players to see the higher levels of play.

## Foreign Versions

All 2600 games MUST be made in both PAL and NTSC versions. SECAM should also be supported (most PAL games work fine on SECAM machines). If this is kept in mind from the start, then the conversion process can be much easier at completion of the NTSC version.
