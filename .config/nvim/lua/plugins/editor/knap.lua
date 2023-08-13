return {
	"frabjous/knap",
	config = function()
		local knap = require("knap")

		local gknapsettings = {
			-- texoutputext = "pdf",
			-- textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
			-- textopdfviewerlaunch = "evince %outputfile%",
			-- textopdfviewerrefresh = "kill -HUP %pid%",
			-- textopdfviewerlaunch = "evince %outputfile%",
			-- textopdfviewerrefresh = "none",
			-- textopdfforwardjump = "synctex view -i %line%:%column%:%srcfile% -o %outputfile% -x 'evince -i %{page+1} %outputfile%'",

			textopdfviewerlaunch = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,0)\"' --new-window %outputfile%",
			textopdfviewerrefresh = "none",
			textopdfforwardjump = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,0)\"' --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",
			delay = 100,
		}
		vim.g.knap_settings = gknapsettings
	end,
}
