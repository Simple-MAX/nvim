vim.keymap.set("n", "<leader>go", function()
    -- Check if the current buffer's filetype is 'go'
    if vim.bo.filetype == 'go' then
        -- Split the Go error handling snippet into lines
        local snippetLines = {"if err != nil {", "\t", "}"}
        
        -- Get the current cursor position
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        
        -- Insert the snippet lines at the current cursor position
        -- Adjusting 'row - 1' since buffer indexes are 0-based but cursor positions are 1-based
        vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, snippetLines)
        
        -- Optionally, move the cursor to a specific position inside the snippet
        -- For example, inside the curly braces. Adjust as needed.
        vim.api.nvim_win_set_cursor(0, {row + 1, col + 1})  -- This places the cursor at the start of the new line within the braces
        
        print("Inserted Go error handling snippet")
    else
        print("Not a Go file")
    end
end, {silent = true, buffer = true})