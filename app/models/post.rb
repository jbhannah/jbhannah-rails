class Post < ActiveRecord::Base
  belongs_to :user
  paginates_per 10

  scope :published, where(published: true)

  validates_presence_of :title, :user_id, :body
end
