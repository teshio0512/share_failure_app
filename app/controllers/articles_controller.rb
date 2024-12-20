class ArticlesController < ApplicationController
  def index
    @articles = Article.order("id ASC")
  end

  def new
    @article_form = ArticleForm.new
  end

  def create
    @article_form = ArticleForm.new(article_form_params)
    if @article_form.valid?
      @article_form.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def article_form_params
    params.require(:article_form).permit(:theme, :issue, :measure, :result, :tag_name, :image).merge(user_id: current_user.id)
  end
end
