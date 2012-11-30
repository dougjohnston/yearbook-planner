module ApplicationHelper
  def title(main_title)
    content_for(:title) { main_title.to_s }
  end
end
