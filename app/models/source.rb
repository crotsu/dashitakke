class Source < ActiveRecord::Base
  belongs_to :answer

  # アップロードしたファイルの保存先
  number = User.current.number
  save_dir_path = "#{Rails.root}/public/source_code/" + "j" + number.to_s[0..1] + "/j" + number.to_s.delete("-") + "/"

  has_attached_file :avatar, path: save_dir_path + ":filename"
  validates_attachment :avatar, content_type: { content_type: ["application/octet-stream"] }

  def getSourcefile path
    f = open(path, "r")
    srcFile = f.read.scrub('?')
    f.close
    return srcFile
  end

end
