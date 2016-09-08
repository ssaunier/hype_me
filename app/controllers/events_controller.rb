require 'soundcloud'

class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.near([params[:lat], params[:lng]], 50).where(date: Date.today).first(10)
    @user_lat = params[:lat]
    @user_lng = params[:lng]
  end

  def show

  end

  private

  def event_params
    params.require(:event).permit(:title, :club_id, :price, :address, :starts_at, :ends_at, :description, :opening_hours, :date, :event_url, :photo, :photo_cache)
  end
end
