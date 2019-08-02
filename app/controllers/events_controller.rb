# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    render json: Event.ordered_events, status: 200
  end

  def create
    @event = Event.new(event_params)
    @event.actor = Actor.find_or_create_by!(actor_params)
    @event.repo = Repo.find_or_create_by!(repo_params)
    if @event.save
      render json: @event.to_specs, status: 201
    else
      render json: "Invalid Record", status: 400
    end
  end

  def destroy
    Event.destroy_all
    render json: "All Events Destroyed", status: 200
  end

  private

  def event_params
    {
      id: params[:id],
      type: params[:type],
    }
  end

  def actor_params
    params.require(:actor).permit(:id, :login, :avatar_url)
  end

  def repo_params
    params.require(:repo).permit(:id, :name, :url)
  end

end