
Namespace std.requesters

#If __DESKTOP_TARGET__

#Import "native/requesters.h"

#If __TARGET__="macos"

	#Import "native/requesters.mm"

#Else

	#Import "native/requesters.cpp"
	
	#if __TARGET__="windows"

		#Import "<libole32.a>"
		#Import "<libComdlg32.a>"

	#endif
	
#endif

Extern

#rem monkeydoc Activates a modal notification dialog.

Notify activates a simple modal dialog informing the user of an event. The optional `serious` flag can be used to indicate a 'critical' event.

#end
Function Notify:Void( title:String,text:String,serious:Bool=False )="bbRequesters::Notify"

#rem monkeydoc Activates a simple modal Yes/No dialog.

Confirm activates a simple modal dialog requesting the user to select between Yes and No options. If the user selects Yes, then Confirm returns true. Otherwise, false is returned.

#end
Function Confirm:Bool( title:String,text:String,serious:Bool=False )="bbRequesters::Confirm"

#rem monkeydoc Activates a modal Yes/No/Cancel dialog.

Proceed activates a simple modal dialog requesting the user to select between Yes, No and Cancel options. If the user selects Yes, then Proceed return 1. If the user selects No, then Proceed returns 0. Otherwise, Proceed returns -1.

#end
Function Proceed:Int( title:String,text:String,serious:Bool=False )="bbRequesters::Proceed"

#rem monkeydoc Activate a modal file requester dialog.

RequestFile activates a modal file requester dialog.

The optional filters string can either be a comma separated list of file extensions or, as in the following example, groups of extensions that begin with a "group:" label and are separated by a semicolon. For example:

"Image files:png,jpg;Audio files:was,ogg;All files:*"

The save parameter should be true to create a save-style requester, false to create a load-style requester.

The `path` parameter can be used to specify an initial file path.

Returns selected file path, or an empty string if dialog was cancelled.

#end
Function RequestFile:String( title:String,filter:String="",save:Bool=False,file:String="" )="bbRequesters::RequestFile"

#rem monkeydoc Activates a modal directory path dialog.

RequestDir activates a modal directory path dialog.

The `dir` parameter can be used to specify an initial directory path.

Returns selected directory path, or an empty string if dialog was cancelled.

#end
Function RequestDir:String( title:String,dir:String="" )="bbRequesters::RequestDir"

#rem monkeydoc Opens a URL using the desktop manager.

Opens a URL using the desktop manager.

The behavior of OpenURL is highly target dependent, but in general it should at least be able to open web pages for you!

#end
Function OpenUrl( url:String )="bbRequesters::OpenUrl"

#else

#rem

#rem monkeydoc @hidden
#end
Function Notify:Void( title:String,text:String,serious:Bool=False )
End

#rem monkeydoc @hidden
#end
Function Confirm:Bool( title:String,text:String,serious:Bool=False )
	Return False
End

#rem monkeydoc @hidden
#end
Function RequestFile:String( title:String,filter:String="",save:Bool=False,file:String="" )
	Return ""
End

#rem monkeydoc @hidden
#end
Function RequestDir:String( title:String,dir:String="" )
	Return ""
End

#rem monkeydoc @hidden
#end
Function OpenUrl( url:String )
End

#end

#Endif
