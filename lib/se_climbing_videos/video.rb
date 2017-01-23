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
    ["1. Boone vid", "2. Boone vid 2"]
    #Need to iterate over videos and set up name, location, upload_user, upload_date
  end

end
