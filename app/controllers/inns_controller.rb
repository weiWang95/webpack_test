class InnsController < ApplicationController
  helper_method :current_inn

  def show
  end

  private

  def current_inn
    @_current_inn ||= Inn.find(params[:id])
  end
end