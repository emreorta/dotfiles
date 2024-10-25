local colorscheme = os.getenv("NVIM_COLORSCHEME") or "nightfox"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark"   -- or "light" for light mode
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
