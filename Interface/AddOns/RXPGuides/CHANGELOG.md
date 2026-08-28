# RestedXP Guides

## Rurutia fix5 (2026-06-20)

- Rurutia Fix: Mark all RXPGuides toc variants as `Rurutia fix5` for the Classic Era hardcore repair package.

## [v4.6.55](https://github.com/RestedXP/RXPGuides/tree/v4.6.55) (2024-11-27)
[Full Changelog](https://github.com/RestedXP/RXPGuides/compare/v4.6.54...v4.6.55) [Previous Releases](https://github.com/RestedXP/RXPGuides/releases)

- Merge branch 'main' of https://github.com/RestedXP/RXPGuides  
- silverpine guide load fix  
- Proper content phase detection for era realms  
- Draenei starting zone fixes  
- Rurutia Fix: Classic Era guide parser accepts lowercase map names and the Stormwind alias, preventing Wetlands/Stormwind route parse errors.
- Rurutia Fix: Empty `.train` guide hints now fall back to trainer steps instead of throwing invalid spell errors.
- Rurutia Fix: Classic Era no longer hooks proximity `TargetUnit()` scanning, avoiding protected action errors while keeping the manual target macro/buttons available.
- Rurutia Fix: Embedded guide loading is batched across frames to avoid login-time `GuideLoader.lua` script timeouts on 1.x clients.
- Rurutia Fix: Map lookup is now case-insensitive in the active WotLK DB path, fixing `.goto wetlands,...` in imported Era/SoD guides.
- Siren Isle Updates  
- Siren Isle Updates  
- Siren Isle Updates  
- Merge branch 'main' of https://github.com/RestedXP/RXPGuides  
- Small Durotar autoskip fix  
