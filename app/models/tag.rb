class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  before_validation :set_slug
  validates_presence_of :name, :slug

  default_scope order('slug ASC')

  def to_s
    name
  end

  def to_param
    slug
  end

  private
  def set_slug
    self.slug = name.parameterize
  end
end
