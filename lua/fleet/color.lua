---@type table
local C = {}

---@param color string #Color descriptor
---@param mode? "dark"|"light"|"shared" #Color mode ("dark" | "light" | "shared")
local gcol = function(color, mode)
  local pallete = C.colors(mode and mode or "dark")
  if pallete[color] then
    return pallete[color]
  else
    return nil
  end
end
C.gcol = gcol

local COLORS = {
      ["dark"] = {
    -- bg = '#001b24',
    -- bg = '#00253d',
    -- bg = '#09151b',
    bg = "#181818",
    bg1 = "#181818",
    fg = "#DBDBDB",
    fg1 = "#DBDBDB",
    linefg = "#DBDBDB",
    linebg = "#292929",
    red = "#ff5c57",
    green = "#90CEBB",
    blue2 = "#004e75",
    purple = "#A398DE",
    brown = "#b2643c",
    blue = "#87C3FF",
    blue_light = "#ADD1DE",
    coral = "#CC7C8A",
    cyan = "#82D2CE",
    cyan_dark = "#779E9E",
    lime = "#A8CC7C",
    orange = "#E09B70",
    pink = "#E394DC",
    violet = "#AF9CFF",
    yellow = "#EBC88D",
    invisibles = "#65737E",
    caret = "#54555e",
    guides = "#424242",
    lsp_background = "#54555e",
    line_highlight = "#171717",
    selection = "#244072",
    normal = "#57c7ff",
    visual = "#68A247",
    insert = "#ff5c57",
    command = "#f5e000",
  },
      ["shared"] = {
    white = "#ffffff",
    gray_130 = "#EFEFEF",
    gray_120 = "#d1d1d1",
    gray_110 = "#c2c2c2",
    gray_100 = "#a0a0a0",
    gray_90 = "#898989",
    gray_80 = "#767676",
    gray_70 = "#5d5d5d",
    gray_60 = "#484848",
    gray_50 = "#383838",
    gray_40 = "#333333",
    gray_30 = "#2d2d2d",
    gray_20 = "#292929",
    gray_10 = "#181818",
    black = "#000000",
    blue_110 = "#6daaf7",
    blue_100 = "#4d9bf8",
    blue_90 = "#3691f9",
    blue_80 = "#1a85f6",
    blue_70 = "#0273eb",
    blue_60 = "#0c6ddd",
    blue_50 = "#195eb5",
    blue_40 = "#194176",
    blue_30 = "#163764",
    blue_20 = "#132c4f",
    blue_10 = "#0b1b32",
    red_80 = "#ec7388",
    red_70 = "#ea4b67",
    red_60 = "#d93953",
    red_50 = "#ce364d",
    red_40 = "#c03248",
    red_30 = "#a72a3f",
    red_20 = "#761b2d",
    red_10 = "#390813",
    green_50 = "#4ca988",
    green_40 = "#3ea17f",
    green_30 = "#028764",
    green_20 = "#134939",
    green_10 = "#081f19",
    yellow_60 = "#f8ab17",
    yellow_50 = "#e1971b",
    yellow_40 = "#b5791f",
    yellow_30 = "#7c511a",
    yellow_20 = "#5a3a14",
    yellow_10 = "#281806",
    purple_20 = "#c07bf3",
    purple_10 = "#b35def",
  },
}

