return {
  'folke/snacks.nvim',
  enabled = true,
  priority = 1000,
  lazy = false,
  keys = {
    -- stylua: ignore start
    { '<leader>sc', function() Snacks.picker.highlights() end, desc = '[S]earch [C]olor highlights' },
    { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
    { '<leader>sf', function() Snacks.picker.files() end, desc = '[S]earch [F]iles' },
    { '<leader>st', function() Snacks.picker.colorschemes() end, desc = '[S]earch [T]heme' },
    { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord' },
    { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
    { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
    { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', function() Snacks.picker.buffers() end, desc = '[ ] Find existing buffers' },
    { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit', },
    { '<leader>gl', function() Snacks.lazygit.log() end, desc = 'Lazygit Log (cwd)', },
    -- stylua: ignore end
  },
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    styles = {
      float = {
        backdrop = 100,
      },
    },
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    indent = {
      enabled = false,
      animate = {
        enabled = false,
      },
    },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        buffers = { hidden = true },
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
    dashboard = {
      enabled = true,
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
  },
}
