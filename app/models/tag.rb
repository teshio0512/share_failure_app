class Tag < ApplicationRecord
  has_many :article_tags
  has_many :articles, through: :article_tags
  validates :tag_name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["tag_name"]
  end
end
