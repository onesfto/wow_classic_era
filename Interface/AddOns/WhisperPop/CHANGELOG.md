# WhisperPop

## 1.0.5 Rurutia fix 3 (2026-07-27)

- toc: 同步非 Era 客户端 Interface 到本机最新（只补不删旧值）：`_TBC` 20504→`20504, 20506`；`_Wrath` `30403, 30800`→`30403, 30800, 38001`；`_Mists` `50502, 50503`→`50502, 50503, 50504`；`_Mainline` `110205, 110207, 120000`→`…, 120007`。Era `_Vanilla` 已是 11509，未改。内嵌库 toc 未动。

## 1.0.5 Rurutia fix 2 (2026-07-27)

- fix: Classic Era 1.15.x 收密语报错 `Core.lua:440 attempt to call a nil value`——`ChatFrame_GetMessageEventFilters` 在该端不存在，改为运行时判空，缺失时跳过垃圾过滤、正常收密语。
- toc: Vanilla `## Interface` 11508 → 11509（对齐硬核 Era 当前版本，消除过期提示）。

## [4.45](https://github.com/Witnesscm/WhisperPop/tree/4.45) (2024-08-21)
[Full Changelog](https://github.com/Witnesscm/WhisperPop/compare/4.44...4.45) [Previous Releases](https://github.com/Witnesscm/WhisperPop/releases)

- feat: revert LibDataBroker  
- fix: invoke OnMouseUp script after OnDragStart  
- toc: addon icon  
- toc: bump up version  
