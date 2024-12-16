-- Surround each line of the current buffer with the given character
function SurroundLinesWith(character)
  local lines = vim.fn.getline(1, '$')
  for i = 1, #lines do
    lines[i] = character .. lines[i] .. character
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

vim.api.nvim_create_user_command("SurroundLinesWith", function(opts) SurroundLinesWith(opts.args) end, { nargs = 1 })
vim.keymap.set("n", '<leader>ls"', ':lua SurroundLinesWith(\'"\')<cr>', { desc = "Surround lines with double quotes" })
vim.keymap.set("n", "<leader>ls'", ":lua SurroundLinesWith(\"'\")<cr>", { desc = "Surround lines with single quotes" })

function YankAllMatches(regexp)
  local lines = vim.fn.getline(1, '$')
  local matches = {}
  for i = 1, #lines do
    for match in string.gmatch(lines[i], regexp) do
      table.insert(matches, match)
    end
  end

  vim.fn.setreg(vim.v.register, "")
  vim.fn.setreg(vim.v.register, table.concat(matches, "\n"))
end

vim.api.nvim_create_user_command("YankAllMatches", function(opts) YankAllMatches(opts.args) end, { nargs = 1 })
