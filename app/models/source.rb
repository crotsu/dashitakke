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
  has_attached_file :avatar,
  path: "#{Rails.root}/public/source_code/j14/:filename"
  do_not_validate_attachment_file_type :avatar
end
