class NewsMailer < ApplicationMailer
  def post_news
    @user = params[:user]
    @news = params[:news]
    @domain = params[:domain]
    mail(to: @user.email, subject: "Latest news!")
  end
end
