class Post < ActiveRecord::Base
  belongs_to :user
  paginates_per 10

  scope :published, where(published: true)
  default_scope order('published_at desc')

  before_validation :update_published_at

  validates_presence_of :title, :user_id, :body

  def prev
    Post.find(id - 1) if Post.exists?(id - 1)
  end

  def next
    Post.find(id + 1) if Post.exists?(id + 1)
  end

  private
  def update_published_at
    self.published_at = Time.now if published? and published_at.nil?
  end
end
