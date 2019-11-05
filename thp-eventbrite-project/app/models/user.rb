class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  # 1 - N association with hosted events (events) as host
  has_many :hosted_events, class_name: 'Event', foreign_key: 'host_id'
  
  # 1 - N association with Attendance as guest
  has_many :attendances, foreign_key: 'guest_id'

  # N - N association with attended event (event) as guest
  has_many :attended_events, through: :attendances, source: :attended_event


  validates :email, :first_name, :last_name,
  presence: true

  validates :email, uniqueness: true,
  format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'should look like something@provider.extension.'}

  validates :first_name, :last_name,
  format: {with: /[a-zA-Z]/, message: 'should only contain UTF-8 letters'}

  # hopefully this will avoid case troubles
  before_save :downcase_it_all

  after_create :welcome_send

  private

  # all to downcase - less problems in the DB
  def downcase_it_all
    self.email.downcase! if self.email
    self.first_name.downcase! if self.first_name
    self.last_name.downcase! if self.last_name
  end

  # sending email after creation
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
