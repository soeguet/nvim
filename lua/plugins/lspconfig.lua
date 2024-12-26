return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
    },
    -- LSP Server Settings
    ---@type lspconfig.options
    servers = {
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        -- ---@type LazyKeysSpec[]
        -- keys = {},
        settings = {
          Lua = {
            diagnostics = {
              globals = { "socket" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                -- Make the LuaRocks modules visible to lua_ls
                vim.fn.expand("$VIMRUNTIME/lua"),
                "/usr/local/lib/luarocks/rocks-5.1/",
                vim.fn.expand("~/.luarocks/share/lua/5.1/"),
                "/usr/share/lua/5.1/",
                "/usr/local/lib/lua/5.1/",
                "/usr/local/lib/lua/5.1/parser/",
                -- "/home/soeguet/.luarocks/lib/luarocks/rocks-5.1/luv/1.48.0-2/lib/",
                -- "/home/soeguet/.luarocks/lib/luarocks/rocks-5.1/http/0.4-0/",
              },
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = true,
              paramType = true,
              paramName = "All",
              semicolon = "All",
              arrayIndex = "Auto",
            },
            runtime = {
              version = "Lua 5.1", -- Adjust the Lua version as needed
              path = {
                "?.lua",
                "?/init.lua",
                vim.fn.expand("~/.luarocks/share/lua/5.1/?.lua"),
                vim.fn.expand("~/.luarocks/share/lua/5.1/?/init.lua"),
                "/usr/share/5.1/?.lua",
                "/usr/share/lua/5.1/?/init.lua",
              },
            },
          },
        },
      },
    },
  },
}
