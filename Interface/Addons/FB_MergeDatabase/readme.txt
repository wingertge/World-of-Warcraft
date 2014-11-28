This mod saves a copy of your fishing data (or the delta of your fishing data as you fish) in such a way that you can merge it with another copy.

1. Log out of WoW
2. Squirrel away the 'target' copy of FB_MergeDatabase.lua
3. Copy FB_MergeDatabase.lua to the 'target' machine
4. Put the 'source' FB_MergeDatabase.lua in the 'target' SavedVariables folder
5. Log into WoW

All of the 'source' fish are now merged with the 'target' database. Do the reverse with the 'target' FB_MergeDatabase and both machines are now 'in sync.'

Here's how to merge two FishingBuddy.lua files.

1. Log into Wow, run '/fb merge force'
2. Copy the other FishingBuddy.lua file into SavedVariables (overwrites the original -- back it up first)
3. Log into Wow

You should get a not-very-useful-yet message in the Chat window that your fish have been merged.

Going between machines, the FB_MergeDatabase.lua file from the 'other' machine(s) goes into SavedVariables and then you log into WoW and the fish will be merged -- the FB_MergeDatabase structures are emptied out, ready to start capturing new fishing.
