class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates_format_of :price, :with => /\A([0]|[1-9]\d*)[.]\d{0,2}\z/
  #validate

  def average_rating
		sum = 0
		self.reviews.each do |rev|
			sum += rev.rating
		end
		sum.to_f/self.reviews.length
	end

end
