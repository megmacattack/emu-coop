-- STOP! Are you about to edit this file?
-- If you change ANYTHING, please please PLEASE run the following script:
-- https://www.guidgenerator.com/online-guid-generator.aspx
-- and put in a new GUID in the "guid" field.

-- Author: megmacattack

return {
	guid = "251d0ccc-01b2-4f24-b960-1b948bd196b7", -- note: this guid should be the same as for the z2 file
	format = "1.1",
	name = "The Legend of Zelda synced with Zelda 2",
	match = {"stringtest", addr=0xffeb, value="ZELDA"},

	running = {"test", addr = 0x12, gte = 0x4, lte = 0xD}, -- zelda 1 data. Note, doc says nothing about states between 0x7 and 0xe but they appear to be cave/level related.

	sync = {
		[0x065B] = {
			kind="trigger",
			writeTrigger=function(value, previousValue, force)
				if value > 1 then
					send("tloz_obtained", "red_candle")
				end
			end
		},
	},
	custom = {
		z2_obtained=function(item)
			print("hihi".. item)
			if item == "red_candle" then
				message("Partner obtained red candle!")
				memoryWrite(0x065B, 2)
			end
		end,
	},
}