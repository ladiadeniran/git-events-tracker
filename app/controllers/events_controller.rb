# frozen_string_literal: true

class EventsController < ApplicationController
  def index

  end
  def create
  end

  private

  def event_params
    param.require(:event).permit(:type)
  end
end