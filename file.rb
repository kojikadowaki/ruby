# フォルダ内のテキストファイル名を取得
folder_files = Dir.glob("*.txt")

# 出力先のファイル
output_file = "output_combined.txt"

File.open(output_file, 'w') do |output|
  # フォルダ内のテキストファイル名を取得
  text_files = Dir.glob(folder_files)

  # 取得したテキストファイル名を開いて1つのファイルに書き込む
  text_files.each do |file_path|
    File.foreach(file_path) { |line| output.puts(line) }
  end
end