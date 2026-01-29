input_files="$1"
num_lines="$2"

echo "Input Files are: $input_files"
echo "Showing first $num_lines lines"

wc -l $input_files | sort -n | head -n $num_lines
