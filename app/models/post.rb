class Post < ActiveRecord::Base
  validates :title, :author_id, :postsubs, presence: true

  belongs_to(:author, class_name: 'Author', primary_key: :id, foreign_key: :author_id)
  has_many(:postsubs, class_name: 'PostSub', primary_key: :id, foreign_key: :post_id, inverse_of: :post)
  has_many(:subs, through: :postsubs, source: :sub)


end
