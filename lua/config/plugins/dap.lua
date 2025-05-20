-- edited from :
-- https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dap.lua
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require "dap"
    local ui = require "dapui"

    require("dapui").setup()
    require("dap-go").setup()

    require("dap-python").setup("$HOME/.virtualenvs/debugpy/bin/python")

    dap.adapters["node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { "$HOME/.dap/js-debug/src/dapDebugServer.js", "${port}" }
      }
    }
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      }
    }

    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n","<leader>gb", dap.run_to_cursor)

    -- Eval var under cursor
    vim.keymap.set("n", "<leader>?", function()
      ui.eval(nil, { enter = true })
    end)

    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<F12>", dap.restart)

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end
}
