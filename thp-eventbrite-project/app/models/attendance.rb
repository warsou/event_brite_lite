class Attendance < ApplicationRecord
  validates :stripe_customer_id,
  presence: true,
  uniqueness: true
  
  # N - 1 association with guest (users)
  belongs_to :guest, class_name: 'User'
  # N - 1 association with events
  belongs_to :attended_event, class_name: 'Event'

  after_create :new_guest_send

  private

  # sending notification email to event creator
  def new_guest_send
    AttendanceMailer.new_guest_email(self.attended_event.host).deliver_now
  end
end
