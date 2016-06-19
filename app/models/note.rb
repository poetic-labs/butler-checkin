class Note < ActiveRecord::Base
  belongs_to :creator, class_name: :user, foreign_key: :creator_id
  belongs_to :user
end
