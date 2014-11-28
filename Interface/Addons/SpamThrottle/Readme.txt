SpamThrottle (Eliminates duplicated messages in chat channels)

	Version:	2.7
	Date:		12 Nov 2013
	Author:		Orukxu

On many servers the Trade channel is the main LFG channel in use today.  On some full servers, many people spam the channel to increase the visibility of their messages (or just be a general nuisance) by making macros and repeating the message once every few minutes.  This means you spend more time reading crap and less time interacting with normal people.

This addon filters the trade channel (and all other numbered channels, i.e. /1 through /99), and also /y so that any individual message is only displayed ONCE.  Repeats are filtered out, as long as the text is identical or very close.  A message is determined to be 'close' based on some advanced heuristics.  It means you will only see unique LFG messages once.  On Blackrock for example this may reduce the chat messages by 70% to 80%, and makes the channels readable again.

Any message which is identified to be a duplicate of one sent earlier is "gapped", which means that it is only allowed to be shown once every X seconds - where X is settable by the user.  The default is 600 seconds (10 minutes).

The default is to hide the message entirely so that you never see the repeat.  If you want to see what you are missing, then you can set "color" mode, for which the repeats will be colored dark gray - easy to ignore, and gives you a sense of how bad the spamming problem is on your server.  The author recommends using the hide mode under normal circumstances.


Behavior:
	* Spam is filtered from the numbered channels, i.e. /1 to /99 (which includes the trade channel, the worst offender).
	* Spam on /y (yell) is treated the same as a numbered channel, and is filtered similarly.
	* The filter will not affect /s, whispers, raid/bg, guild chat and so on.
	* It won't filter your OWN messages AT ALL; they will show up as normal, even if you're performing the spam yourself.
	* It does not filter by keyword; but by the content of the message itself.
	* The first time a unique message arrives, it is always shown.
	* It is free-standing and compatible with other spam filters.
	* Repeated messages are allowed every X seconds, where X defaults to 600.  This is user settable.


Usage:
	/spamthrottle, or /st
	Shows whether it is enabled, the current mode and prints a list of valid commands.

	/st off
	Disables the spam filtering, making all spam messages show up as normal.

	/st on
	Enables the spam filter using the last known settings

	/st color
	Colors the spam dark gray to make it easy for the eyes to skip it.

	/st hide
	Completely hides all spam from ever being shown on the screen.

	/st fuzzy
	Enables the fuzzy text matching filter (default).  Filters messages that are very likely repeats, with slight changes only.

	/st nofuzzy
	Disables the fuzzy text matching filter. Only strict text matches of previous messages will be flagged as repeated spam messages.

	/st reset
	Resets the memory to start from scratch - effectively making the program forget all previous messages.

	/st X  (where X is a value between 0 and 10000)
	Sets the gap value for showing repeated messages to X.  Default is 600.
	Larger means less frequent repeats, smaller is useful if you do actually want to see messages again after a short
	interval of not allowing repeats.  Reasonable values are 30 seconds, 60 seconds, up to about 600 seconds.

	The filter defaults to 'hide' mode the first time you run it.
	You are then free to set the filter up to show the spam in dark gray (color mode) if you want to.

	The settings are remembered account-wide (affects all characters).

Changes:
	1.0 (12/04/2009): Initial release
	1.0 (12/07/2009): Quick fix to change sense of one comparison, to ensure that comparison against uninitialized table entries would work properly
	1.1 (12/08/2009): Update to WoW Release 3.3.0
	1.2 (01/03/2010): Patch to handle multiple windows and certain addon conflicts.
	1.3 (01/07/2010): Updated to add settable gap value, and changed event handling to work more elegantly.  Also added variable migration for previous versions.
	1.4 (03/02/2010): Added /y channel filtering. Also implemented a fuzzy heuristic filter to match repeats, so it now filters out spam from drunk chars, and most attempts to defeat spamthrottle.
	2.0 (16/10/2010): Updated to work with 4.0.1.  Some event handler argument changes were put in place by Blizzard.
	2.1 (26/04/2011): Updated to patch 4.1.  No changes needed, just version change.
	2.2 (30/11/2011): Updated to patch 4.3.  No changes needed, just version change.

	2.3 (29/08/2012): Updated to patch 5.0.1.  No changes needed, just version change.
	2.4 (06/02/2013): Updated to patch 5.1.  No changes needed, just version change.
	2.5 (03/04/2013): Updated to patch 5.2.  No changes needed, just version change.
	2.6 (27/05/2013): Updated to patch 5.3.  No changes needed, just version change.
	2.7 (12/11/2013): Updated to patch 5.4.  No changes needed, just version change.	
Acknowledgements:
	This addon was inspired by ASSFilter, created by Yewbacca.
	Thanks to Tori of Blackrock for helping with some of the event handler code.  Much appreciated!
