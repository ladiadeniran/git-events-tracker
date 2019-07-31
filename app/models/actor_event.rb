class ActorEvent < ApplicationRecord
  belongs_to :events
  belongs_to :actor
end
