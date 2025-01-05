class Article < ApplicationRecord
  belongs_to :user
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_one_attached :image

  def self.search(search)
    if search != ""
      Article.where('issue LIKE(?)', "%#{search}%")
    else
      Article.all
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["theme", "issue", "measure"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "tags"]
  end
end
