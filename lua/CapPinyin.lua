-- [[
-- to do:
-- 1. add more keys
-- 2. make command mode work (subsitute especially)
-- 3. 分词 结巴分词 + treesitter
-- ]]
local M = {}

local map = vim.keymap
local stackmap = require("stackmap")
local active = false

M.toggle = function()
  if active then
    M.clear()
  else
    M.start()
  end
end

M.start = function()
  stackmap.push("Pinyin", "n", {
  ["H"] = "h",
  ["J"] = "j",
  ["K"] = "k",
  ["L"] = "l",
  ["D"] = "d",
  ["V"] = "v",
  ["C"] = "c",
  ["W"] = "w",
  ["E"] = "e",
  ["B"] = "b",
  ["U"] = "u",
  ["DD"] = "dd",
  ["YY"] = "yy",
  })
  stackmap.push("PinyinI", "i", {
    ["<Cap>"] = "<Esc>"
  })
  print("Pinyin mode started")
  active = true
end

M.clear = function()
  stackmap.pop("Pinyin", "n")
  stackmap.pop("PinyinI", "i")
  print("Pinyin mode cleared")
  active = false
end

return M
