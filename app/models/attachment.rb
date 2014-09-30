# encoding: utf-8
class Attachment < ActiveRecord::Base
  has_attached_file :file

  validates :file, presence: true
  validates_attachment_file_name :file, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates_attachment :file, :size => { :in => 0..25.megabytes }
end

