class Admins::RoomsController < Admins::BaseController
  def index
    rooms = current_inn.rooms
    @rooms = paginate rooms
  end

  def new
    @room = current_inn.rooms.new
  end
end