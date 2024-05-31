class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances

  # def self.upcoming_events
  #   where('date >= ?', Date.today).order(date: :asc)
  # end

  # def self.past_events
  #   where('date < ?', Date.today).order(date: :desc)
  # end

  scope :upcoming_events, -> { where('date >= ?' || 'date == ?', Date.today).order(date: :asc) }
  scope :past_events, -> { where('date < ?', Date.today).order(date: :desc) }
end
