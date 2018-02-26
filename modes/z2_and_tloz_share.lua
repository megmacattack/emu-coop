-- STOP! Are you about to edit this file?
-- If you change ANYTHING, please please PLEASE run the following script:
-- https://www.guidgenerator.com/online-guid-generator.aspx
-- and put in a new GUID in the "guid" field.

-- Author: megmacattack

return {
	guid = "251d0ccc-01b2-4f24-b960-1b948bd196b7", -- note: this guid should be the same as for the tloz file
	format = "1.1",
	name = "Zelda 2 synced with The Legend of Zelda",
	match = {"stringtest", addr=0xffe0, value="LEGEND OF ZELDA2"},

	--running = {"test", addr = 0x12, gte = 0x4, lte = 0xD}, -- zelda 1 data. Note, doc says nothing about states between 0x7 and 0xe but they appear to be cave/level related.

	sync = {
		[0x0785] = {
			kind="trigger",
			writeTrigger=function(value, previousValue, force)
				if value > 0 then
					send("z2_obtained", "red_candle")
				end
			end
		},
	},
	custom = {
		tloz_obtained=function(item)
			print("hihi"..item)
			if item == "red_candle" then
				message("Partner obtained red candle!")
				memoryWrite(0x0785, 1)
			end
		end,
	},
}