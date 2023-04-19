local constants = require("constants")
---@class HighlightGroup
---@field fg string
---@field bg string
---@field sp string?
---@field underline boolean?

---@type table
U = {}

--- Update highlight group for the highlight_tag with prefix added and return the group name
---@param highlight_tag string #Highlight group name without prefix
---@return string #Complete highlight group name
U.hi = function(color, highlight_tag)
  if color.bg ~= nil and color.fg ~= nil then
    local highlight_group_name = table.concat({ constants.PREFIX, highlight_tag }, "_")
    pcall(function()
      vim.api.nvim_set_hl(0, highlight_group_name, {
        fg = color.fg,
        bg = color.bg,
        sp = (color.sp and color.sp or color.fg),
        underline = color.underline or false,
      })
    end)
    return highlight_group_name
  else
    print("need to specify a background and foreground color")
    P(color)
  end
  return ""
end

return U
