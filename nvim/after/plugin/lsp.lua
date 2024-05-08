


local nvim_lsp = require('lsp-zero')
local lspconfig = require('lspconfig')


nvim_lsp.on_attach(function(client, bufnr)
	nvim_lsp.default_keymaps({buffer = bufnr})

    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

	print("lsp attached")
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()

--local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'pyright', "lua_ls", "rust_analyzer"},
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  filetypes = {"python"},
})
lspconfig.lua_ls.setup(
    nvim_lsp.nvim_lua_ls({
        capabilities = capabilities,
    })
)
--lspconfig.lua_ls.setup(

--[[
	handers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	["pyright"] = function()

		lspconfig.pyright.setup{
			--capabilities = capabilities,
			--on_attach = on_attach,
			cmd = { "pyright-langserver", "--stdio" },
			root_dir = function(fname)
				return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requiements.txt")(fname) or util.path.dirname(fname)
			end,
			
			filetypes = { "python" },
			settings = {
				pyright = {autoImportCompletion = true},
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true
					},
				},
			},
			single_file_support = true,
		}
	end,
	},
})

--]]








-- If you want insert `(` after select function or method item

--cmp_autopairs.setup({})
local cmp = require('cmp')


cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),
    mapping = {
        --["<cr>"] = cmp.mapping.confirm({select = true}),
        --["<s-tab>"] = cmp.mapping.select_prev_item(),
        --["<tab>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<tab>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert,
      select = true,}
    },
    formatting = {
        format = function(entry, item)
            --item.kind = lsp_symbols[item.kind]
            item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                neorg = "[Neorg]",
            })[entry.source.name]

            return item
        end,
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

--nvim_lsp.setup()
