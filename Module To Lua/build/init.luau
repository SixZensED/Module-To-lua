local fs = require("@lune/fs")
local process = require("@lune/process")
local BuildCodegen = require("modules/BuildCodegen")

local FilePath = "fff/main.lua"
local TempFile = "fff/temp.lua"

local Module = fs.readFile("fff/www.rbxm")
local ModelCodegen = BuildCodegen(Module, false)

fs.writeFile(FilePath,"\n"..(ModelCodegen))