class Api::EventsController < Api::BaseController
  def index
    events = Event
    events = events.by_user(params[:user_id]) if params[:user_id]
    respond_with events.all
  end
end
