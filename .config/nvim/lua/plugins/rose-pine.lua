return {
	"rose-pine/neovim",
	name = "rose-pine",

    config = function()
        require("rose-pine").setup({
            variant = "moon",
            styles = {
                transparency = true
            }
        })
    end
}
