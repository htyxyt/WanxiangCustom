# [万象官方版本](https://github.com/amzxyz/rime_wanxiang)对Pro和基础版做了文件名区分，已经默认支持共存，故本项目的脚本已弃用。

##  ~~使用说明：万象输入法个人配置 + 基础版&Pro版共存工具~~

~~`Rename_wanxiangpro.bat` 脚本可以使[`万象拼音pro版`](https://github.com/amzxyz/rime_wanxiang_pro) 方案与[`万象拼音基础版`](https://github.com/amzxyz/rime_wanxiang) 能一起部署到同一个用户文件夹中，不会发生冲突。~~

---

### ~~1. 准备工作~~

~~从以下项目地址下载 Pro 版和基础版的方案，然后解压：~~

- ~~GitHub 地址：[`万象拼音pro版`](https://github.com/amzxyz/rime_wanxiang_pro)~~

- ~~GitHub 地址：[`万象拼音基础版`](https://github.com/amzxyz/rime_wanxiang)~~

---

### ~~2. 执行一键处理脚本~~

~~将本仓库中的 `Rename_wanxiangpro.bat` 脚本复制到 **Pro 版文件夹根目录**下（和 `.yaml`、`lua/`、`cn_dicts/` 同级）。~~

~~然后**双击运行该 `.bat` 脚本一次**。~~

~~📌 注意：~~

- ~~**请只执行一次！** 多次执行会导致重复替换（如 `wanxiangpropro`）。~~
- ~~脚本会执行以下操作：~~

| ~~步骤~~ | ~~操作说明~~ |
|------|-----------|
| ~~步骤 1~~ | ~~将所有 `wanxiang*.yaml` 文件重命名为 `wanxiangpro*.yaml`~~ |
| ~~步骤 2~~ | ~~将 `cn_dicts` 文件夹重命名为 `cn_dicts_pro`~~ |
| ~~步骤 3~~ | ~~将 `lua/super_comment.lua`和 `super_preedit.lua`分别重命名为 `super_comment_pro.lua`和 `super_preedit_pro.lua`~~ |
| ~~步骤 4~~ | ~~替换所有 `.yaml` 文件中的 `wanxiang` 为 `wanxiangpro`~~ |
| ~~步骤 4.5~~ |~~修正 `wanxiangpro.schema.yaml` 中的 `wanxiangpro-lts-zh-hans` 回 `wanxiang-lts-zh-hans`，以共用模型文件~~ |
| ~~步骤 5~~ | ~~替换 `wanxiangpro.dict.yaml` 中的 `cn_dicts/` 为 `cn_dicts_pro/`~~ |
| ~~步骤 6~~ | ~~替换 `wanxiangpro.schema.yaml` 中的所有 `super_comment`、`super_preedit` 为 `super_comment_pro.lua`、 `super_preedit_pro.lua`~~ |

---

### ~~3. 复制到 Rime 用户文件夹~~

- ~~将所有基础版的文件复制到 Rime 用户文件夹中~~

- ~~将所有**处理后的**pro版的文件复制到 Rime 用户文件夹中~~

- ~~将本项目的`default.yaml`复制到 Rime 用户文件夹中，其他`custom`文件可以使用自己的，但需要注意基础版和pro版的区分~~

---

### ~~4. 重新部署~~

- ~~点击**重新部署**，即可在rime输入法设置中看到 `wanxiang` 和 `wanxiangpro` 两个输入方案~~
- ~~`wanxiang` → 基础版，适合全拼和不使用辅助码的用户~~
- ~~`wanxiangpro` → 增强版，启用了超级注释、辅助码、拆分码、错音提示等功能~~
- ~~可在方案菜单中或使用快捷键切换使用~~

