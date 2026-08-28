# Rurutia_Raids Changelog

## 1.3.9 - 2026-08-05

- 补充太阳井高地、祖阿曼 WeakAuras 所需的 17 个副本提示语音。
- `有BUFF啦`、`治疗增效`、`践踏`、`快打宝珠` 采用正式服现行录音，`技能减耗` 采用 Titan 专用录音；其余 12 个旧太阳井录音经试听确认后沿用。
- 宝珠提示统一采用 `【露露】快打宝珠.ogg`；旧 WeakAuras 中的 `【露露】宝珠快打.ogg` 需随字符串迭代迁移。
- 补充当前 Classic Interface：MOP `50504`、泰坦重铸 `38002`、燃烧的远征 `20506`、经典旧世 `11509`，并保留各 toc 的旧兼容值。
- 同步所有 toc 的 `## Version` 到 `1.3.9`；部署时保留插件平台生成的 `addon_version.txt`，Dev 与发布包继续保持干净。

## 1.3.7 - 2026-06-21

- 为泰坦重铸时光服补充 `Rurutia_Raids_Wrath.toc` 的 `## Interface: 38001`，保留旧兼容值 `30403, 30800`。
- 同步所有 toc 的 `## Version` 到 `1.3.7`，保持同一发布包版本一致。
- 新增 Titan 专用一键部署脚本：`D:\!My_Agent\插件开发\Rurutia_Raids\工具_01_一键部署插件_Rurutia_Raids_Titan.py`。
