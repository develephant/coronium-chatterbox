# Coronium ChatterBox Standalone

## Installation

### Linux (Ubuntu 16) / OSX

Select a distribution directory (__linux__ or __osx__), copy the __chatterbox__ binary inside to __/usr/local/bin__. Be sure to set the proper permissions.

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
chatterbox path/to/config.lua
```

You can access the server with your ip using the __Coronium ChatterBox Plugin__ available on the __[Corona Marketplace](https://marketplace.coronalabs.com)__.
