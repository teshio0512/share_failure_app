class ArticleForm
  include ActiveModel::Model
  attr_accessor :theme, :issue, :measure, :result, :user_id, :id, :created_at, :updated_at, :tag_name, :image

  with_options presence: true do
    validates :theme
    validates :issue
    validates :measure
    validates :result
    validates :user_id
  end

  def save
    article = Article.new(theme: theme, issue: issue, measure: measure, result: result, user_id: user_id)
    if image.present?
      article.image.attach(image)
    end
    article.save
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ArticleTag.create(article_id: article.id, tag_id: tag.id)
    end
  end

  def update(params, article)
    article.article_tags.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    article.update(params)
    ArticleTag.create(article_id: article.id, tag_id: tag.id) if tag_name.present?
  end
end
