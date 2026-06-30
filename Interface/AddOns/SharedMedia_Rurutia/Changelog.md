# SharedMedia_Rurutia Classic Changelog

## 1.9.4 (2026-06-04)

- 新增项目根脚本 `scripts/check_smr_sync.py`：只对比 Retail / Classic 两个 `Rurutia/` 音频文件夹，并覆盖更新黑曜石 `00-Todo/TODO_SMR语音同步检查.md`。
- 新增测试 `tests/test_check_smr_sync.py`，覆盖音频扩展名识别、Retail 独有、Classic 独有、同名不同内容的对比逻辑。
- 本次是开发工具增强，不修改 Classic 发布目录音频、`MyMedia.lua` 或 `.toc`，因此不提升 toc 版本。
- 补齐 Classic 发布目录维护文档：`README.md`、`Changelog.md`、`LICENSE`。
- 不修改 `MyMedia.lua`、媒体文件或 `.toc` 加载顺序；本次不提升 toc 版本。


