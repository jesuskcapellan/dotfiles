local config = {}

local telescope = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git", "__pycache__" },
      },
      pickers = {
        find_files = {
          find_command = {
            'rg',
            '--files',
            '-L'
          }
        },
      },
    })
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ph', function()
      builtin.find_files({ hidden = true })
    end)
    vim.keymap.set('n', '<leader>pg', builtin.git_status, {})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    
    -- Directory-wide search and replace with preview
    vim.keymap.set('n', '<leader>pr', function()
      local search_term = vim.fn.input("Search for: ")
      if search_term == "" then return end
      
      local replace_term = vim.fn.input("Replace with: ")
      if replace_term == "" then return end
      
      -- Use ripgrep to find files containing the search term with line numbers
      local cmd = string.format("rg -n --fixed-strings '%s' .", search_term)
      local matches = vim.fn.systemlist(cmd)
      
      if #matches == 0 then
        print("No matches found for: " .. search_term)
        return
      end
      
      -- Get unique file list
      local files = {}
      local file_set = {}
      for _, match in ipairs(matches) do
        local file = match:match("^([^:]+):")
        if file and not file_set[file] then
          table.insert(files, file)
          file_set[file] = true
        end
      end
      
      -- Show files that will be affected
      print("\nFiles to be updated (" .. #files .. "):")
      for i, file in ipairs(files) do
        print(string.format("  %d. %s", i, file))
      end
      
      -- Show preview of changes
      print("\nPreview of changes:")
      print(string.rep("-", 50))
      local preview_count = 0
      for _, match in ipairs(matches) do
        if preview_count >= 10 then  -- Limit preview to first 10 matches
          print("... (showing first 10 matches, " .. (#matches - 10) .. " more)")
          break
        end
        local file, line_num, content = match:match("^([^:]+):(%d+):(.*)$")
        if file and line_num and content then
          local new_content = content:gsub(vim.pesc(search_term), replace_term)
          print(string.format("%s:%s", file, line_num))
          print(string.format("  - %s", content))
          print(string.format("  + %s", new_content))
          print("")
          preview_count = preview_count + 1
        end
      end
      
      -- Confirm the operation
      local confirm = vim.fn.input(string.format("Replace '%s' with '%s' in %d files? (y/N): ", 
        search_term, replace_term, #files))
      
      if confirm:lower() ~= 'y' then
        print("Operation cancelled")
        return
      end
      
      -- Perform the replacement using sed
      local sed_cmd = string.format("sed -i '' 's/%s/%s/g' %s", 
        vim.fn.escape(search_term, '/'), 
        vim.fn.escape(replace_term, '/'), 
        table.concat(files, ' '))
      
      local result = vim.fn.system(sed_cmd)
      
      if vim.v.shell_error == 0 then
        print(string.format("Successfully replaced '%s' with '%s' in %d files", 
          search_term, replace_term, #files))
        -- Reload any open buffers that were modified
        vim.cmd('checktime')
      else
        print("Error during replacement: " .. result)
      end
    end)
  end
}

table.insert(config, telescope)

return config
