class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :album

    def self.all.select do |song_instance|
            song_instance.album_id == self
        end
    end
end 

