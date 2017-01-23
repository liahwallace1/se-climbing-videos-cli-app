class SeClimbingVideos::Video

  attr_accessor :name, :location, :upload_date, :upload_user, :description, :length, :video_url

  @@all = []

  def self.all
    @@all
  end

  def self.all_at_location(location_name)
    self.all.collect! {|video| video.location == location_name}
  end

  def self.recent_videos
    #should return list of latest 20 videos from each location
    #to test
    puts "This is a list of the latest videos"
  end

end
