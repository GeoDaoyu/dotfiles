return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        projects = {
          dev = {
            "~/Documents/GitHub",
            "~/Documents/GitLab",
          },
          patterns = { ".git" },
        },
      },
    },
  },
}
