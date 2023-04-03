require("util")
local color = require("color")
local gcol = color.gcol

---@return "dark" | "light"
local gcurmod = function()
  if vim.g.background == "dark" or vim.g.background == "light" then
    return vim.g.background
  else
    return "dark"
  end
end

local M = {}
M.get_color = gcol
M.get_current_mode = gcurmod

M.__c = color.colors(gcurmod())

---Configure theme and install theme into instance
M.setup = function()
  vim.g.colors_name = "clrtheme"
  ---@type table
  local g = require("groups").load(M.__c)

  for k, v in pairs(g) do
    vim.api.nvim_set_hl(0, k, v)
  end

  -- vim.cmd("hi Normal guibg=" .. M.gcol("bg"))
end

function M.load_feline()
  local theme = {
    red = gcol("red"),
    green = gcol("green"),
    blue = gcol("blue"),
    gray = gcol("bg"),
    fg = gcol("linefg"),
    bg = gcol("linebg"),
    n = gcol("normal"),
    v = gcol("visual"),
    i = gcol("insert"),
    c = gcol("command"),
  }
  require("feline").use_theme(theme)
end

function M.lualine_theme()
  return {
    normal = {
      a = { bg = gcol("green"), fg = gcol("fg"), gui = "bold" },
      b = { bg = gcol("linebg"), fg = gcol("fg") },
      c = { bg = gcol("linebg"), fg = gcol("fg") },
      z = { bg = gcol("linebg"), fg = gcol("fg") },
    },
    insert = {
      a = { bg = gcol("linebg"), fg = gcol("fg"), gui = "bold" },
      b = { bg = gcol("linebg"), fg = gcol("fg") },
      c = { bg = gcol("linebg"), fg = gcol("fg") },
    },
    visual = {
      a = { bg = gcol("linebg"), fg = gcol("fg"), gui = "bold" },
      b = { bg = gcol("linebg"), fg = gcol("fg") },
      c = { bg = gcol("linebg"), fg = gcol("fg") },
    },
    replace = {
      a = { bg = gcol("linebg"), fg = gcol("fg"), gui = "bold" },
      b = { bg = gcol("linebg"), fg = gcol("fg") },
      c = { bg = gcol("linebg"), fg = gcol("fg") },
    },
    command = {
      a = { bg = gcol("linebg"), fg = gcol("fg"), gui = "bold" },
      b = { bg = gcol("linebg"), fg = gcol("fg") },
      c = { bg = gcol("linebg"), fg = gcol("fg") },
    },
    inactive = {
      a = { bg = gcol("linebg"), fg = gcol("fg"), gui = "bold" },
      b = { bg = gcol("linebg"), fg = gcol("fg") },
      c = { bg = gcol("linebg"), fg = gcol("fg") },
    },
  }
end

function M.load_lualine()
  require("lualine").setup({ options = { theme = M.lualine_theme() } })
end

function M.bufferline_highlights()
  local norm_bg = gcol("bg")
  local norm_fg = gcol("fg")
  local comment_fg = gcol("comments")
  local black = gcol("black")
  local visible = gcol("dark_gray")

  -- The backdrop color
  local backdrop = black

  return {
    fill = {
      fg = norm_bg,
      bg = backdrop,
    },
    background = {
      fg = comment_fg,
      bg = visible,
    },
    tab = {
      fg = comment_fg,
      bg = visible,
    },
    tab_selected = {
      fg = norm_fg,
      bg = norm_bg,
    },
    tab_close = {
      fg = comment_fg,
      bg = norm_bg,
    },
    close_button = {
      fg = norm_fg,
      bg = visible,
    },
    close_button_selected = {
      fg = norm_fg,
      bg = norm_bg,
    },
    numbers = {
      fg = comment_fg,
      bg = visible,
    },
    numbers_selected = {
      fg = norm_fg,
      bg = norm_bg,
      bold = true,
      italic = true,
    },
    separator_selected = {
      fg = backdrop,
      bg = norm_bg,
    },
    separator = {
      fg = backdrop,
      bg = visible,
    },
    pick = {
      bg = norm_bg,
      bold = true,
      italic = true,
    },
    offset_separator = {
      bg = norm_bg,
    },
  }
end

return M
