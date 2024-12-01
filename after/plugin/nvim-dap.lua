local dap = require('dap')
local dapui = require('dapui')

-- Setup DAP UI
dapui.setup({
    layouts = {
        {
            elements = {
                { id = 'scopes', size = 0.25 },
                { id = 'breakpoints', size = 0.25 },
                { id = 'stacks', size = 0.25 },
                { id = 'watches', size = 0.25 },
            },
            size = 40,
            position = 'left',
        },
        {
            elements = {
                { id = 'repl', size = 0.5 },
                { id = 'console', size = 0.5 },
            },
            size = 10,
            position = 'bottom',
        },
    },
})

-- Automatically open and close DAP UI on debugger events
dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

-- GDB Adapter Configuration
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/artem627/cpptools/extension/debugAdapters/bin/OpenDebugAD7', -- Path to OpenDebugAD7 executable (from vscode-cpptools extension)
}

-- Configurations for GDB (Linux/MacOS/Windows)
dap.configurations.cpp = {
    {
        name = 'Launch file',
        type = 'cppdbg',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                description = 'enable pretty printing',
                ignoreFailures = false,
            },
        },
    },
    {
        name = 'Attach to process',
        type = 'cppdbg',
        request = 'attach',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        processId = require('dap.utils').pick_process,
        cwd = '${workspaceFolder}',
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                description = 'enable pretty printing',
                ignoreFailures = false,
            },
        },
    },
}


vim.keymap.set("n", "<leader>dt", function()
  dapui.toggle()
end)

vim.keymap.set("n", "<F5>", function()
  require('dap').continue()
end)

vim.keymap.set("n", "<F8>", function()
  require('dap').step_over()
end)

vim.keymap.set("n", "<F7>", function()
  require('dap').step_into()
end)

vim.keymap.set("n", "<S-F7>", function()
  require('dap').step_out()
end)

vim.keymap.set("n", "<F9>", function()
  require('dap').continue()
end)

vim.keymap.set("n", "<leader>dl", function()
  require('dap').run_last()
end)

vim.keymap.set("n", "<leader>b", function()
  require('dap').toggle_breakpoint()
end)
