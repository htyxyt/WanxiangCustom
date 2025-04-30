@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo === 步骤 1：重命名 YAML 文件（若尚未重命名） ===
for %%f in (
  wanxiang.dict.yaml
  wanxiang.schema.yaml
  wanxiang_charset.dict.yaml
  wanxiang_charset.schema.yaml
  wanxiang_en.dict.yaml
  wanxiang_en.schema.yaml
  wanxiang_lookup.dict.yaml
  wanxiang_lookup.schema.yaml
  wanxiang_radical.dict.yaml
  wanxiang_radical.schema.yaml
  wanxiang_stroke.dict.yaml
  wanxiang_stroke.schema.yaml
  wanxiang_symbols.yaml
) do (
  if exist "%%f" (
    set "newname=%%f"
    set "newname=!newname:wanxiang=wanxiangpro!"
    ren "%%f" "!newname!"
    echo ✅ 已重命名：%%f → !newname!
  ) else (
    echo ⏩ 跳过：%%f 不存在或已重命名
  )
)

echo === 步骤 2：重命名词典目录（若尚未重命名） ===
if exist "cn_dicts" (
  ren "cn_dicts" "cn_dicts_pro"
  echo ✅ 已重命名目录：cn_dicts → cn_dicts_pro
) else (
  echo ⏩ 跳过：目录 cn_dicts 不存在或已是 cn_dicts_pro
)

echo === 步骤 3：重命名 Lua 文件（若尚未重命名） ===
if exist "lua\super_comment.lua" (
  ren "lua\super_comment.lua" "super_comment_pro.lua"
  echo ✅ 已重命名：lua\super_comment.lua → super_comment_pro.lua
) else (
  echo ⏩ 跳过：lua\super_comment.lua 不存在或已重命名
)
if exist "lua\super_preedit.lua" (
  ren "lua\super_preedit.lua" "super_preedit_pro.lua"
  echo ✅ 已重命名：lua\super_preedit.lua → super_preedit_pro.lua
) else (
  echo ⏩ 跳过：lua\super_preedit.lua 不存在或已重命名
)

echo === 步骤 4：替换所有 wanxiang → wanxiangpro（全文替换） ===
for %%f in (wanxiangpro*.yaml) do (
  powershell -Command ^
    "$f='%%f';" ^
    "$c = Get-Content -Raw -Encoding UTF8 $f;" ^
    "if ($c -match 'wanxiang') {" ^
      "$c = $c -replace 'wanxiang', 'wanxiangpro';" ^
      "$utf8NoBom = New-Object System.Text.UTF8Encoding($false);" ^
      "[System.IO.File]::WriteAllText($f, $c, $utf8NoBom);" ^
      "Write-Host ✅ 已替换文件：$f" ^
    "} else {" ^
      "Write-Host ⏩ 跳过：$f（未包含 wanxiang）" ^
    "}"
)

echo === 步骤 5：替换 wanxiangpro.dict.yaml 中 cn_dicts → cn_dicts_pro ===
if exist "wanxiangpro.dict.yaml" (
  powershell -Command ^
    "$f='wanxiangpro.dict.yaml';" ^
    "$c = Get-Content -Raw -Encoding UTF8 $f;" ^
    "if ($c -match 'cn_dicts') {" ^
      "$c = $c -replace 'cn_dicts', 'cn_dicts_pro';" ^
      "$utf8NoBom = New-Object System.Text.UTF8Encoding($false);" ^
      "[System.IO.File]::WriteAllText($f, $c, $utf8NoBom);" ^
      "Write-Host ✅ 已替换 cn_dicts → cn_dicts_pro" ^
    "} else {" ^
      "Write-Host ⏩ 跳过：已无 cn_dicts" ^
    "}"
)

echo === 步骤 6：替换 schema 中 super_comment/super_preedit → *_pro ===
if exist "wanxiangpro.schema.yaml" (
  powershell -Command ^
    "$f='wanxiangpro.schema.yaml';" ^
    "$c = Get-Content -Raw -Encoding UTF8 $f;" ^
    "$c = $c -replace 'super_comment', 'super_comment_pro';" ^
    "$c = $c -replace 'super_preedit', 'super_preedit_pro';" ^
    "$utf8NoBom = New-Object System.Text.UTF8Encoding($false);" ^
    "[System.IO.File]::WriteAllText($f, $c, $utf8NoBom);" ^
    "Write-Host ✅ 已替换所有 super_comment/super_preedit"
)

echo.
echo ✅✅✅ 所有操作已完成 ✅✅✅
pause
