class SeClimbingVideos::Video

  attr_accessor :name, :location, :upload_date, :upload_user, :description, :duration, :video_url, :origin

  @@all = []

  def initialize(video_hash)
    video_hash.each{|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

#  def self.all_at_location_by_date(location)
#    location_videos = self.all.collect! {|video| video.location == location_name}
#    location_array.sort_by! {|video| video.upload_date}
#  end


  def self.create_from_collection(video_array)
    video_array.each{|video_hash| Video.new(video_hash)}
  end

  def add_video_attributes(attributes_hash)
    attributes_hash.each{|key, value| self.send(("#{key}="), value)}
    self
  end

end
