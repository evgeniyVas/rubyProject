class WeeklyNewsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @news = News.where('created_at > ?', 1.week.ago)
    if @news.any?
      User.where('subscription = 0').each do |user|
        NewsMailer.with(user: user, news: @news, domain: 'https://' + ActionMailer::Base.default_url_options[:host]).post_news.deliver_later
      end
    end
  end
end
