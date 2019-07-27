class Repo < ActiveRecord

  has_many :repo_events
  has_many :events, through: :repo_events
end