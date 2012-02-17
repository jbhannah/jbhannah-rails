class Post < ActiveRecord::Base
  class << self
    def months
      published.group_by { |post| post.published_at.beginning_of_month }.keys
    end
  end

  belongs_to :user
  paginates_per 10

  scope :by_year, lambda { |year|
    t = Time.new(year)
    where("published_at >= ? AND published_at < ?", t, t + 1.year)
  }
  scope :by_month, lambda { |year, month|
    t = Time.new(year, month)
    where("published_at >= ? AND published_at < ?", t, t + 1.month)
  }
  scope :by_day, lambda { |year, month, day|
    t = Time.new(year, month, day)
    where("published_at >= ? AND published_at < ?", t, t + 1.day)
  }

  scope :published, where(published: true)
  default_scope order('published_at DESC')

  before_validation :update_published_at, :set_slug
  validates_presence_of :title, :user_id, :body

  def to_param
    slug
  end

  def prev
    Post.where("published_at < ?", published_at).first if published?
  end

  def next
    Post.where("published_at > ?", published_at).last if published?
  end

  private
  def set_slug
    self.slug = title.parameterize
  end

  def update_published_at
    self.published_at = Time.now if published? and published_at.nil?
  end
end
