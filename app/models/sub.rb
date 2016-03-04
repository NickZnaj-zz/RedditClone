class Sub < ActiveRecord::Base
  validates :moderator_id, :title, :description, presence: true

  belongs_to(:moderator, class_name: 'User', primary_key: :id, foreign_key: :moderator_id)
  has_many(:postsubs, class_name: 'PostSub', primary_key: :id, foreign_key: :sub_id)
  has_many(:posts, through: :postsubs, source: :post)



end
