class Movie < ApplicationRecord
    validates :title, presence: true
    validates :genre, presence: true
    has_many :reviews, dependent: :destroy#1 to many relationship, 1 movie has many reviews
    #Perform model was the relationship and now is two '1 to many' relationships
    #One actor many performs
    #One movie many performs
    has_many :performs, dependent: :destroy
    has_many :orders, dependent: :destroy
    #In order to connect movies and actors we have to do it through performs
    has_many :actors, through: :performs
    has_many :users, through: :orders

    def average_rating
        if self.reviews.count == 0
            return 0
        end
        stars_sum = 0
        self.reviews.each do |r|
            stars_sum += r.stars
        end
        return stars_sum / self.reviews.count
    end
end
