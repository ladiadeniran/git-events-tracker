# frozen_string_literal: true

class Actor < ApplicationRecord
  has_many :actor_events
  has_many :events, through: :actor_events
end
