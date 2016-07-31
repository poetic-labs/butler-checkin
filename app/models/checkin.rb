class Checkin < ActiveRecord::Base
  belongs_to :user
  has_many :notes

  def self.done
    where("complete IS true or missed IS true")
  end
end
