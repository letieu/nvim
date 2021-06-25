local m = require('util').map_key

m('n', '<Space>e', '<CMD>NvimTreeToggle<CR>')

m("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
m("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
m("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
m("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
