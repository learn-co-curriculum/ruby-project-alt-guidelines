class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :album

    # def find_by_song_title(title)
    #     self.all.select do |song_instance|
    #         song_instance.album_id == self
    #     end
    # end
end 

