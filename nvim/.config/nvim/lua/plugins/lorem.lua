return {
  'derektata/lorem.nvim',
  ft = 'html',
  config = function()
    require('lorem').opts {
      sentence_length = 'medium',
      comma_chance = 0.2,
      max_commas = 2,
    }
  end,
}
