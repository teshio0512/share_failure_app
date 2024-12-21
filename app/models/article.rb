class Article < ApplicationRecord
  belongs_to :user
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_one_attached :image

  def self.search(search)
    if search != ""
      Article.where('issue LIKE(?)', "%#{search}%")
    else
      Article.all
    end
  end
end
