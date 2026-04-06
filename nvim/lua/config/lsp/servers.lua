local servers = {
  helm_ls = {
    settings = {
      ["helm-ls"] = {
        yamlls = {
          path = "yaml-language-server",
        },
      },
    }
  },

  ruff = {
    init_options = {
      settings = {
        configurationPreference = "filesystemFirst",
        showSyntaxErrors = false,
      },
    },

  },

  yamlls = {
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
      },
    },
  },
}

return servers
