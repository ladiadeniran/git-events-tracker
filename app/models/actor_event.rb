class ActorEvent < ActiveRecord
  belongs_to :events
  belongs_to :actor
end