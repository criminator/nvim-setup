vim.pack.add { 'https://github.com/dgox16/oldworld.nvim' }
require('oldworld').setup {
  terminal_colors = true,
  variant = 'default',
  styles = {
    booleans = { italic = true },
    comments = { italic = true },
    functions = { italic = true, bold = true },
    identifiers = { italic = true },
  },
  integrations = {
    neo_tree = true,
  }
}

