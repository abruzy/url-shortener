class Link < ApplicationRecord
  before_validation :generate_slug

  validates_presence_of :url  
  validates :url, format: URI::regexp(%w[http https])  
  validates_uniqueness_of :slug

  def generate_slug
    return if self.slug.present?

    loop do
        self.slug = SecureRandom.uuid[0..5]
        break unless Link.where(slug: slug).exists?
    end
  end
end
