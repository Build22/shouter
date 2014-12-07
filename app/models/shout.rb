class Shout < ActiveRecord::Base
  validates_associated :content
  belongs_to :user
  default_scope { order("created_at DESC")}
  belongs_to :content, polymorphic: true
end
