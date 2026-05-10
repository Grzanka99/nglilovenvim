return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  lazy = false,
  build = ":TSUpdate",

  opts = {
    install_dir = vim.fn.stdpath("data") .. "/site",
  },

  config = function(_, opts)
    require("nvim-treesitter").setup(opts)

    local language = vim.treesitter.language
    local start = vim.treesitter.start
    local disabled = {}

    vim.treesitter.start = function(bufnr, lang)
      bufnr = bufnr or 0
      if bufnr == 0 then
        bufnr = vim.api.nvim_get_current_buf()
      end

      if not vim.api.nvim_buf_is_valid(bufnr) then
        return
      end

      lang = lang or language.get_lang(vim.bo[bufnr].filetype)
      if not lang or disabled[lang] then
        return
      end

      if not language.add(lang) then
        disabled[lang] = true
        return
      end

      local ok = pcall(start, bufnr, lang)
      if not ok then
        disabled[lang] = true
        pcall(vim.treesitter.stop, bufnr)
      end
    end

    local group = vim.api.nvim_create_augroup("treesitter-start", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(args)
        vim.treesitter.start(args.buf)
      end,
    })
  end,
}
