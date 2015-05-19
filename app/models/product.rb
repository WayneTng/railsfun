class Product < ActiveRecord::Base
  validates :title, :description, :price, presence: true
  validates_numericality_of :price, :on => :create, :greater_than => 0
  #validates numericality: {greater_than: 0, allow_blank = false}
  validate :title_is_shorter_than_description
  scope :published,            ->       { where(published: true) }
  scope :priced_more_than,     ->(price){ where('price > ?', price) }
  scope :description_includes, ->(text) { where('description ILIKE ?',"%#{text}%") }

  def title_is_shorter_than_description
    return if title.blank? or description.blank?
    if description.length < title.length
      errors.add(:description, 'can\'t be shorter than title')
    end
  end
end