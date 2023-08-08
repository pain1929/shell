#!/bin/bash

# 检查是否传入了类名参数
if [ $# -eq 0 ]; then
  echo "错误：请传入类名作为参数！"
  exit 1
fi

# 将输入的类名转换为小写形式
classname_lower=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# 将输入的类名转换为大写形式，用于头文件宏定义
classname_upper=$(echo "$1" | tr '[:lower:]' '[:upper:]')

# 定义头文件名和源文件名
header_filename="${classname_lower}.h"
source_filename="${classname_lower}.cpp"

# 检查文件是否已存在
if [ -f "$header_filename" ] || [ -f "$source_filename" ]; then
  echo "错误：文件已存在！"
  exit 1
fi

# 创建头文件
echo "#ifndef ${classname_upper}_H" > "$header_filename"
echo "#define ${classname_upper}_H" >> "$header_filename"
echo "" >> "$header_filename"
echo "class $1" >> "$header_filename"
echo "{" >> "$header_filename"
echo "public:" >> "$header_filename"
echo "    $1();" >> "$header_filename"
echo "" >> "$header_filename"
echo "    ~$1();" >> "$header_filename"
echo "" >> "$header_filename"
echo "private:" >> "$header_filename"
echo "};" >> "$header_filename"
echo "" >> "$header_filename"
echo "#endif /* ${classname_upper}_H */" >> "$header_filename"

# 创建源文件
echo "#include \"${classname_lower}.h\"" > "$source_filename"
echo "" >> "$source_filename"
echo "$1::$1()" >> "$source_filename"
echo "{" >> "$source_filename"
echo "}" >> "$source_filename"
echo "" >> "$source_filename"
echo "$1::~$1()" >> "$source_filename"
echo "{" >> "$source_filename"
echo "}" >> "$source_filename"

echo "C++类模板已生成：$header_filename 和 $source_filename"
