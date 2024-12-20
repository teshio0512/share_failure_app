class ArticleForm
  include ActiveModel::Model
  attr_accessor :theme, :issue, :measure, :result, :user_id, :tag_name

  with_options presence: true do
    validates :theme
    validates :issue
    validates :measure
    validates :result
    validates :user_id
  end

  def save
    article = Article.create(theme: theme, issue: issue, measure: measure, result: result, user_id: user_id)
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ArticleTag.create(article_id: article.id, tag_id: tag.id)
    end
  end
end
