module ApplicationHelper
  # 各ページタイトル設定
  BASE_TITLE = "PaiBook".freeze
  def full_title(page_title)
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} - #{BASE_TITLE}"
    end
  end
end
