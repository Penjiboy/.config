return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "ollama"
        },
        -- Change the default inline adapter
        inline = {
          adapter = "ollama"
        },
        -- Change the default cmd adapter
        cmd = {
          adapter = "ollama"
        }
      }
    }
  },
}
