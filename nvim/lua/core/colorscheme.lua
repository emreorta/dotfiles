local colorscheme = os.getenv("NVIM_COLORSCHEME") or "no-clown-fiesta-dark"

local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
vim.o.background = "dark"
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
