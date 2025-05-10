-- Editor plugins index file
-- This file imports all plugin configurations in the editor directory

return {
  require("plugins.editor.telescope"),
  require("plugins.editor.treesitter"),
  require("plugins.editor.gitsigns"),
  require("plugins.editor.mini"),
  require("plugins.editor.numbertoggle"),
  require("plugins.editor.diffview"),
  require("plugins.editor.fugitive"),
  require("plugins.editor.debug"),
}
