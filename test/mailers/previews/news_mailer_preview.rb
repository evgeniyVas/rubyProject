# Preview all emails at http://localhost:3000/rails/mailers/news_mailer
class NewsMailerPreview < ActionMailer::Preview
  def post_news
    # @user = params[:user]
    # @news = params[:news]
    # mail(to: @user.email, subject: "Latest news!")
    NewsMailer.with(user: User.first, news: News.where('created_at > ?', 1.day.ago), domain: 'https://' + ActionMailer::Base.default_url_options[:host]).post_news
  end
end
