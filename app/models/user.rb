class User < ActiveRecord::Base
  has_many :checkins
  has_many :notes
  has_many :created_notes, foreign_key: :creator_id, class_name: :user

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def last_checkin_date
    checkins.try(:last).try(:created_at)
  end
end
