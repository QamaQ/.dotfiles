return {
	"numToStr/Comment.nvim",
	event = { "VeryLazy", "CursorHold", "CursorHoldI" },
	config = function()
		local comments = require("Comment")
		comments.setup()
	end,
}
