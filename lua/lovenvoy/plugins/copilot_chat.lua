local ok, copilotchat = pcall(require, "CopilotChat")
if not ok then
  return
end

copilotchat.setup({
  temperature = 0.1,
  window = {
    layout = "vertical", -- 'vertical', 'horizontal', 'float'
    width = 0.5,
  },
  auto_insert_mode = true,
  debug = true, -- enable debug logging
  show_help = true,
  copilot_chat_open_buffer = true,
  prompts = {
    Explain = "Explain how it works in plain English.",
    Review = "Review the following code and suggest improvements.",
    Tests = "Explain how the selected code works, then generate unit tests.",
    Refactor = "Refactor the code to improve clarity and readability.",
  },
})

-- Copilot.vim settings (auth + mappings)
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<S-Tab>", 'copilot#Accept("\\<S-Tab>")', {
  expr = true,
  replace_keycodes = false,
})
