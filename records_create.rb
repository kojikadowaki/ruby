# 概要
  # 応募人数を参照して、その人数分のレコードを作成し、尚且つ先頭フィールドに連番を作成する

# 項目名  
  # 受付No,開始No,終了No,応募人数,都道府県,学校名,学校名よみがな,郵便番号,応募者住所,応募者電話番号,Fax番号メールアドレス,校長先生,指導教諭名

# データ作成例
  # D001,0001,0067,2,京都府,木津川市立相楽小学校,きづかわ,619-0222,京都府木津川市相楽清水１,0774-72-0221,0774-72-0280,aaa@yahoo.co.jp,●川　●郎,●畑　●梨,
                                                    
                                                          # ↓

  # 0001,D001,0001,0067,2,京都府,木津川市立相楽小学校,きづかわ,619-0222,京都府木津川市相楽清水１,0774-72-0221,0774-72-0280,aaa@yahoo.co.jp,●川　●郎,●畑　●梨
  # 0002,D001,0001,0067,2,京都府,木津川市立相楽小学校,きづかわ,619-0222,京都府木津川市相楽清水１,0774-72-0221,0774-72-0280,aaa@yahoo.co.jp,●川　●郎,●畑　●梨


#########################################################################################################################################################

def create_records(input_file_path)
  # 入力ファイルを読み込み、情報を取得
  lines = File.readlines("マスター.txt", encoding: 'Shift_JIS')

  lines.each do |line|
    reception_no,
    start_number,
    end_number,
    record_count,
    prefectures,
    school_name,
    kana,
    postal_code,
    address,
    phone_number,
    fax_number,
    email_address,
    head_teacher,
    teacher = line.chomp.split(',')
    
    # 開始No、終了No、応募人数を数値変換
    start_number = start_number.to_i
    end_number = end_number.to_i
    record_count = record_count.to_i

    # 連番を生成してテキストファイルに書き込み
    # 'a' オプションでファイルを追記モードにする
    File.open('school_master.txt', 'a') do |file|
      (start_number..end_number).each do |num|
        break if num > (start_number + record_count - 1)
        # 3桁の連番を0埋めして書き込み
        file.puts num.to_s.rjust(3, '0') + ",#{reception_no}," + 
          "#{start_number}," + 
          "#{end_number}," + 
          "#{record_count}," + 
          "#{prefectures}," + 
          "#{school_name}," + 
          "#{kana}," + 
          "#{postal_code}," + 
          "#{address}," + 
          "#{phone_number}," + 
          "#{fax_number}," + 
          "#{email_address}," + 
          "#{head_teacher}," + 
          "#{teacher}"
      end
    end
  end
end

# 入力ファイルのパスを指定して処理を実行
input_file_path = 'input.txt'
create_records(input_file_path)