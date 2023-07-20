module ApplicationHelper
  def about_show
    about = About.first
    return if about.nil?
    about
  end
end
