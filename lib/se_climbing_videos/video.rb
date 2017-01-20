class SeClimbingVideos::Video

  attr_accessor :name, :location, :upload_date, :upload_user, :description, :length, :video_url

  @@all = []

  def self.all
    @@all
  end

  def self.all_at_location(location_name)
    self.all.collect! {|video| video.location == location_name}
  end

end
