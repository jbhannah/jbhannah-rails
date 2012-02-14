class Post < ActiveRecord::Base
  belongs_to :user
  paginates_per 10

  scope :published, where(published: true)
  default_scope order('created_at desc')

  validates_presence_of :title, :user_id, :body
end
