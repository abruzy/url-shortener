class Link < ApplicationRecord
  before_validation :generate_slug

  validates_presence_of :url
  validates :url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :slug
  validates_length_of :url, within: 3..255, on: :create, message: "too long"
  validates_length_of :slug, within: 3..255, on: :create, message: "too long"

  # fast access to the shortened link
  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug)
  end

  # auto slug generation
  def generate_slug
    self.slug = SecureRandom.uuid[0..5] if self.slug.nil? || self.slug.empty?
    true
  end

  # API
  def self.shorten(url, slug = '')
    link = Link.where(url: url, slug: slug).first
    return link.short if link  
    
    link = Link.new(url: url, slug: slug)
    return link.short if link.save
    
    Link.shorten(url, slug + SecureRandom.uuid[0..2])
  end
end
