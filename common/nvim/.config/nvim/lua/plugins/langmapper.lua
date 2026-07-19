return {
	{
		"Wansmer/langmapper.nvim",
		lazy = false,
		priority = 1, -- High priority is needed if you will use `automappinng()`

		config = function()
			require("langmapper").setup({
				hack_keymap = true,
                map_all_ctrl = true,
                
                ctrl_map_modes = { "n", "o", "i", "c", "t", "v" },

                disable_hack_modes = { "i" },

				-- automapping_modes = { "n", "v", "x", "s" },
			})

            -- require("langmapper").automapping({
            --     global = true,
            --     -- buffer = true,
            -- })
		end,
	}
}
