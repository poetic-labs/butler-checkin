class Note < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :user
  belongs_to :checkin
end
