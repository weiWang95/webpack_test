class Admins::BaseController < ApplicationController
  include PaginateHelper

  layout 'admin'

  helper_method :current_inn

  private

  def current_inn
    @_current_inn ||= current_user.inns.find(session_inn_id)
  end

  def current_inn=(inn)
    session[:inn_id] = inn.id
    @_current_inn = inn
  end

  def session_inn_id
    session[:inn_id] ||= current_user.inns.first.id
  end
end