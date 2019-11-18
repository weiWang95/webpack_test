module ApplicationHelper
  def body_class
    [params[:controller].gsub(/\//, '-').gsub('_', '-'), params[:action], 'page'].join('-')
  end
end
