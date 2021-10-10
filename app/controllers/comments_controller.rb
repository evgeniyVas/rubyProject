class CommentsController < ApplicationController
  before_action :set_news!
  before_action :set_comment!, except: %i[create]

  def create
    @comment =  @news.comments.build comment_params

    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to news_path(@news)
    else
      @comments = @news.comments.order created_at: :desc
      render 'news/show'
    end
  end

  def edit
  end

  def update
    if @comment.update comment_params
      flash[:success] = "Updated comment!"
      redirect_to news_path(@news, anchor: "comment-#{@comment.id}")
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment removed!"
    redirect_to news_path(@news)
  end


  private

  def set_news!
    @news = News.find params[:news_id]
  end

  def set_comment!
    @comment = @news.comments.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
