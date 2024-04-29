return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = function()
    local logo = [[
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
⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣯⠀⢺⣄⠈⢚⠑⠤⠤⠤⠤⢴⣾⠇⢀⡀⠀⠀⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]

    logo = string.rep('\n', 4) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n'),
        center = {
          {
            action = 'Telescope find_files',
            desc = ' Find file',
            icon = ' ',
            key = 'f',
          },
          {
            action = 'Telescope oldfiles',
            desc = ' Recent files',
            icon = ' ',
            key = 'r',
          },
          {
            action = 'Telescope live_grep',
            desc = ' Find text',
            icon = ' ',
            key = 'g',
          },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '󱐋 Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
        colors = {
          -- Change 'Neovim loaded' text color to green
          loaded_color = '#00FF00',
        },
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DashboardLoaded',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    return opts
  end,
}
