class ActorsController < ApplicationController

  def events
    actor = Actor.find(params[:actorID])
    actor_events = actor.ordered_events
    render json: actor_events, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: "Record not Found", status: 404
  end

  def update
    actor_params = params[:actor]
    search_params = actor_params.except(:avatar_url, :id)
    actor = Actor.find(search_params)
    render status: 400 unless actor
    actor = Actor.find(actor_params[:id])
    actor.update(actor_params)
    render json status: 200
    rescue_from ActiveRecord::RecordNotFound
      render json: "Record not Found", status: 404
  end

  def index
    render json: Actor.order_by_events, status: 200
  end

  def streak
    render json: Actor.order_by_streak, status: 200
  end
end