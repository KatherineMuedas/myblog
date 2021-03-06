class ArticlesController < ApplicationController
before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
before_action :set_article, only:[:show, :edit, :update, :destroy]  

def index
  @articles = Article.where("published_at <= ?", Time.now).order(published_at: :desc).limit(5)
end

def programming_index
    @articles = Article.where(category: "Programming" ).where("published_at <= ?", Time.now).order(published_at: :desc)
end

def fashion_index
    @articles = Article.where(category: "Fashion" ).where("published_at <= ?", Time.now).order(published_at: :desc)
end

def new
  @categories = ["Fashion" , "Programming"]
  @article = Article.new
end

def create
  @categories = ["Fashion" , "Programming"]
  @article = Article.new(article_params)
 
  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end

def edit
  
end

def show
  @pictures = @article.pictures.order(created_at: :asc)
end

def update
  
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
  @article.destroy
 
  redirect_to articles_path
end

  private
  def set_article
    @article = Article.friendly.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :text, :published_at, :category)
  end

end
