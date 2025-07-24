return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "float" },
    },
    keys = {
      { "fe", function() require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root(), reveal = true }) end,  desc = "Explorer NeoTree (Root Dir)" },
      { "fE", function() require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd(), reveal = true }) end,    desc = "Explorer NeoTree (cwd)" },
      { "e",  "fe",                                                                                         desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "E",  "fE",                                                                                         desc = "Explorer NeoTree (cwd)",      remap = true },
      { "ge", function() require("neo-tree.command").execute({ source = "git_status", toggle = true, reveal = true }) end, desc = "Git Explorer" },
      { "be", function() require("neo-tree.command").execute({ source = "buffers", toggle = true, reveal = true }) end,    desc = "Buffer Explorer" },
    },
  }
}
