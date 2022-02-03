class Actor < ApplicationRecord
    #Perform model was the relationship and now is two '1 to many' relationships
    #One actor many performs
    #One movie many performs
    has_many :performs
    #In order to connect movies and actors we have to do it through performs
    has_many :movies, through: :performs
end
