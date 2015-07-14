require 'kconv'

class Source < ActiveRecord::Base
  belongs_to :answer

  # アップロードしたファイルの保存先
  number = User.current.number
  save_dir_path = "#{Rails.root}/public/source_code/" + "j" + number.to_s[0..1] + "/j" + number.to_s.delete("-") + "/"

  has_attached_file :avatar, path: save_dir_path + ":filename"

  # avatarは必須
  validates_attachment_presence :avatar
  # *.cしか受け付けない
  validates_attachment_file_name :avatar, :matches => [/.c\Z/]
  # 100kB未満のファイルしか受け付けない
  validates_attachment_size :avatar, :less_than => 100.kilobytes

  def getSourcefile path
    f = open(path, "r")
    # 文字コードをUTF-8に変換する。それでも不正なバイト文字が含まれていたら'?'で置換
    srcFile = f.read.toutf8.scrub('?')
    f.close
    return srcFile
  end

  def filename_check original_filename = self.avatar.original_filename
    no = self.answer.question.index
    date = self.answer.question.paper.given_date.to_s
    filename = "No" + date.split("-")[1] + date.split("-")[2] + "_" + no.to_s + ".c"
    puts no, date, filename
    if original_filename == filename
      return true
    else
      self.errors[:base] << "指定したファイル名でアップロードしてください。"
      puts self.errors.messages
      return false
    end
  end

end
