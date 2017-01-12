class User < ActiveRecord::Base
  has_many :checkins
  has_many :notes
  has_many :created_notes, foreign_key: :creator_id, class_name: :user

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  after_create :build_default_checkins

  def set_default_role
    self.role ||= :user
  end

  def self.active
    User.where(active: true)
  end

  def self.incomplete
    month_number = Date.today.month
    year_number = Date.today.year
    month = "#{year_number}-#{month_number}-01"
    User.active.joins(:checkins).where(checkins: {month: month, complete: nil})
  end

  def self.complete
    month_number = Date.today.month
    year_number = Date.today.year
    month = "#{year_number}-#{month_number}-01"
    User.active.joins(:checkins).where(checkins: {month: month, complete: true})
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def current_checkins
    if this_month_checkin_complete?
      date = Date.today + 1.month
    else
      date = Date.today
    end

    checkins.where("month <= ?", date).order('month desc')
  end

  def this_month_checkin_complete?
    this_month = Date.today.month
    last_done_checkin = checkins.done.last
    last_done_checkin_month = last_done_checkin.month.month # 'month' is a date attribute on the model

    ( this_month == last_done_checkin_month ) ? true : false
  end

  def build_default_checkins
    months = [1,2,3,4,5,6,7,8,9,10,11,12]
    months.each do |month|
      self.checkins.create(month: "2017-#{month}-01".to_date)
    end
  end
end
