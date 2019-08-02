class ActorsController < ApplicationController

  def events
    actor = Actor.find(params[:actorID])
    actor_events = actor.ordered_events
    render json: actor_events, status: 200
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: 404
  end

  def update
    # binding.pry
    search_params = actor_params.except(:avatar_url, :id)
    actor = Actor.where(search_params)
    render json: {}, status: 400 if actor.blank?
    actor = Actor.find(actor_params[:id])
    actor.update(actor_params)
  rescue ActiveRecord::RecordNotFound
      render json: {}, status: 404
  else
    render json: actor, status: 200
  end

  def index
    render json: Actor.order_by_events, status: 200
  end

  def actor_params
    params.permit(:id, :login, :avatar_url)
  end

  def streak
    render json: Actor.order_by_streak, status: 200
  end
end