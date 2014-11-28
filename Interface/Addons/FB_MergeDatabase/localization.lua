-- default to American English

FB_MDTranslations = {};
FB_MDTranslations["enUS"] = {
   NAME = "Fishing Buddy - Merge Database",
   DESCRIPTION = "Handle cross-machine fishing information.",

   MERGE = "merge",
   FORCE = FBConstants.FORCE,

   -- messages
   FORCEMERGE = "Copied all fishing information to merge database.",
   IMPORTEDDATA = "Imported fishing data.",
};

FB_MDTranslations["enUS"].MERGE_HELP = {
      "|c#GREEN#/fb #MERGE#|r |c#GREEN##FORCE#|r",
      "    force the merge data to be a copy of the main fishing buddy data",
};
