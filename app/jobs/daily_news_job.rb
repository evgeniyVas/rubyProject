class DailyNewsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    @news = News.where('created_at > ?', 1.day.ago)
    return if @news.none?

    User.where('subscription = 1').each do |user|
      NewsMailer.with(user: user, news: @news,
                      domain: "https://#{ActionMailer::Base.default_url_options[:host]}").post_news.deliver_later
    end
  end
end
