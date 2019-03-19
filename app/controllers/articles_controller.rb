class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = set_article
    @articles = Article.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
  @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @article = set_article
  end

  def new
    @article = Article.new
  end

  def update
    @article = set_article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @article = set_article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'article was successfully destroyed.' }
    end
  end

  private

  def set_article
    Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
