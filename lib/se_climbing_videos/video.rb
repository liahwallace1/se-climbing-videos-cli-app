class SeClimbingVideos::Video

  attr_accessor :name, :location, :upload_date, :upload_user, :description, :length, :video_url

  @@all = []

  def initialize(@name=nil, @location=nil, @upload_date=nil, @upload_user=nil)
    @name = name
    @location = SeClimbingVideos::CLI.location
    @upload_date = upload_date
    @upload_user = upload_user
    @@all << self
  end

  def self.all
    @@all
  end

  def self.all_at_location(location_name)
    self.all.collect! {|video| video.location == location_name}
  end

  def self.recent_videos
    #scrape Youtube and Vimeo for videos for selected location
    #should return list of latest 20 videos from selected location in order of upload from both websites
    #Need to iterate over videos and set up name, location, upload_user, upload_date
    #to test
    video_1 = self.new
    video_1.name = "Two Days in Boone"
    video_1.upload_user = "Zachary Galla"
    video_1.upload_date = "6 months ago"

    video_2 = self.new
    video_2.name = "Nick Zavaleta - Grandmoth Bouldering"
    video_2.upload_user = "zavaleta411"
    video_2.upload_date = "1 year ago"

    [video_1, video_2]

  end

end
