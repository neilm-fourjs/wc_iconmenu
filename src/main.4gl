
IMPORT FGL wc_iconMenu
DEFINE myMenu wc_iconMenu.wc_iconMenu
MAIN
	DEFINE l_menuItem STRING = "."
	CALL myMenu.init("myMenu.js")
	WHILE l_menuItem != "exit" AND l_menuItem != "close"
		LET l_menuItem = myMenu.ui()
		CALL fgl_winMessage("Info",SFMT("Menu item = '%1'",l_menuItem), "information")
	END WHILE

END MAIN
