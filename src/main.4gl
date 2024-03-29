IMPORT FGL wc_iconMenu
DEFINE myMenu wc_iconMenu.wc_iconMenu
MAIN
	DEFINE l_menuItem STRING = "."

-- Use a JSON file for the menu data
	LET myMenu.fileName = "myMenu.js"
-- or
-- set the 4gl array for the menu data.
--	CALL myMenu.addMenuItem( "Test1", "test.png", "test1")
--	CALL myMenu.addMenuItem( "Close", "poweroff.png", "close")

	IF NOT myMenu.init(myMenu.fileName) THEN -- something wrong?
		EXIT PROGRAM
	END IF

	WHILE l_menuItem != "exit" AND l_menuItem != "close"
		LET l_menuItem = myMenu.ui() -- show icon menu and wait for selection.
		IF l_menuItem != "close" THEN
			CALL fgl_winMessage("Info",SFMT("Menu item = '%1'",l_menuItem), "information")
		END IF
	END WHILE
END MAIN