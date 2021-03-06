class Picture < ActiveRecord::Base
  belongs_to :article
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>", :large =>"500x500>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
