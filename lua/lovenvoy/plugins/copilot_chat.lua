
local setup, copilotchat = pcall(require, "CopilotChat")
if not setup then
	return
end

copilotchat.setup({
  -- model = 'gpt-4o',           -- AI model to use
  temperature = 0.1,           -- Lower = focused, higher = creative
  window = {
    layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
    width = 0.5,              -- 50% of screen width
  },
  auto_insert_mode = true,     -- Enter insert mode when opening

})

vim.g.copilot_no_tab_map = true
-- Map Shift+Tab to accept Copilot's suggestion
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

