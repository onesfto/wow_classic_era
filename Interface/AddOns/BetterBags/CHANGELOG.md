# BetterBags

## [v0.4.9](https://github.com/Cidan/BetterBags/tree/v0.4.9) (2026-06-29)
[Full Changelog](https://github.com/Cidan/BetterBags/compare/v0.4.8...v0.4.9) [Previous Releases](https://github.com/Cidan/BetterBags/releases)

- fix: resolve Classic/Era/TBC SCROLLBAR\_WIDTH nil arithmetic crash (#980)  
    * fix: resolve BankSlots module loading crash on Classic/TBC/Vanilla  
    - Use AceAddon's silent retrieval (\`addon:GetModule("BankSlots", true)\`) to prevent throwing a fatal crash in environments where the retail-only \`BankSlots\` panel module is not loaded (Classic/TBC/Vanilla).  
    - Guard the slide-out panel instantiation in \`bank.proto:OnCreate\` with \`addon.isRetail and bankSlots\`.  
    - Add a new comprehensive compatibility unit test \`spec/bags/bank_spec.lua\` simulating Classic/TBC environments to reproduce the bug and verify loading stability.  
    * fix: resolve nil-indexing database crash in Classic and Era bags  
    - Root Cause: Under Classic and Era client overrides, 'tabs:Create' was invoked without passing a 'kind' (BAG\_KIND) parameter, leading to a nil kind being propagated. This eventually crashed database:GetGroup with 'attempt to index field ? (a nil value)' when checking IsDefaultGroup.  
    - Solution:  
      1. Pass the correct BAG\_KIND argument ('const.BAG\_KIND.BACKPACK') during tab creation inside 'bags/classic/backpack.lua' and 'bags/era/backpack.lua'.  
      2. Added defensive nil guards to 'core/database.lua''s 'GetAllGroups' and 'GetGroup' to handle missing or unregistered bag kinds gracefully.  
      3. Corrected wrong backwards values for '\_G.Enum.BankType' in 'spec/helpers/wow\_mocks.lua' to match the official client contract.  
    - Testing & Quality:  
      1. Created 'spec/bags/backpack\_spec.lua' to test and prevent backpack OnCreate regressions.  
      2. Added dedicated tests for nil-safety in 'spec/database\_spec.lua'.  
      3. Ran all 35 test files individually and achieved 100% pass rate.  
      4. Ran 'luacheck .' with 0 warnings or errors.  
    * fix(constants): resolve Classic/Era/TBC SCROLLBAR\_WIDTH nil arithmetic crash  
    - Classic and Era constants overrides in core/classic/constants.lua and core/era/constants.lua were completely replacing the main const.OFFSETS table without defining SCROLLBAR\_WIDTH.  
    - This caused a fatal 'attempt to perform arithmetic on field SCROLLBAR\_WIDTH (a nil value)' crash inside views/gridview.lua:613 and views/bagview.lua:227 on Classic/TBC/Vanilla clients.  
    - Add SCROLLBAR\_WIDTH = 14 to both local OFFSETS overrides to restore correct rendering.  
    - Add spec/core/constants\_spec.lua to assert that the constants overrides always retain and specify SCROLLBAR\_WIDTH, satisfying Prime Directive TDD rules.  
- fix: resolve nil-indexing database crash in Classic and Era bags (#979)  
    * fix: resolve BankSlots module loading crash on Classic/TBC/Vanilla  
    - Use AceAddon's silent retrieval (\`addon:GetModule("BankSlots", true)\`) to prevent throwing a fatal crash in environments where the retail-only \`BankSlots\` panel module is not loaded (Classic/TBC/Vanilla).  
    - Guard the slide-out panel instantiation in \`bank.proto:OnCreate\` with \`addon.isRetail and bankSlots\`.  
    - Add a new comprehensive compatibility unit test \`spec/bags/bank_spec.lua\` simulating Classic/TBC environments to reproduce the bug and verify loading stability.  
    * fix: resolve nil-indexing database crash in Classic and Era bags  
    - Root Cause: Under Classic and Era client overrides, 'tabs:Create' was invoked without passing a 'kind' (BAG\_KIND) parameter, leading to a nil kind being propagated. This eventually crashed database:GetGroup with 'attempt to index field ? (a nil value)' when checking IsDefaultGroup.  
    - Solution:  
      1. Pass the correct BAG\_KIND argument ('const.BAG\_KIND.BACKPACK') during tab creation inside 'bags/classic/backpack.lua' and 'bags/era/backpack.lua'.  
      2. Added defensive nil guards to 'core/database.lua''s 'GetAllGroups' and 'GetGroup' to handle missing or unregistered bag kinds gracefully.  
      3. Corrected wrong backwards values for '\_G.Enum.BankType' in 'spec/helpers/wow\_mocks.lua' to match the official client contract.  
    - Testing & Quality:  
      1. Created 'spec/bags/backpack\_spec.lua' to test and prevent backpack OnCreate regressions.  
      2. Added dedicated tests for nil-safety in 'spec/database\_spec.lua'.  
      3. Ran all 35 test files individually and achieved 100% pass rate.  
      4. Ran 'luacheck .' with 0 warnings or errors.  
- fix: resolve BankSlots module loading crash on Classic/TBC/Vanilla (#977)  
    - Use AceAddon's silent retrieval (\`addon:GetModule("BankSlots", true)\`) to prevent throwing a fatal crash in environments where the retail-only \`BankSlots\` panel module is not loaded (Classic/TBC/Vanilla).  
    - Guard the slide-out panel instantiation in \`bank.proto:OnCreate\` with \`addon.isRetail and bankSlots\`.  
    - Add a new comprehensive compatibility unit test \`spec/bags/bank_spec.lua\` simulating Classic/TBC environments to reproduce the bug and verify loading stability.  