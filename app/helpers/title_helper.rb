module TitleHelper
  def title(main_title)
    content_for(:title) { main_title.to_s }
  end

  def banner_title
    "#{school_short_name} Yearbook Planner"
  end

  def application_layout_title
    [school_short_name, page_title, layout_title_suffix].join(' ')
  end

  def authentication_layout_title
    [school_short_name, 'Login', layout_title_suffix].join(' ')
  end

  def school_short_name
    @current_school ? @current_school.short_name.upcase : ''
  end

  # Support methods
  def page_title
    content_for?(:title) ? content_for(:title) : 'Yearbook Planner'
  end

  def layout_title_suffix
    '- yearbookplanner.com'
  end
end
