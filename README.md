# Womi Apps - Corona SDK
A corona scene for showing all the Womi apps.

- Current Version : 1.0.0

![Screenshot](https://github.com/iranjith4/coronawomiapps/blob/master/screenshot.png)

## Integration
1. Copy the `coronawomiapps` folder from the repository and place at the top level in your corona app where `main.lua` is.
2. Add the Internet Permission for the app. (Only for android)
```lua
  settings =
  {
      android =
      {
          usesPermissions =
          {
              "android.permission.INTERNET",
          },
      },
  }
```

For Corona Enterprise,  to build on iOS 9 and above, you need to diable ATS.  Add this keys in `info.plist`

![Disable ATS](https://github.com/iranjith4/coronawomiapps/blob/master/disableats.jpg)

Or you can disable ATS using plist xml - Add this into your info.plist
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## Usage
Add the following code at the place where you need to open the more apps.

```lua
local options =
{
  isModal = true,
  effect = "fade",
  time = 200,
}

composer.showOverlay("coronawomiapps.coronamoreapps",options)
```

## Change Logs
- No changelogs for now :)

## Thanks
Thanks for using Corona Womi Apps. Feel free to Fork, send Pull request. In case of any bugs, please create an issue [here](https://github.com/iranjith4/coronawomiapps/issues).
