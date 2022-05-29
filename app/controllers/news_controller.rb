class NewsController < ApplicationController
  before_action :set_news, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :check_admin, except: %i[index show]

  def index
    @news = News.order('created_at DESC')
  end

  def show
    # render stream: true
    @comment = @news.comments.build
    @comments = @news.comments.order created_at: :desc
    comment_ids = []
    @comments_author = {}
    @comments.each do |comment|
      comment_ids << comment.user_id if comment.user_id && !comment_ids.include?(comment.user_id)
    end

    # User.find(comment_ids).each do |user|
    User.where({ id: comment_ids }).find_each do |user|
      @comments_author[user.id] = user
    end
  end

  def new
    @news = News.new
  end

  def edit; end

  def create
    @news = News.new(news_params)
    respond_to do |format|
      if @news.save
        format.html do
          flash[:success] = 'News added!'
          redirect_to news_index_path
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update # rubocop:disable Metrics/AbcSize
    respond_to do |format|
      if @news.updated_at.to_s != params['news']['updated_at']
        format.html do
          flash[:warning] = 'The data has been changed by the administrator, please make your changes again!'
          redirect_to edit_news_path
        end
      elsif (@news.name == params['news']['name']) && (@news.body == params['news']['body'])
        format.html do
          flash[:warning] = "You haven't made any changes!"
          redirect_to @news
        end
      else
        # TODO: increment and decrement probably not the best solution
        @news.edit_counter += 1
        if @news.update(news_params)
          format.html do
            flash[:success] = 'Updated news!'
            redirect_to @news
          end
        else
          @news.edit_counter -= 1
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @news.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'News removed!'
        redirect_to news_index_url
      end
    end
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def check_admin
    return if current_user.admin

    flash[:danger] = 'You do not have permissions!'
    redirect_to news_index_path
  end

  def news_params
    params.require(:news).permit(:name, :body, :edit_counter)
  end
end
