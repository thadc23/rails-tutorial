class ArticlesController < ApplicationController
  def new
  end

  def index
    @articles = Article.where(nil) # creates an anonymous scope
    @articles = @articles.title(params[:title]) if params[:title].present?
  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
