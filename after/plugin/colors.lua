function Colors()
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })


    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'grey', bold = false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'yellow', bold = true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'grey', bold = false })
end

Colors()
