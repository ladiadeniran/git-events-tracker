# frozen_string_literal: true

class Event < ActiveRecord
  has_many :actor_events
  has_many :actors, through: :actor_events

  has_many :repo_events
  has_many :repos, through: :repo_events
end