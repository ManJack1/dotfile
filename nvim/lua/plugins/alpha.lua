return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    require("alpha.term")
    dashboard.section.terminal.command = vim.fn.stdpath("config") .. "/nvim-logo -t"
    --
    -- dashboard.section.header.val = {
    --   " █████  ███████ ████████ ██████   ██████",
    --   "██   ██ ██         ██    ██   ██ ██    ██",
    --   "███████ ███████    ██    ██████  ██    ██",
    --   "██   ██      ██    ██    ██   ██ ██    ██",
    --   "██   ██ ███████    ██    ██   ██  ██████",
    --   " ",
    --   "    ███    ██ ██    ██ ██ ███    ███",
    --   "    ████   ██ ██    ██ ██ ████  ████",
    --   "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    --   "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    --   "    ██   ████   ████   ██ ██      ██",
    -- }


    local logo = [[
 ⠀  ⠀    (\__/)
         (•ㅅ•)      ᴅᴏɴ’ᴛ ᴄʀʏ!
      ＿ノヽ ノ＼＿  ᴊᴜsᴛ sᴀʏ “ғᴜᴄᴋʏᴏᴜ” ᴀɴᴅ sᴍɪʟᴇ.
  `/　`/ ⌒Ｙ⌒ Ｙ  ヽ
  ( 　(三ヽ人　 /　 |
  |　ﾉ⌒＼ ￣￣ヽ   ノ
  ヽ＿＿＿＞､＿_／                      **    /\  ** *       ___I_
        ｜( 王 ﾉ〈  (\__/)               **  (` -7 **       /\-_--\
        /ﾐ`ー―彡\   (•ㅅ•)              **   |、⁻〵 **     /  \_-__\
       / ╰    ╯ \   /    \>              **  じしˍ,)ノ **  |[]| [] |


                                                 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                     ███╗   ██╗██╗   ██╗██╗███╗   ███╗
                     ████╗  ██║██║   ██║██║████╗ ████║
                     ██╔██╗ ██║██║   ██║██║██╔████╔██║
                     ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
                     ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
                     ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
⠀⠀⠀⠀]]
    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.header.opts.hl = "DashboardHeader"

    local button = require("astronvim.utils").alpha_button
    local get_icon = require("astronvim.utils").get_icon
    dashboard.section.buttons.val = {
      button("LDR n  ", get_icon("FileNew", 2, true) .. "New File  "),
      button("LDR f f", get_icon("Search", 2, true) .. "Find File  "),
      button("LDR f o", get_icon("DefaultFile", 2, true) .. "Recents  "),
      button("LDR f w", get_icon("WordFile", 2, true) .. "Find Word  "),
      button("LDR f '", get_icon("Bookmarks", 2, true) .. "Bookmarks  "),
      button("LDR S l", get_icon("Refresh", 2, true) .. "Last Session  "),
    }

    dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.05) }
    dashboard.config.layout[3].val = 1
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
  config = require "plugins.configs.alpha",
}
