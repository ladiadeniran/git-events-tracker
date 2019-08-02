class Event < ActiveRecord::Base
  self.inheritance_column = nil
  self.record_timestamps = false
  belongs_to :actor
  belongs_to :repo
  validates :id, uniqueness: true
  self.primary_key = :id
  def to_specs
    {
      id: id,
      type: type,
      actor: {
        id: actor.id,
        login: actor.login,
        avatar_url: actor.avatar_url
      },
      repo: {
        id: repo.id,
        name: repo.name,
        url: repo.url
      },
      created_at: created_at.to_s
    }
  end

  def self.ordered_events
    order(:id).map do |event|
      event.to_specs
    end
  end
end
