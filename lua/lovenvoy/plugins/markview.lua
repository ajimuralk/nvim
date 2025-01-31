local setup, markview = pcall(require, "markview")
if not setup then
	return
end

local presets = require("markview.presets")

markview.setup({
	markdown = {
		headings = presets.headings.slanted,
	},
})
