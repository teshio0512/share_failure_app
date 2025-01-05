class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @articles = Article.order("id DESC")
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

  def search
    @articles = Article.search(params[:keyword])
  end

  def detailsearch
    @q = Article.ransack(params[:q])
    @articles = @q.result.order("id DESC")
  end

  def show
  end

  def edit
    article_attributes = @article.attributes
    @article_form = ArticleForm.new(article_attributes)
    @article_form.tag_name = @article.tags.first&.tag_name
  end

  def update
    @article_form = ArticleForm.new(article_form_params)
    if @article.image.present?
      @article_form.image ||= @article.image.blob
    end
    if @article_form.valid?
      @article_form.update(article_form_params, @article)
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
  def article_form_params
    params.require(:article_form).permit(:theme, :issue, :measure, :result, :tag_name, :image).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    if @article.user.id != current_user.id
      redirect_to root_path
    end
  end
end
