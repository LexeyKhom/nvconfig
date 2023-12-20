local M = {}
local fn = vim.fn

M.list_themes = function()
  local default_themes = vim.fn.readdir(vim.fn.stdpath "data" .. "/lazy/base46/lua/base46/themes")
  local custom_themes = vim.loop.fs_stat(fn.stdpath "config" .. "/lua/custom/themes")

  if custom_themes and custom_themes.type == "directory" then
    local themes_tb = fn.readdir(fn.stdpath "config" .. "/lua/custom/themes")
    for _, value in ipairs(themes_tb) do
      table.insert(default_themes, value)
    end
  end

  for index, theme in ipairs(default_themes) do
    default_themes[index] = theme:match "(.+)%..+"
  end

  return default_themes
end

M.replace_word = function(old, new)
  local path = require("nvconfig").path
  local configPath = vim.fn.stdpath "config" .. "/lua/" .. path
  local file = io.open(configPath, "r")
  local added_pattern = string.gsub(old, "-", "%%-") -- add % before - if exists
  local new_content = file:read("*all"):gsub(added_pattern, new)

  file = io.open(configPath, "w")
  file:write(new_content)
  file:close()
end

return M
