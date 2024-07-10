local M = {}

local function write_file(file_path, content)
	local file, err = io.open(file_path, "w")
	if not file then
		print("Erro ao abrir o arquivo " .. file_path .. ": " .. err)
		return
	end
	file:write(content)
	file:close()
end

local function create_files()
	local html_content = [[
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles.css">
  <script defer src="script.js"></script>
  <title>Document</title>
</head>
<body>
  
  
</body>
</html>
  ]]

	local css_content = [[
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
  ]]

	local js_content = [[
  "use strict";
  ]]

	write_file("index.html", html_content)
	write_file("styles.css", css_content)
	write_file("script.js", js_content)
end

function M.setup()
	vim.api.nvim_create_user_command("vanilla-template", create_files, {})
end

return M
