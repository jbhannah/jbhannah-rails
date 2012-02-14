class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :user_id, :body

  self.per_page = 10
end
