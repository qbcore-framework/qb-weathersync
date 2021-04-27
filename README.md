# qb-weathersync
Synced weather and time for QB-Core Framework :sunrise:

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)

## Features
- Syncs the weather for all players

### Commands
- /blackout - Toggles blackout
- /clock [hour] [minute] - Sets the exact time
- /time [morning/noon/evening/night] - Sets the generic time
- /weather [type] - Changes the weather type 
- /freeze [weather/time] - Freezes the current weather/time

## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure qb-core
ensure qb-weathersync
```

## Configuration
You can adjust available weather and time types in qb-weathersync\server\main.lua
