# Nvconfig

Stub for using [base46](https://github.com/NvChad/base46)
without [NvChad](https://github.com/NvChad/NvChad)

## Config examples

- For [Lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
  "LexeyKhom/nvconfig",
  dependencies = {
    { "NvChad/base46", branch = "v3.0" }, -- Important! Only works with branch "v3.0"
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  opts = function()
    local hl_override =  require("plugins.nvconfig.hl_override")
    local hl_add = require("plugins.nvconfig.hl_add")
    return {

      -- Config path. Need for cmd "Telescope themes"
      path = "plugins/nvconfig/init.lua",

      ui = {
        theme = "yoru",
        hl_override = hl_override,
        hl_add = hl_add,
      },
      base46 = {
        integrations = {
          "blankline",
          "cmp",
          "dap",
          "defaults",
          "git",
          "lsp",
          "mason",
          "nvimtree",
          "rainbowdelimiters",
          "semantic_tokens",
          "syntax",
          "telescope",
          "treesitter",
          "whichkey",
        },
      },
    }
  end,
  config = function(_, opts)
    require("nvconfig.opts").setup(opts)
  end,
}
```

## Options

All other options can be found in the Base46 repository
