local status_ok, devicons = pcall(require, "nvim-web-devicons")

if not status_ok then
  return
end

devicons.set_icon {
  [".babelrc"] = {
    icon = "ﬥ",
    color = "#cbcb41",
    cterm_color = "185",
    name = "Babelrc",
  },
  [".bash_profile"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "BashProfile",
  },
  [".bashrc"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Bashrc",
  },
  [".DS_Store"] = {
    icon = "",
    color = "#41535b",
    cterm_color = "59",
    name = "DsStore",
  },
  [".gitattributes"] = {
    icon = "",
    color = "#41535b",
    cterm_color = "59",
    name = "GitAttributes",
  },
  [".gitconfig"] = {
    icon = "",
    color = "#41535b",
    cterm_color = "59",
    name = "GitConfig",
  },
  [".gitignore"] = {
    icon = "",
    color = "#41535b",
    cterm_color = "59",
    name = "GitIgnore",
  },
  [".gitlab-ci.yml"] = {
    icon = "",
    color = "#e24329",
    cterm_color = "166",
    name = "GitlabCI",
  },
  [".gitmodules"] = {
    icon = "",
    color = "#41535b",
    cterm_color = "59",
    name = "GitModules",
  },
  [".gvimrc"] = {
    icon = "",
    color = "#019833",
    cterm_color = "29",
    name = "Gvimrc",
  },
  [".npmignore"] = {
    icon = "",
    color = "#E8274B",
    cterm_color = "161",
    name = "NPMIgnore",
  },
  [".npmrc"] = {
    icon = "",
    color = "#E8274B",
    cterm_color = "161",
    name = "NPMrc",
  },
  [".settings.json"] = {
    icon = "",
    color = "#854CC7",
    cterm_color = "98",
    name = "SettingsJson",
  },
  [".vimrc"] = {
    icon = "",
    color = "#019833",
    cterm_color = "29",
    name = "Vimrc",
  },
  [".zprofile"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Zshprofile",
  },
  [".zshenv"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Zshenv",
  },
  [".zshrc"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Zshrc",
  },
  ["Brewfile"] = {
    icon = "",
    color = "#701516",
    cterm_color = "52",
    name = "Brewfile",
  },
  ["CMakeLists.txt"] = {
    icon = "",
    color = "#6d8086",
    cterm_color = "66",
    name = "CMakeLists",
  },
  ["COMMIT_EDITMSG"] = {
    icon = "",
    color = "#41535b",
    cterm_color = "59",
    name = "GitCommit",
  },
  ["COPYING"] = {
    icon = "",
    color = "#cbcb41",
    cterm_color = "185",
    name = "License",
  },

  ["Dockerfile"] = {
    icon = "",
    color = "#384d54",
    cterm_color = "59",
    name = "Dockerfile",
  },
  ["Gemfile$"] = {
    icon = "",
    color = "#701516",
    cterm_color = "52",
    name = "Gemfile",
  },
  ["LICENSE"] = {
    icon = "",
    color = "#d0bf41",
    cterm_color = "179",
    name = "License",
  },
  ["R"] = {
    icon = "ﳒ",
    color = "#358a5b",
    cterm_color = "65",
    name = "R",
  },
  ["Rmd"] = {
    icon = "",
    color = "#519aba",
    cterm_color = "67",
    name = "Rmd",
  },
  ["Vagrantfile$"] = {
    icon = "",
    color = "#1563FF",
    cterm_color = "27",
    name = "Vagrantfile",
  },
  ["_gvimrc"] = {
    icon = "",
    color = "#019833",
    cterm_color = "29",
    name = "Gvimrc",
  },
  ["_vimrc"] = {
    icon = "",
    color = "#019833",
    cterm_color = "29",
    name = "Vimrc",
  },
  ["ai"] = {
    icon = "",
    color = "#cbcb41",
    cterm_color = "185",
    name = "Ai",
  },
  ["awk"] = {
    icon = "",
    color = "#4d5a5e",
    cterm_color = "59",
    name = "Awk",
  },
  ["bash"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Bash",
  },
  ["bat"] = {
    icon = "",
    color = "#C1F12E",
    cterm_color = "154",
    name = "Bat",
  },
  ["bmp"] = {
    icon = "",
    color = "#a074c4",
    cterm_color = "140",
    name = "Bmp",
  },
  ["c"] = {
    icon = "",
    color = "#599eff",
    cterm_color = "75",
    name = "C",
  },
  ["c++"] = {
    icon = "",
    color = "#f34b7d",
    cterm_color = "204",
    name = "CPlusPlus",
  },
  ["cbl"] = {
    icon = "⚙",
    color = "#005ca5",
    cterm_color = "25",
    name = "Cobol",
  },
  ["cc"] = {
    icon = "",
    color = "#f34b7d",
    cterm_color = "204",
    name = "CPlusPlus",
  },
  ["cfg"] = {
    icon = "",
    color = "#ECECEC",
    cterm_color = "231",
    name = "Configuration",
  },
  ["clj"] = {
    icon = "",
    color = "#8dc149",
    cterm_color = "107",
    name = "Clojure",
  },

  ["cmake"] = {
    icon = "",
    color = "#6d8086",
    cterm_color = "66",
    name = "CMake",
  },
  ["cpp"] = {
    icon = "",
    color = "#519aba",
    cterm_color = "67",
    name = "Cpp",
  },

  ["cs"] = {
    icon = "",
    color = "#596706",
    cterm_color = "58",
    name = "Cs",
  },


  ["css"] = {
    icon = "",
    color = "#42a5f5",
    cterm_color = "39",
    name = "Css",
  },
  ["csv"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Csv",
  },


  ["db"] = {
    icon = "",
    color = "#dad8d8",
    cterm_color = "188",
    name = "Db",
  },
  ["desktop"] = {
    icon = "",
    color = "#563d7c",
    cterm_color = "60",
    name = "DesktopEntry",
  },
  ["diff"] = {
    icon = "",
    color = "#41535b",
    cterm_color = "59",
    name = "Diff",
  },
  ["doc"] = {
    icon = "",
    color = "#185abd",
    cterm_color = "25",
    name = "Doc",
  },
  ["dockerfile"] = {
    icon = "",
    color = "#384d54",
    cterm_color = "59",
    name = "Dockerfile",
  },

  ["dropbox"] = {
    icon = "",
    color = "#0061FE",
    cterm_color = "27",
    name = "Dropbox",
  },
  ["dump"] = {
    icon = "",
    color = "#dad8d8",
    cterm_color = "188",
    name = "Dump",
  },






  ["gemspec"] = {
    icon = "",
    color = "#701516",
    cterm_color = "52",
    name = "Gemspec",
  },
  ["gif"] = {
    icon = "",
    color = "#a074c4",
    cterm_color = "140",
    name = "Gif",
  },
  ["git"] = {
    icon = "",
    color = "#F14C28",
    cterm_color = "202",
    name = "GitLogo",
  },

  ["go"] = {
    icon = "",
    color = "#519aba",
    cterm_color = "67",
    name = "Go",
  },



  ["html"] = {
    icon = "",
    color = "#e44d26",
    cterm_color = "202",
    name = "Html",
  },

  ["ico"] = {
    icon = "",
    color = "#cbcb41",
    cterm_color = "185",
    name = "Ico",
  },
  ["import"] = {
    icon = "",
    color = "#ECECEC",
    cterm_color = "231",
    name = "ImportConfiguration",
  },
  ["ini"] = {
    icon = "",
    color = "#6d8086",
    cterm_color = "66",
    name = "Ini",
  },


  ["jpeg"] = {
    icon = "",
    color = "#a074c4",
    cterm_color = "140",
    name = "Jpeg",
  },
  ["jpg"] = {
    icon = "",
    color = "#a074c4",
    cterm_color = "140",
    name = "Jpg",
  },
  ["js"] = {
    icon = "",
    color = "#ffca28",
    cterm_color = "185",
    name = "Js",
  },
  ["json"] = {
    icon = "ﬥ",
    color = "#fbc02d",
    cterm_color = "185",
    name = "Json",
  },
  ["jsx"] = {
    icon = "ﰆ",
    color = "#00bcd4",
    cterm_color = "67",
    name = "Jsx",
  },

  ["license"] = {
    icon = "",
    color = "#cbcb41",
    cterm_color = "185",
    name = "License",
  },
  ["lua"] = {
    icon = "",
    color = "#42a5f5",
    cterm_color = "74",
    name = "Lua",
  },
  ["makefile"] = {
    icon = "",
    color = "#6d8086",
    cterm_color = "66",
    name = "Makefile",
  },
  ["markdown"] = {
    icon = "",
    color = "#42a5f5",
    cterm_color = "67",
    name = "Markdown",
  },

  ["md"] = {
    icon = "",
    color = "#42a5f5",
    cterm_color = "white",
    name = "Md",
  },
  ["mdx"] = {
    icon = "",
    color = "#ffca28",
    cterm_color = "67",
    name = "Mdx",
  },


  ["mjs"] = {
    icon = "",
    color = "#f1e05a",
    cterm_color = "221",
    name = "Mjs",
  },



  ["node_modules"] = {
    icon = "",
    color = "#E8274B",
    cterm_color = "161",
    name = "NodeModules",
  },

  ["otf"] = {
    icon = "",
    color = "#ECECEC",
    cterm_color = "231",
    name = "OpenTypeFont",
  },
  ['package.json'] = {
    icon = "",
    color = "#8bc34a",
    name = "PackageJson"
  },
  ['package-lock.json'] = {
    icon = "",
    color = "#8bc34a",
    name = "PackageLockJson"
  },

  ["pdf"] = {
    icon = "",
    color = "#f44336",
    cterm_color = "124",
    name = "Pdf",
  },



  ["png"] = {
    icon = "",
    color = "#a074c4",
    cterm_color = "140",
    name = "Png",
  },



  ["py"] = {
    icon = "",
    color = "#3c78aa",
    cterm_color = "61",
    name = "Py",
  },
  ["pyc"] = {
    icon = "",
    color = "#3c78aa",
    cterm_color = "67",
    name = "Pyc",
  },
  ["pyd"] = {
    icon = "",
    color = "#3c78aa",
    cterm_color = "67",
    name = "Pyd",
  },
  ["pyo"] = {
    icon = "",
    color = "#3c78aa",
    cterm_color = "67",
    name = "Pyo",
  },


  ["sass"] = {
    icon = "",
    color = "#f55385",
    cterm_color = "204",
    name = "Sass",
  },
  ["scala"] = {
    icon = "",
    color = "#cc3e44",
    cterm_color = "167",
    name = "Scala",
  },
  ["scss"] = {
    icon = "",
    color = "#f55385",
    cterm_color = "204",
    name = "Scss",
  },
  ["sh"] = {
    icon = "",
    color = "#ef5350",
    cterm_color = "59",
    name = "Sh",
  },


  ["sql"] = {
    icon = "",
    color = "#dad8d8",
    cterm_color = "188",
    name = "Sql",
  },
  ["sqlite"] = {
    icon = "",
    color = "#dad8d8",
    cterm_color = "188",
    name = "Sql",
  },
  ["sqlite3"] = {
    icon = "",
    color = "#dad8d8",
    cterm_color = "188",
    name = "Sql",
  },



  ["svg"] = {
    icon = "ﰟ",
    color = "#ffca28",
    cterm_color = "215",
    name = "Svg",
  },



  ["ts"] = {
    icon = "ﯤ",
    color = "#0288d1",
    cterm_color = "67",
    name = "Ts",
  },

  ["tsx"] = {
    icon = "ﰆ",
    color = "#0288d1",
    cterm_color = "67",
    name = "Tsx",
  },

  ["txt"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Txt",
  },

  ["vim"] = {
    icon = "",
    color = "#019833",
    cterm_color = "29",
    name = "Vim",
  },
  ["vue"] = {
    icon = "﵂",
    color = "#8dc149",
    cterm_color = "107",
    name = "Vue",
  },

  ["webp"] = {
    icon = "",
    color = "#a074c4",
    cterm_color = "140",
    name = "Webp",
  },


  ["xml"] = {
    icon = "謹",
    color = "#e37933",
    cterm_color = "173",
    name = "Xml",
  },

  ["yaml"] = {
    icon = "",
    color = "#6d8086",
    cterm_color = "66",
    name = "Yaml",
  },
  ["yml"] = {
    icon = "",
    color = "#6d8086",
    cterm_color = "66",
    name = "Yml",
  },

  ["zsh"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Zsh",
  },

}
