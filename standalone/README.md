# Coronium ChatterBox Standalone

## Running

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

You can test if the server is operating using __telnet__:

```
telnet <your-ip> 7175
```

The server should respond with:

```
{"_handshake"=1}
```