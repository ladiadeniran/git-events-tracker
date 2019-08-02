class Actor < ActiveRecord::Base
  validates :login, uniqueness: true, presence: true
  validates :id, uniqueness: true, presence: true
  has_many :events
  self.primary_key = :id
  def ordered_events
    events.order(:id).map do |event|
      event.to_specs
    end
  end

  def self.order_by_events
    query = <<-SQL
      SELECT actors.*, COUNT(events.id) AS event_count
       FROM actors inner join events WHERE actors.id = events.actor_id
      GROUP BY actors.id
      ORDER BY event_count DESC, events.created_at DESC, actors.login
    SQL
    records = ActiveRecord::Base.connection.exec_query(query).to_a
    records.map do |record|
      record.except("event_count")
    end
  end

  def self.order_by_streak
    query = <<-SQL
    SELECT actors.*, COUNT(events.id) AS event_count
    FROM actors inner join events WHERE actors.id = events.actor_id
    GROUP BY actors.id
    ORDER BY event_count DESC, events.created_at DESC, actors.login
    SQL
    ActiveRecord::Base.connection.exec_query(query).to_a
  end
end
