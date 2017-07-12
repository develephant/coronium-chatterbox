# Coronium ChatterBox Standalone

## Installation

### Linux (Ubuntu 16) and OSX

Select a distribution (Linux or OSX), copy the __chatterbox__ binary to __/usr/local/bin__. Be sure to set the proper permissions.

You will need a __config.lua__ file to start up the server, for example:

```lua
--config.lua
return 
{
  key = "8477ebc412386117059664d45637e397",
  port = 7175,
  room = "Lobby",
  timeout = 900 --secs
}
```

To start the __Coronium ChatterBox__ server:

```
./chatterbox path/to/config.lua
```

If you've kept the defaults, you can access the server with your ip on port 7175
