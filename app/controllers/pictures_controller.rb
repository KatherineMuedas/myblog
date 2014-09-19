class PicturesController < ApplicationController
  before_action :find_article, only: [:new, :create, :destroy]
  
  def new
    @picture = @article.pictures.new
  end

  def create
    @categories = ["a" , "b" , "c"]
    @picture = @article.pictures.new(pictures_params)
    if @picture.save
      redirect_to article_path(@article)
    else
      redirect_to :back, notice: 'picture was not saved'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to :back, notice: 'Picture was successfully deleted'
  end

  private
  def find_article
    @article = Article.find(params[:article_id])
  end

  def pictures_params
    params.require(:picture).permit(:category, :photo)
  end

  
end
