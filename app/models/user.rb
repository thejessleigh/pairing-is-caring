class User < ActiveRecord::Base
  # validations should be taken care of through Socrates authorization
  # validates :name, uniqueness: :true, presence: :true
  # validates :email, uniqueness: :true, presence: :true
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  # validates :password, presence: true, length: { minimum: 8 }
  # validates :password_confirmation, presence: true

  # has_secure_password

  has_many :appointments, foreign_key :mentor_id
  has_many :mentees, through: :appointments

  has_many :sessions, class_name: "Appointment", foreign_key :mentee_id
  has many :mentors, through: :sessions
end
