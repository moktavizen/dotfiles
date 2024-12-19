return {
  'folke/snacks.nvim',
  -- enabled = false,
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      },
    },
    dashboard = {
      -- enabled = false,
      width = 50,
      preset = {
        header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡑⠄⣀⠀⠀⠰⡀⢢⣄⠀⡜⠽⣠⡄⠀⠸⢤⢷⠀⢀⡆⡰⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣐⣕⠬⢳⡢⠤⢧⡦⣉⠳⢇⠹⡈⠓⣜⡇⢬⠠⣀⡶⠽⠑⠂⠉⠁⠢⡀⠀⠀⠀
⠀⠀⠀⠀⡀⣄⣠⣲⣍⣉⣉⣁⠀⠻⣵⡚⢴⡅⠢⡀⢓⠬⠀⠀⠙⠉⠳⣼⠑⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⡀⠀
⠀⢀⠠⠴⡄⣖⣀⣤⣤⣒⠹⢭⡙⣶⠈⠲⠄⠀⠆⡈⠪⣦⡀⠀⢘⡄⠀⡇⢸⠀⠀⡜⣜⠮⣧⢳⡣⠀⠀⢸⠀
⠀⠀⠀⠀⠛⠤⣿⠣⡌⡑⠋⠰⢈⠩⣃⠀⢰⠀⠀⢳⣄⢱⡟⠀⣸⠀⡸⢠⢸⠀⠀⠀⢲⠲⡔⡲⠀⠀⠀⢸⠀
⠀⠀⠀⢀⣔⣮⠩⠜⠛⠵⢄⠘⡣⡢⣈⡀⠘⣣⡀⠀⢫⡜⠈⠀⠙⢐⣷⣗⢸⠀⠀⢨⣩⡠⡍⡄⡄⠀⠀⢸⠀
⠹⣄⡴⡓⠂⠭⢀⡀⠅⠀⠰⢷⣦⣄⡨⠻⢦⡈⠣⠀⠀⠠⠄⠀⠃⠁⠈⠛⢻⠀⠀⠘⠘⠘⠘⠘⠐⠀⠀⡄⠀
⠀⠹⢹⡿⢿⣭⠧⠚⡈⡤⠔⠂⠀⠈⢉⣲⣤⠬⠁⠀⢀⣀⣼⠗⠀⠀⠀⢸⠀⣵⢤⣀⡀⠀⠀⠀⢀⣀⠌⣀⠀
⠀⢠⢖⢹⣙⠌⡐⠷⠛⣰⢁⢀⡴⠚⠋⠉⠀⣀⠐⠞⢉⢨⠜⠀⣴⠞⠀⠘⠀⠫⢆⠄⡹⡮⡉⢫⡸⠪⠂⠉⠉
⠰⠕⡓⡣⢳⢺⡼⢺⡽⢀⣦⢂⢒⠒⡆⡹⣩⠞⡠⣴⠛⡡⣂⡼⠱⢊⢐⡌⡤⡌⠂⠀⣷⢫⡼⢌⢳⡝⢷⠀⠀
⠈⠀⢹⠔⣩⣫⠼⡗⢵⣻⣰⣵⠗⡯⣰⠝⣡⠿⣣⡥⣛⠟⣣⠚⡠⡿⡚⣜⢆⡇⢳⠐⡞⡆⢛⡜⣥⠈⠂⠇⠀
⠀⠀⢑⠞⣩⣢⣣⣻⣿⡇⣳⡏⠳⡇⣲⣧⡒⠩⡢⢫⣛⠈⢏⠜⣰⣕⣟⡼⢺⡇⠿⡜⣰⡼⢡⢬⣹⡀⠀⠀⠀
⠀⠀⠐⠚⣙⢅⠶⣵⠎⣟⣧⣠⢿⢻⢿⠦⢤⣀⡀⢻⠀⠸⡱⣐⣠⡼⡾⠓⠒⡅⢸⡔⡙⠀⣍⣣⢿⠁⠀⠀⠀
⠀⠀⠐⠊⠉⢣⢫⡗⡸⡷⢃⠘⡟⠻⡚⡷⣦⠀⢹⡂⠀⠈⡔⠉⢀⡶⡟⢿⠟⢣⣸⣼⠁⡸⢌⢯⠲⡄⠀⠀⠀
⠀⠀⠀⠀⠈⠁⢸⠸⢳⢱⠀⠀⠘⠂⠈⠥⠜⠗⠰⠀⠀⠀⠁⠠⣜⠢⠬⠁⠐⢢⢯⠃⢱⢣⠇⠑⡆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠁⠜⠋⠛⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠐⠀⢦⡟⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⢸⠁⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣄⠀⠀⠀⠀⠀⠀⠀⠠⡀⡠⠀⠀⠀⠀⠀⠀⠀⠀⣸⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⢿⡢⡀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠄⠀⡠⢊⡇⠀⠀⠀⠀⠀ ⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠇⠘⢄⠀⠀⠘⠻⠭⠭⠭⠭⠋⠀⠀⡠⠊⢰⣿⠆⠀⠀⠀⠀ ⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣧⢠⡀⠈⢷⣄⠀⠀⠀⠀⠀⠀⠀⣠⠎⠀⠀⠜⣽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣯⠀⢺⣄⠈⢚⠑⠤⠤⠤⠤⢴⣾⠇⢀⡀⠀⠀⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
        },
      },
    },
    lazygit = {
      enabled = true,
      theme = {
        inactiveBorderColor = { fg = 'FloatBorder' },
        defaultFgColor = { fg = 'NormalFloat' },
        activeBorderColor = { fg = 'DiagnosticOk', bold = true },
        searchingActiveBorderColor = { fg = 'DiagnosticOk', bold = true },
      },
    },
    styles = {
      float = {
        backdrop = 100,
      },
    },
  },
  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Lazygit Log (cwd)',
    },
  },
}
