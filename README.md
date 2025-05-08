##  使用说明：万象输入法个人配置 + 基础版&Pro版共存工具

`Rename_wanxiangpro.bat` 脚本可以使[`万象拼音pro版`](https://github.com/amzxyz/rime_wanxiang_pro) 方案与[`万象拼音基础版`](https://github.com/amzxyz/rime_wanxiang) 能一起部署到同一个用户文件夹中，不会发生冲突。

---

### 1. 准备工作

从以下项目地址下载 Pro 版源码，然后解压：

- GitHub 地址：https://github.com/amzxyz/rime_wanxiang_pro

---

### 2. 执行一键处理脚本

将本仓库中的 `Rename_wanxiangpro.bat` 脚本 **复制到 Pro 版文件夹根目录下**（和 `.yaml`、`lua/`、`cn_dicts/` 同级）。

然后**双击运行该 `.bat` 脚本一次**。

📌 注意：

- **请只执行一次**，多次执行会导致重复替换（如 `wanxiangpropro`）。
- 脚本会执行以下操作：

| 步骤 | 操作说明 |
|------|-----------|
| 步骤 1 | 将所有 `wanxiang*.yaml` 文件重命名为 `wanxiangpro*.yaml` |
| 步骤 2 | 将 `cn_dicts` 文件夹重命名为 `cn_dicts_pro` |
| 步骤 3 | 将 `lua/super_comment.lua`和 `super_preedit.lua`分别重命名为 `super_comment_pro.lua`和 `super_preedit_pro.lua` |
| 步骤 4 | 替换所有 `.yaml` 文件中 `wanxiang` 为 `wanxiangpro` |
| 步骤 4.5 |修正 `wanxiangpro.schema.yaml` 中的 `wanxiangpro-lts-zh-hans` → `wanxiang-lts-zh-hans` |
| 步骤 5 | 替换 `wanxiangpro.dict.yaml` 中的 `cn_dicts` 为 `cn_dicts_pro` |
| 步骤 6 | 替换 `wanxiangpro.schema.yaml` 中所有 `super_comment`、`super_preedit` 为带 `_pro` 版本 |

---

### 3. 复制到 Rime 用户文件夹

**将所有处理后的文件复制到 Rime 用户文件夹中：**

**将本项目的`default.yaml`复制到 Rime 用户文件夹中：**

点击重新部署，即可在输入法中看到 `wanxiang` 和 `wanxiangpro` 两个输入方案。

---

### 4. 快捷说明

- `wanxiang` → 原始基础版方案
- `wanxiangpro` → 增强版，启用了超级注释、辅助码、拆分码、错音提示等功能
- 可在方案菜单中或使用快捷键切换使用

