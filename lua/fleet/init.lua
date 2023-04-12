---@return "dark" | "light"
local gcurmod = function()
  if vim.g.background == "dark" or vim.g.background == "light" then
    return vim.g.background
  else
    return "dark"
  end
end

local M = {}
M.get_color = require("fleet.color").gcol
M.get_current_mode = gcurmod

M.__z = require("fleet.color").colors(gcurmod())
M.__g = require("fleet.groups").load(M.__z)

---Configure theme and install theme into instance
M.setup = function()
  print("setting up")
  vim.g.colors_name = "fleet"
  vim.cmd("hi clear")
  vim.cmd("syntax reset")
  ---@type table
  M.__g = require("fleet.groups").load(M.__z)

  for k, v in pairs(M.__g) do
    -- if string.find(k, "@") then
    --   print(k)
    --   P(v)
    -- end
    vim.api.nvim_set_hl(0, k, v)
  end

  -- vim.cmd("hi Normal guibg=" .. M.gcol("bg"))
end

function M.load_feline()
  local theme = {
    red = M.get_color("red"),
    green = M.get_color("green"),
    blue = M.get_color("blue"),
    gray = M.get_color("bg"),
    fg = M.get_color("linefg"),
    bg = M.get_color("linebg"),
    n = M.get_color("normal"),
    v = M.get_color("visual"),
    i = M.get_color("insert"),
    c = M.get_color("command"),
  }
  require("feline").use_theme(theme)
end

function M.lualine_theme()
  return {
    normal = {
      a = { bg = M.get_color("green"), fg = M.get_color("fg"), gui = "bold" },
      b = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
      c = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
      z = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
    },
    insert = {
      a = { bg = M.get_color("linebg"), fg = M.get_color("fg"), gui = "bold" },
      b = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
      c = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
    },
    visual = {
      a = { bg = M.get_color("linebg"), fg = M.get_color("fg"), gui = "bold" },
      b = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
      c = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
    },
    replace = {
      a = { bg = M.get_color("linebg"), fg = M.get_color("fg"), gui = "bold" },
      b = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
      c = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
    },
    command = {
      a = { bg = M.get_color("linebg"), fg = M.get_color("fg"), gui = "bold" },
      b = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
      c = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
    },
    inactive = {
      a = { bg = M.get_color("linebg"), fg = M.get_color("fg"), gui = "bold" },
      b = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
      c = { bg = M.get_color("linebg"), fg = M.get_color("fg") },
    },
  }
end

function M.load_lualine()
  require("lualine").setup({ options = { theme = M.lualine_theme() } })
end

function M.bufferline_highlights()
  local norm_bg = M.get_color("bg")
  local norm_fg = M.get_color("fg")
  local comment_fg = M.get_color("comments")
  local black = M.get_color("black")
  local visible = M.get_color("dark_gray")

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
