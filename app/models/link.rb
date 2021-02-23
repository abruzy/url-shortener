class Link < ApplicationRecord
  before_validation :generate_slug

  validates_presence_of :url  
  validates :url, format: URI::regexp(%w[http https])  
  validates_uniqueness_of :slug
  
  # auto slug generation
  def generate_slug
    self.slug = SecureRandom.uuid[0..5] if self.slug.nil?
  end
end
