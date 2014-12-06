class Shout < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :user

  default_scope { order ("created_at DESC")}
end
