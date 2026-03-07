local ok, claude_code = pcall(require, "claude-code")
if not ok then
  return
end

claude_code.setup({
  window = {
    split_ratio = 0.3,
    height_ratio = 0.3,
    position = "float",
    enter_insert = true,
    start_in_normal_mode = false,
    hide_numbers = true,
    hide_signcolumn = true,
    float = {
      width = "80%",
      height = "80%",
      row = "center",
      col = "center",

      border = "rounded",
    },
  },
  refresh = {
    enable = true,
    updatetime = 100,
    timer_interval = 1000,
    show_notifications = true,
  },
  git = {
    use_git_root = true,
    multi_instance = true,
  },
  shell = {
    separator = "&&",
    pushd_cmd = "pushd",
    popd_cmd = "popd",
  },
  command = "claude",
  command_variants = {
    continue = "--continue",
    resume = "--resume",
    verbose = "--verbose",
  },
  keymaps = {
    toggle = {
      normal = "<leader>co",
      terminal = "<leader>co",
      variants = {
        continue = "<leader>cC",
        verbose = "<leader>cV",
      },
    },
    window_navigation = true,
    scrolling = true,
  },
})
