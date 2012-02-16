class Post < ActiveRecord::Base
  class << self
    def months
      all.group_by { |post| post.published_at.beginning_of_month }.keys
    end
  end

  belongs_to :user
  paginates_per 10

  scope :published, where(published: true)
  default_scope order('published_at DESC')

  before_validation :update_published_at

  validates_presence_of :title, :user_id, :body

  def prev
    Post.where("published_at < ?", published_at).first if published?
  end

  def next
    Post.where("published_at > ?", published_at).last if published?
  end

  private
  def update_published_at
    self.published_at = Time.now if published? and published_at.nil?
  end
end
