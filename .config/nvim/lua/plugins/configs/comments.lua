return {
    "numToStr/Comment.nvim",
    event = { "VeryLazy" },
    config = function()
        local comments = require("Comment")
        comments.setup()
    end,
}
