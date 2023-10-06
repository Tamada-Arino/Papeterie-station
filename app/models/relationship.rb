class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validate :cannot_follow_yourself

  private

  def cannot_follow_yourself
    if follower == followed
      errors.add(:base, "You cannot follow yourself")
    end
  end
end
