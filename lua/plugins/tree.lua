local tree_cb = require'nvim-tree.config'.nvim_tree_callback


vim.g.nvim_tree_bindings = {
      ["l"]              = tree_cb("edit"),
      ["h"]              = tree_cb("close_node"),

      ["<C-]>"]          = tree_cb("cd"),
      ["<C-[>"]          = tree_cb("dir_up"),
      ["I"]              = tree_cb("toggle_ignored"),
      ["H"]              = tree_cb("toggle_dotfiles"),

      ["<C-v>"]          = tree_cb("vsplit"),
      ["<C-h>"]          = tree_cb("split"),
      ["a"]              = tree_cb("create"),
      ["d"]              = tree_cb("remove"),
      ["r"]              = tree_cb("rename"),
      ["x"]              = tree_cb("cut"),
      ["c"]              = tree_cb("copy"),
      ["p"]              = tree_cb("paste"),
      ["y"]              = tree_cb("copy_name"),
}
