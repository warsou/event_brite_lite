# here are the events that will be displayed in the app
class Event < ApplicationRecord
  # 1 - N association with Attendance as attended event
  has_many :attendances, foreign_key: 'attended_event_id'

  # N - 1 association with host (user)
  belongs_to :host, class_name: 'User'

  # N - N association with guests (users) through attendances as attended event
  has_many :guests, through: :attendances, source: :guest

  validates :title, :start_date, :duration,
  :description, :price, :location,
  presence: true

  validates :title,
  :length => {:within => 5..140} 

  validate :start_date_cannot_be_in_the_past

  validates :duration,
  :numericality => { :only_integer => true, :greater_than => 0 }
  
  validate :duration_must_be_multiple_of_5

  validates :description,
  :length => {:within => 20..1000}
  
  validates :price,
  :numericality => { :only_integer => true},
  :inclusion => { :in => 1..1000 }

  # instance methods for display
  def display_start_date
    start_date.strftime("%a, %b %-d")
  end

  def display_end_date
    (start_date + duration * 60).strftime("%A - %B %-d - %Hh%M")
  end

  private

  # custom validator for start date
  def start_date_cannot_be_in_the_past
    errors.add(:start_date, 'cannot be in the past') if
    start_date < Time.zone.today
  end

  # custom validator for duration
  def duration_must_be_multiple_of_5
    errors.add(:duration, 'must be a multiple of 5') if
    duration%5 != 0
  end
end
