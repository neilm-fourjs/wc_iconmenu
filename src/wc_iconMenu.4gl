
IMPORT os
IMPORT util

PUBLIC TYPE wc_iconMenu RECORD
	fileName STRING,
  js_str STRING,
  menuJS RECORD
		menu DYNAMIC ARRAY OF RECORD
			text STRING,
			image STRING,
			action STRING
		END RECORD
	END RECORD,
	fields DYNAMIC ARRAY OF RECORD
		name STRING,
		type STRING
	END RECORD
END RECORD

FUNCTION (this wc_iconMenu) init(l_fileName STRING)
-- Get file/path for the menu
	LET this.js_str = this.getJSfromFile(l_fileName)

	CALL util.JSON.parse(this.js_str, this.menuJS)

	LET this.fields[1].name = "formonly.l_iconmenu"
	LET this.fields[1].type = "STRING"
END FUNCTION
--------------------------------------------------------------------------------------------------------------
FUNCTION (this wc_iconMenu) ui() RETURNS STRING
	DEFINE d ui.Dialog
	DEFINE x SMALLINT
	DEFINE l_event STRING

	OPEN WINDOW iconMenu WITH FORM "wc_iconMenu"

	LET d = ui.Dialog.createInputByName(this.fields)
	CALL d.setFieldValue( this.fields[1].name, this.js_str)
	CALL d.addTrigger("ON ACTION close")
	FOR x = 1 TO this.menuJS.menu.getLength()
		CALL d.addTrigger("ON ACTION "||this.menuJS.menu[x].action)
	END FOR
	CALL d.addTrigger("ON ACTION exit")
  WHILE TRUE
		LET l_event =  d.nextEvent()
		IF l_event.subString(1,10) = "ON ACTION " THEN
			LET l_event = l_event.subString(11, l_event.getLength())
			EXIT WHILE
		END IF
    CASE l_event
			WHEN "BEFORE INPUT"
				DISPLAY "BI"
			WHEN "BEFORE FIELD l_iconmenu"
				DISPLAY "BF l_iconmenu"
			OTHERWISE
				CALL fgl_winMessage("Event", l_event,"information")
		END CASE
	END WHILE
	CALL d.close()
	CLOSE WINDOW iconMenu
	RETURN l_event

END FUNCTION
--------------------------------------------------------------------------------------------------------------
-- Get file/path for the menu
FUNCTION (this wc_iconMenu) getJSfromFile(l_fileName STRING) RETURNS STRING
	DEFINE l_menu TEXT
	DEFINE l_jsFile STRING
	LET l_jsFile = os.path.join( os.path.join("..","etc"),l_fileName)
	IF NOT os.Path.exists( l_jsFile ) THEN
		LET l_jsFile = l_fileName
	END IF
	IF NOT os.Path.exists( l_jsFile ) THEN
		CALL fgl_winMessage("Error",SFMT("JS iconMenu file '%1' not found!",l_fileName),"exclamation")
		EXIT PROGRAM
	END IF
	LET this.fileName = l_jsFile
	LOCATE l_menu IN FILE l_jsFile
	DISPLAY l_menu
	RETURN l_menu
END FUNCTION
--------------------------------------------------------------------------------------------------------------
