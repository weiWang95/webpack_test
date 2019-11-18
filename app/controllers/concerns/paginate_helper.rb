module PaginateHelper
  extend ActiveSupport::Concern

  def offset
    (page - 1) * per_page
  end

  def page
    params[:page].to_i <= 0 ? 1 : params[:page].to_i
  end

  def per_page
    params[:per_page].to_i <= 0 || params[:per_page].to_i > 50 ? 20 : params[:per_page].to_i
  end
  alias_method :limit, :per_page

  def paginate(relations, total_count: nil)
    if relations.is_a?(Array)
      Kaminari.paginate_array(relations, limit: limit, offset: offset, total_count: total_count)
    else
      relations.page(page).per(per_page)
    end
  end
end