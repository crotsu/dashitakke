class Source < ActiveRecord::Base
  belongs_to :answer
=begin
  Paperclip.interpolates :user do |attachment, style|
   attachment.instance.user
  end

  Paperclip.interpolates :date do |attachment, style|
   attachment.instance.date
  end
=end

  # アップロードしたファイルの保存先
  number = User.current.number
  save_dir_path = "#{Rails.root}/public/source_code/" + "j" + number.to_s[0..1] + "/j" + number.to_s.delete("-") + "/"

  has_attached_file :avatar, path: save_dir_path + ":filename"
  validates_attachment :avatar, content_type: { content_type: ["application/octet-stream"] }

end
