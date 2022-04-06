local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Settings lsp keybindings.
keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
keymap('n', '<Space>D', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', '<Space>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', '<F5>',      ':lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', '<Space>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<Space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
keymap('n', '<Space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
keymap('n', '<Space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
keymap('n', '<Space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', '<Space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', '<Space>R', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

vim.cmd("command! Def lua vim.lsp.buf.definition()")
vim.cmd("command! Dec lua vim.lsp.buf.declaration()")
vim.cmd("command! CodeAction lua vim.lsp.buf.code_action()")
vim.cmd("command! Hover lua vim.lsp.buf.hover()")
vim.cmd("command! Rename lua vim.lsp.buf.rename()")
vim.cmd("command! Refs lua vim.lsp.buf.references()")
vim.cmd("command! TypeDef lua vim.lsp.buf.type_definition()")
vim.cmd("command! Implementation lua vim.lsp.buf.implementation()")
vim.cmd("command! DiagPrev lua vim.lsp.diagnostic.goto_prev()")
vim.cmd("command! DiagNext lua vim.lsp.diagnostic.goto_next()")
vim.cmd("command! DiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
vim.cmd("command! Format lua vim.lsp.buf.formatting()")


-- Lsp installer settings
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})


local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

		if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end


--lspconfig.tsserver.setup({
    --on_attach = function(client, bufnr)
        --client.resolved_capabilities.document_formatting = false
        --client.resolved_capabilities.document_range_formatting = false        local ts_utils = require("nvim-lsp-ts-utils")
        --ts_utils.setup({})
        --ts_utils.setup_client(client)        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        --buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        --buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")        on_attach(client, bufnr)
    --end,
--})

