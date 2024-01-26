# 01行目：全てのディレクトリを取得する
# 03行目：".pdf" or ".PDF"の為、小文字に統一、末尾が".pdf"であるか
# 04行目：PDF::Readerクラスからインスタンスを生成し、そのインスタンスに"item"を入れる
# 05行目：PDFのページ数のカウントをする
# 06行目：空の配列、filename_listに格納
# 08行目：拡張子が".zip",".rb",".exe"でない事を条件付ける
# 14行目：filename_list.txtに書き出し

require 'pdf/reader'

filename_list = []

Dir.glob("**/*") do |item|
  if File.file?(item) 
    if item.downcase.end_with?(".pdf")
      pdf_reader = PDF::Reader.new(item)
      page_count = pdf_reader.page_count
      filename = item.encode("SJIS", "UTF-8").gsub("/", ",")
      filename_list << "#{filename},#{page_count}"
    elsif !item.downcase.end_with?(".zip",".rb",".exe")
      filename = item.encode("SJIS", "UTF-8").gsub("/", ",")
      filename_list << "#{filename}"
    end
  end
end

File.write("filename_list.txt", filename_list.join("\n"))
