#!/bin/bash
MAIN_FILE="demo.tex"
MAIN_NAME="demo"

# 第一步：记录引用位置（核心）
xelatex -synctex=1 -interaction=nonstopmode $MAIN_FILE

# 第二步：生成参考文献（核心）
bibtex $MAIN_NAME

# 第三步：解析所有引用（核心）
xelatex -synctex=1 -interaction=nonstopmode $MAIN_FILE

# 第四步：完善目录/超链接（兜底，非必需但推荐）
xelatex -synctex=1 -interaction=nonstopmode $MAIN_FILE

# 清理冗余文件
rm -f *.aux *.log *.toc *.synctex.gz *.out *.bbl *.blg chapters/*.aux \
      *.lof *.lot *.fls *.fdb_latexmk *.bak *.xdv *.thm
echo "✅ 编译完成"