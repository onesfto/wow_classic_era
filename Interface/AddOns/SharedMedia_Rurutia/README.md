# SharedMedia_Rurutia Classic

露露的 SharedMedia 媒体资源包，面向 Classic / 怀旧服客户端。

## 内容

- `MyMedia.lua`：向 LibSharedMedia 注册声音和状态条材质。
- `SharedMedia_Rurutia_*.toc`：不同怀旧服分支的 toc 元数据。
- `Rurutia/`、`Rurutia_Common/`、`Rurutia_Extra/`、`Rurutia_SA/`：声音资源目录。
- `statusbar/`：状态条材质。
- `libs/`：随包加载的 LibSharedMedia 依赖。

## 版本

- 当前版本以对应客户端 toc 的 `## Version` 字段为准。
- Classic 目录保留多个 toc，维护时不要只看一个文件就删除其他分支元数据。

## 维护

修改媒体文件或 `MyMedia.lua` 后，在项目根运行：

```powershell
python scripts\verify_sharedmedia_rurutia.py
```

游戏内还需要确认插件列表加载正常，并在支持 SharedMedia 的插件或 WeakAuras 中检查声音/材质是否可见。
