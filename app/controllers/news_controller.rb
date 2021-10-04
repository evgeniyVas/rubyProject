class NewsController < ApplicationController
  before_action :set_news, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :check_admin, except: %i[ index show ]

  # GET /news or /news.json
  def index
    @news = News.order('created_at DESC')
  end

  # GET /news/1 or /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news or /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html {
          flash[:success] = "News added!"
          redirect_to news_index_path
        }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1 or /news/1.json
  def update
    respond_to do |format|
      if @news.updated_at.to_s != params['news']['updated_at']
        format.html {
          flash[:warning] = "The data has been changed by the administrator, please make your changes again!"
          redirect_to edit_news_path
        }
      elsif @news.name == params['news']['name'] and @news.body == params['news']['body']
        format.html {
          flash[:warning] = "You haven't made any changes!"
          redirect_to @news
        }
      else
        @news.edit_counter += 1
        if @news.update(news_params)
          format.html {
            flash[:success] = "Updated news!"
            redirect_to @news
          }
        else
          @news.edit_counter -= 1
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /news/1 or /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html {
        flash[:success] = "News removed!"
        redirect_to news_index_url
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end
    # check admin user
    def check_admin
      if !current_user.admin
        flash[:danger] = "You do not have permissions!"
        redirect_to news_index_path
      end
    end
    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:name, :body, :edit_counter)
    end
end
