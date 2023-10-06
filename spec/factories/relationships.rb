FactoryBot.define do
  factory :relationship do
    follower { association(:user) }
    followed { association(:user) }

    follower_id { follower.id }
    followed_id { followed.id }
  end
end
