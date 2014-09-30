class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :pictures, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  def slug_candidates
    [
      :title,
    ]
  end
end