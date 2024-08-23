pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include ./lua/utility.lua
#include ./lua/game.lua
#include ./lua/player.lua
#include ./lua/spawn.lua
#include ./lua/objectupdate.lua
#include ./lua/inputs.lua
#include ./lua/rooms.lua
#include ./lua/drawfunctions.lua
#include ./lua/init.lua

#include ./lua/update.lua
#include ./lua/draw.lua

__gfx__
00000000044444000444440006444640064646400000600000077000000770000007770000077700000778000000000000000000000000000000000000000000
00000000040444000444040004044040044444400000600000707700007707000070707000777770000778000000000000000000000000000000000000000000
00700700044440000044440004444440044444400000600000877700007778000078087000777770000877000000000000000000000000000000000000000000
00077000006660000066600000666600006666000000600000877000000778000008780000077700000070000000000000000000000000000000000000000000
00077000004640000044400000444400004464000060606000070000000070000008780000087800000070000000000000000000000000000000000000000000
00700700004640000044400000444400004444000006860000070000000070000000700000007000000070000000000000000000000000000000000000000000
00000000004440000044400000444400004644000000500000070000000070000000700000007000000070000000000000000000000000000000000000000000
00000000004440000044400000464400004444000000500000070000000070000000700000007000000070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3b3333b33b3333b33b333666666333b33b333666666333b33b3333b33b3333b33b333366666633b33b333666666333b33b3333b33b3333b33b3333b33b3333b3
3b3333333b3333333b333666666333333b333666666333333b3333333b3333333b333366666633333b333666666333333b3333333b3333333b3333333b333333
333b3333333b3333333b366666633333333b366666633333333b3333333b3333333b336666663333333b3666666b3333333b3333333b3333333b3333333b3333
333b3333333b3333333b366666633333333b366666633333333b3333333b3333333b336666663333333b3666666b3333333b3333333b3333333b3333333b3333
3333333b3333333b333336666663333b333336666663333b333333333333333b333333666666333b333336666663333b3333333b3333333b3333333b3333333b
b333333b3333333b6666666666666666b33336666663333b6666666666666666666666666666333bb333366666666666666666666663333bb333366666666666
b333b3333333b3336666666666666666b333b6666663b3336666666666666666666666666666b333b333b66666666666666666666663b333b333b66666666666
3333b3b33333b3b366666666666666663333b6666663b3b36666666666666666666666666666b3b33333b66666666666666666666663b3b33333b66666666666
3b3333b33b3333b366666666666666663b333666666333b3666666666666666666666666666633b33b3336666666666666666666666333b33b33366666666666
3b3333333b33333366666666666666663b33366666633333666666666666666666666666666633333b3336666666666666666666666333333b33366666666666
333b3333333b33336666666666666666333b36666663333366666666666666666666666666663333333b36666666666666666666666b3333333b366666666666
333b3333333b3333333b366666633333333b366666633333333b333333333333333b3333333b3333333b3333333b3333333b3666666b3333333b3666666b3333
333333333333333b333336666663333b333336666663333b333333333333333b333333333333333b333333333333333b333336666663333b333336666663333b
b3333333b333333bb33336666663333bb33336666663333bb3333333b333333bb3333333b333333bb3333333b333333bb33336666663333bb33336666663333b
b333b333b333b333b333b6666663b333b333b6666663b333b333b333b333b333b333b333b333b333b333b333b333b333b333b6666663b333b333b6666663b333
3333b3b33333b3b33333b6666663b3b33333b6666663b3b33333b3b33333b3b33333b3b33333b3b33333b3b33333b3b33333b6666663b3b33333b6666663b3b3
3b3333b33b3333b33b333666666333b33b3333b33b3333b33b3333b63b3333b30000000000000000000000000000000000000000000000000000000000000000
3b333333333333333b333666666333333b3333333b3333333b3333333b3333330000000000000000000000000000000000000000000000000000000000000000
333b33333bbbbb33333b3666666b3333333b3333333b3333333b3633333b33330000000000000000000000000000000000000000000000000000000000000000
333b33333bbbbb33333b3666666b3333333b3333333b3333333b3333333b33330000000000000000000000000000000000000000000000000000000000000000
33333333bbbbbbb3333336666663333b3333333b3333333b3333223b3333333b0000000000000000000000000000000000000000000000000000000000000000
b3bbbbb3bbbbbbb366666666666666666666666666666666b33325555553333b0000000000000000000000000000000000000000000000000000000000000000
b3bbbbb3bb444bb366666666666666666666666666666666b33355555555b3330000000000000000000000000000000000000000000000000000000000000000
3bbbbbbb334443336666666666666666666666666666666633355555555553b30000000000000000000000000000000000000000000000000000000000000000
3bbbbbbb33444333666666666666666666666666666666663b555555555555b300000000000000003b3333b30000000000000000000000000000000000000000
3bb444bb3344433366666666666666666666666666666666355555555555555300000000000000003b3333330000000000000000000000000000000000000000
333444333344433366666666666666666666666666666666333dddddddddd3330000000000000000666666660000000000000000000000000000000000000000
33344433333b3333333b3333333b3333333b366666663333333dddddddddd3330000000000000000666666660000000000000000000000000000000000000000
333444333333333b333333333333333b333336666666333b333d5dd66dd5d33b0000000000000000666666660000000000000000000000000000000000000000
b3344433b333333bb3333333b333333bb33336666666333bb33d5dd664d5d33b0000000000000000666666660000000000000000000000000000000000000000
b333b333b333b333b333b333b333b333b333b6666666b333b33dddd66dddd3330000000000000000b36666330000000000000000000000000000000000000000
3333b3b33333b3b33333b3b33333b3b33333b6666666b3b3333dddd66dddd3b30000000000000000336666b30000000000000000000000000000000000000000
__map__
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6667404060614040404040404040404040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7677404070714040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
62634647464746474c4d40404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
72735657565756575c5d40404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040444540404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4041404140414041545500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5051505150515051444500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
002000101a1501a1501a1501a1501e1501e1501e1501e150221502215022150221502215022150221502215001000010000100001000010000100001000010000000000000000000000000000000000000000000
002000102305024050250502805025000230501f00020050200502000023050240502000021050210500000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400003f6003f6003f6003f6003f6003f6003f60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 00014344

