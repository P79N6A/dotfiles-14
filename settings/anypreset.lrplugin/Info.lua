--[[----------------------------------------------------------------------------
Copyright 2015 John R. Ellis.

If you want to disable a menu command, simply add "--" to the beginning of
the menu command's line below.

If you want to change the Windows ALT keyboard shortcut for a menu command,
edit the command name below and change the position of the "&".
------------------------------------------------------------------------------]]

return {
    LrSdkVersion = 5.0,
    LrSdkMinimumVersion = 5.0, 
    LrToolkitIdentifier = 'com.johnrellis.anypreset',
    LrPluginName = "Any Preset",
    LrPluginInfoUrl = "http://www.johnrellis.com/lightroom/anypreset.htm",
    LrExportMenuItems = {
        {title = "&Presets", file = "Presets.lua", 
         enabledWhen = "anythingSelected"}},
    VERSION = {major = 1, minor = 6, revision = 0, build = 0}}
    
    