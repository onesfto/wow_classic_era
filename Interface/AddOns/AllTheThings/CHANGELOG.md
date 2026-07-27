# AllTheThings

## [5.2.12](https://github.com/ATTWoWAddon/AllTheThings/tree/5.2.12) (2026-07-26)
[Full Changelog](https://github.com/ATTWoWAddon/AllTheThings/compare/5.2.11...5.2.12) [Previous Releases](https://github.com/ATTWoWAddon/AllTheThings/releases)

- parse  
- Added quest item.  
- [DB] Added a few AW Quests  
- [DB} Cleaned up a lot of Showdown content based on further experience of drops and content design  
- [Parser] Change OpenItems background to black for my poor eyes  
- [DB] Various errors and data fixes  
- [DB] Ignored some Decor Specialist Vignettes  
    [Contrib] Sorted & added ignored NPC  
- [DB] Revised Nullaeus questIDs  
- [DB] Update vendor items on Maren Silverwing  
- [DB] Move some Val achievements to the proper WQ scope  
- Fix some reported quest and object errors  
- [DB] Quel'Thalas Equipment Chest won't be usable after S1  
- [DB] Various fixes noticed today  
- [Locale] Decor Duel header in all languages  
- [Parser] Fixed an issue where NPCs with Quest would turn providers into quest givers  
- [DB] More data links and coords for Timeless Isle  
- [MOP] Correct preprocesor to A Timeless Discovery and alt quests to Preparing to Strike and Meet Me Back at the Inn  
- Fix a few reported errors  
- [MOP] Meet Me Back at the Inn (33087) was removed to classic flavors  
- [DB] Added coords for Spirit of Jadefire  
    [Contrib] Cavern of Lost Spirits is a small map  
- Removed accidentally kept old holiday Wago files  
- Bumped Wago files to 12.0.7.68887  
- [DB] Some notes for later cleanup on Maren Silverwing (that Blizzard changed 293 times this patch)  
- [DB] Couple Delve object sources verified  
- Midnight Delves: Season 2 (#2472)  
    * Delves: Midnight Season 2, Base  
    * Restructure and move around Vendor items from Season 1  
    * Add Season 2 Vendor Items  
    * Quests  
    * The Ring of Glory Delve  
    * Gnarldor Isle Delve  
    * Sort Factions  
- [Logic] Removed colons from other report names  
- Finish adding Blizzcon items, ignore some objects  
- [Test] Adjusted logic for the 'ATTscripttimeout' test  
- [Logic] Added backticks around stacktrace error dialogs  
- [DB] Sourced 2 NYI Treasures in Legion (ty LexJoe for finding one of them!)  
- [Logic] Does this trailing semi-colon really kill FlightPath report links? Tune in tomorrow to find out  
- Misc. changes  
    * [Locales] A few of missing locales to es and mx  
    * Blizzard eliminated the nonsense of the Galactic Voidsliver and the Galactic Void Matrix early.  
    * SoD: Quest The Perfect Poison (86674)  
- [Contrib] Added capability to perform Object loot verification against ATT data for Objects which are tagged with 'VerifyLoot' (Eventually plan to expand this behavior to accept NPC and Item Container loots as well where it may be deemed necessary to employ user reports to determine more accurate loot sources)  
    * /att debug-print will currently always perform loot verification while active (will remove after further testing)  
- [Contrib] Cleaned up some repeat-reporting duplicated text using ArrayAppendDistinct  
- [DB] Twilight Ordnance is spelled this way in game so it needs to match in ATT for proper tooltip logic  
- Fix a few reported errors  
- Delves: Remove duplicate provider on Delve Trinkets  
- [Contrib] Another ignored object  
- Update MountDB for 12.1.0.68824, setup Blizzcon bundles, fix some reported errors  
- Corrected Naigtal and Val World Boss loot.  
- [Logic] Fixed an issue where loading into a map which was a sub-map in the 'maps' of a root map group would not properly include the mapped content of the root map group in the Mini List  
    [Logic] Improved some Mini List generation performance for maps which have sub-maps linked by distinctly appending the mapped sub-map groups (which would always include the existing root map group) to the mapping result set  
- [Logic] Added 'ArrayAppendDistinct' to distinctly combine array sets  
    [Test] Added a small test suite for ArrayAppendDistinct, courtesy of Copilot :robot:  
- [Misc] Some notes about what's needed for removal of headerID caching  
- [Parser] Added a WARN log when using a 'whereany' symlink with only 1 conditional value  
- [DB] Fix/improve some BFA Warfront symlinks  
- [Logic] Fixed some excessive filling of NPC content by restricting non-header to only fill based on provider groups  
- [DB] Replaced a lot of 'headerID' symlink selects with SymSelectors  
- [DB] Missed a couple 'expansionID' symlink selects  
- [DB] Replaced all 'expansionID' sym selections with direct SymSelectors  
    [Logic] Removed caching of 'expansionID' (This will break /att expansion:# for the time being)  
- [Parser] Sorted RaceIDs ExportDB & compressed FlightPathDB  
- Fix a few reported errors  
- [Locale] Update others: ObjectDB.  
- Bump Vanilla flavors to 1.15.9.68808  
    Parse all flavors  
- [DB] Fixed providers on Delve Trinkets  
- [Contrib] Couple ignored mining nodes  
- [WIP] Planning future ProviderDB implementation  
- Vaults of Atal'Utek: A couple of quests  
- [DB] Added 'VerifyLoot' tag to Delve objects (WIP feature for Contribute mode in ATT)  
- [Logic] NPC Filler now fills Things directly-tagged with NPCs [previously only a Header tagged with NPC would be filled under an appropriate NPC] (surely this will have no unforeseen side-effects)  
- [DB] Midnight Delves refactoring  
    - Moved Container objects from S1 to general Midnight Delves  
    - Added verified/inferred Object providers for various Delve Completion categories  
- [Debug] Added a simple "OpenItems" HTML page which can be edited to batch-open many Wowhead Item pages at once  
- [DB] Removed modID on some TW vendor items  
- [Parser] Added a 'symselector' concept to easily mark a specific header for quick symlink retrieval so that sym logic won't need to select and filter potentially huge lists of data (but this is not currently used)  
- [DB] Added some missing Haranir Race information causing some lacking data in export  
- Fixed Haranir race factions.  
- Added FirstCraft confirmed questID.  
- [CI] Prevent releases at the same time.  
- Fix a few reported quest and object errors  
- Fixed timeline for n\_CommonVendorItems.  
- Delves: A couple of minor updates around coordinates  
    Housing: Add preprocessors to entries from d5f55a38f86edfca887c8e3259645123b4eb5030 until timeline issues get resolved  
- Housing/Endeavors: Change header for the Amani  
    - Grifta's Token of Appreciation is earned in the same manner as Community Coupons. By completing the 'Endeavor Tasks'  
- Housing: Added a couple more 12.1.0 Decor vendors  
- [DB] Deteremined a bunch more account wide quests  
- Housing: Add Amani Endeavor 12.1.0 content  
- [DB] Ignore g cost  
