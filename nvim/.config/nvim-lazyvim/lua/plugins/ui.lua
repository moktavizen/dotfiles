return {
  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
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

      logo = string.rep("\n", 1) .. logo .. "\n"

      opts.config.header = vim.split(logo, "\n")
      opts.config.center = {
        {
          action = "Telescope find_files",
          desc = " Find file",
          icon = " ",
          key = "f",
        },
        {
          action = "Telescope oldfiles",
          desc = " Recent files",
          icon = " ",
          key = "r",
        },
        {
          action = "Telescope live_grep",
          desc = " Find text",
          icon = " ",
          key = "g",
        },
        {
          action = [[lua require("lazyvim.util").telescope.config_files()()]],
          desc = " Config",
          icon = " ",
          key = "c",
        },
        {
          action = 'lua require("persistence").load()',
          desc = " Restore Session",
          icon = " ",
          key = "s",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = "" }),
          },
        },
      },
    },
  },
}