---@param m "dark"|"light"|"shared" #Color mode ("dark" | "light" | "shared")
---@return table
C.colors = function(m)
  ---@type {[string]: string}
  local c = {
        ["none"] = "",
        ["fg1"] = COLORS[m]["fg1"],
        ["fg2"] = COLORS[m]["fg"],
        ["fg3"] = COLORS["shared"]["gray_120"],
        ["disabled"] = COLORS["shared"]["gray_50"],
        ["line_numbers"] = COLORS["shared"]["gray_70"],
        ["selection"] = COLORS[m]["selection"],
        ["white"] = COLORS["shared"]["white"],
        ["gray"] = COLORS["shared"]["gray_100"],
        ["gray1"] = COLORS["shared"]["gray_120"],
        ["black"] = COLORS["shared"]["black"],
        ["red"] = COLORS[m]["red"],
        ["green"] = COLORS[m]["green"],
        ["yellow"] = COLORS[m]["yellow"],
        ["yellowfaded"] = COLORS[m]["yellowfaded"],
        ["blue"] = COLORS[m]["blue"],
        ["cyan"] = COLORS[m]["cyan"],
        ["purple"] = COLORS[m]["purple"],
        ["orange"] = COLORS[m]["orange"],
        ["brown"] = COLORS[m]["brown"],
        ["comments"] = COLORS["shared"]["gray_90"],
        ["error"] = COLORS[m]["red"],
        ["pink"] = COLORS[m]["pink"],
        ["incsearch"] = COLORS[m]["yellow"],
        ["search"] = COLORS[m]["yellow"],
        ["linebg"] = COLORS[m]["linebg"],
        ["linefg"] = COLORS[m]["linefg"],
        ["Constant"] = COLORS[m]["fg"],
        ["String"] = COLORS[m]["pink"],
        ["Character"] = COLORS[m]["yellow"],
        ["Boolean"] = COLORS[m]["fg"],
        ["Float"] = COLORS[m]["fg"],
        ["Identifier"] = COLORS[m]["fg"],
        ["Function"] = COLORS[m]["yellow"],
        ["Statement"] = COLORS[m]["green"],
        ["Conditional"] = COLORS[m]["green"],
        ["Repeat"] = COLORS[m]["yellow"],
        ["Label"] = COLORS[m]["yellow"],
        ["Operator"] = COLORS[m]["fg"],
        ["Number"] = COLORS[m]["yellow"],
        ["Keyword"] = COLORS[m]["green"],
        ["Exception"] = COLORS[m]["red"],
        ["PreProc"] = COLORS[m]["white"],
        ["cursorline"] = COLORS[m]["cursorline"],
        ["Include"] = COLORS[m]["blue"],
        ["Define"] = COLORS[m]["purple"],
        ["Macro"] = COLORS[m]["green"],
        ["PreCondit"] = COLORS[m]["purple"],
        ["Type"] = COLORS[m]["blue"],
        ["StorageClass"] = COLORS[m]["yellow"],
        ["Structure"] = COLORS[m]["purple"],
        ["Typedef"] = COLORS[m]["yellow"],
        ["Special"] = COLORS[m]["blue"],
        ["SpecialChar"] = COLORS[m]["yellow"],
        ["Tag"] = COLORS[m]["orange"],
        ["Delimiter"] = COLORS[m]["fg"],
        ["SpecialComment"] = COLORS[m]["yellow"],
        ["Debug"] = COLORS[m]["red"],
        ["Todo"] = COLORS[m]["orange"],
        ["Underlined"] = COLORS[m]["blue"],
        ["bg"] = COLORS[m]["bg"],
        ["bg1"] = COLORS[m]["bg1"],
        ["fg"] = COLORS[m]["fg"],
        ["invisibles"] = COLORS[m]["invisibles"],
        ["caret"] = COLORS[m]["caret"],
        ["guides"] = COLORS[m]["guides"],
        ["lsp_background"] = COLORS[m]["lsp_background"],
        ["line_highlight"] = COLORS[m]["line_highlight"],
        ["accent"] = COLORS[m]["blue"],
        ["htmlBold"] = COLORS[m]["yellow"],
        ["url"] = COLORS[m]["red"],
        ["link"] = COLORS[m]["green"],
        ["heading"] = COLORS[m]["blue"],
        ["codeDelimiter"] = COLORS[m]["purple"],
        ["TSVariable"] = COLORS[m]["fg"],
        ["TSField"] = COLORS[m]["blue"],
        ["TSProperty"] = COLORS[m]["purple"],
        ["TSParameter"] = COLORS[m]["fg"],
        ["TSKeywordOperator"] = COLORS[m]["yellow"],
    --colors
        ["blue2"] = COLORS[m]["blue2"],
        ["blue_light"] = COLORS[m]["blue_light"],
        ["coral"] = COLORS[m]["coral"],
        ["cyan_dark"] = COLORS[m]["cyan_dark"],
        ["lime"] = COLORS[m]["lime"],
        ["violet"] = COLORS[m]["violet"],
        ["normal"] = COLORS[m]["normal"],
        ["visual"] = COLORS[m]["visual"],
        ["insert"] = COLORS[m]["insert"],
        ["command"] = COLORS[m]["command"],
        ["gray_120"] = COLORS["shared"]["gray_120"],
        ["gray_110"] = COLORS["shared"]["gray_110"],
        ["gray_100"] = COLORS["shared"]["gray_100"],
        ["gray_90"] = COLORS["shared"]["gray_90"],
        ["gray_80"] = COLORS["shared"]["gray_80"],
        ["gray_70"] = COLORS["shared"]["gray_70"],
        ["gray_60"] = COLORS["shared"]["gray_60"],
        ["gray_50"] = COLORS["shared"]["gray_50"],
        ["gray_40"] = COLORS["shared"]["gray_40"],
        ["gray_30"] = COLORS["shared"]["gray_30"],
        ["gray_20"] = COLORS["shared"]["gray_20"],
        ["gray_10"] = COLORS["shared"]["gray_10"],
        ["blue_110"] = COLORS["shared"]["blue_110"],
        ["blue_100"] = COLORS["shared"]["blue_100"],
        ["blue_90"] = COLORS["shared"]["blue_90"],
        ["blue_80"] = COLORS["shared"]["blue_80"],
        ["blue_70"] = COLORS["shared"]["blue_70"],
        ["blue_60"] = COLORS["shared"]["blue_60"],
        ["blue_50"] = COLORS["shared"]["blue_50"],
        ["blue_40"] = COLORS["shared"]["blue_40"],
        ["blue_30"] = COLORS["shared"]["blue_30"],
        ["blue_20"] = COLORS["shared"]["blue_20"],
        ["blue_10"] = COLORS["shared"]["blue_10"],
        ["red_80"] = COLORS["shared"]["red_80"],
        ["red_70"] = COLORS["shared"]["red_70"],
        ["red_60"] = COLORS["shared"]["red_60"],
        ["red_50"] = COLORS["shared"]["red_50"],
        ["red_40"] = COLORS["shared"]["red_40"],
        ["red_30"] = COLORS["shared"]["red_30"],
        ["red_20"] = COLORS["shared"]["red_20"],
        ["red_10"] = COLORS["shared"]["red_10"],
        ["green_50"] = COLORS["shared"]["green_50"],
        ["green_40"] = COLORS["shared"]["green_40"],
        ["green_30"] = COLORS["shared"]["green_30"],
        ["green_20"] = COLORS["shared"]["green_20"],
        ["green_10"] = COLORS["shared"]["green_10"],
        ["yellow_60"] = COLORS["shared"]["yellow_60"],
        ["yellow_50"] = COLORS["shared"]["yellow_50"],
        ["yellow_40"] = COLORS["shared"]["yellow_40"],
        ["yellow_30"] = COLORS["shared"]["yellow_30"],
        ["yellow_20"] = COLORS["shared"]["yellow_20"],
        ["yellow_10"] = COLORS["shared"]["yellow_10"],
        ["purple_20"] = COLORS["shared"]["purple_20"],
        ["purple_10"] = COLORS["shared"]["purple_10"],
  }
  return c
end

return C
