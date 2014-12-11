class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followed_user, class_name: 'User'

  # def follow user
  #   followed_user << user
  # end
  #
  # def unfollow user
  #   followed_user.delete(user)
  # end

end
