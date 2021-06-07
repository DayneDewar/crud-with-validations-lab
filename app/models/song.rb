class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :release_year, numericality: {less_than_or_equal_to: 2021}, if: :released_true?

    def released_true?
        self.released == true
    end

    def yes
        if self.released
            self.release_year
        else
            "Not Released"
        end
    end
    
end
