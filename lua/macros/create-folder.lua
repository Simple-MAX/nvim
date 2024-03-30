vim.keymap.set("n", "<leader>mk", function()
    local buffer = vim.api.nvim_buf_get_name(0) -- Get the current buffer's full path
    local path = vim.fn.fnamemodify(buffer, ":p:h") -- Get the directory of the current buffer
    local input = vim.fn.input("Enter the name of the new folder: ") -- Prompt the user to enter a folder name

    if input == "" then
        print("No folder name entered")
        return
    end

    local newfolder = path .. "/" .. input -- Create a new folder in the current buffer's directory

    -- Check if the directory already exists
    if vim.fn.isdirectory(newfolder) == 0 then
        -- If it doesn't exist, create it
        vim.fn.mkdir(newfolder, "p") -- The "p" flag creates parent directories if they don't exist
        print("Created new folder: " .. newfolder)
    else
        print("Folder already exists: " .. newfolder)
    end

end, { buffer = true })