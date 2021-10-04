module NewsHelper
  def full_title(page_title = "")
    base_title = "E.V App"
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end
