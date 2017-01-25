class SeClimbingVideos::Video

  attr_accessor :name, :location, :upload_date, :upload_user, :description, :duration, :video_url

  @@all = []

  def self.new_from_youtube_list(video)
    self.new(
      SeClimbingVideos::Scraper.list_doc.search("a.yt-uix-tile-link").attr("title").text, SeClimbingVideos::Scraper.list_doc.search("div.yt-lockup-byline").text, SeClimbingVideos::Scraper.list_doc.search("span.accessible-description").text.gsub(" - Duration: ", "").gsub(".", ""), ("https://www.youtube.com" +  SeClimbingVideos::Scraper.list_doc.search("a.yt-uix-tile-link").attr("href").value)
    )
  end

  def initialize(name=nil, upload_user=nil, duration=nil, video_url=nil)
    @name = name
    @upload_user = upload_user
    @duration = duration
    @video_url = video_url
    @location = SEARCH_LINKS[SeClimbingVideos::CLI.location_input][:location]
    @all << self unless @@all.include?(self)
  end

#  def initialize(video_hash)
#    video_hash.each{|key, value| self.send(("#{key}="), value)}
#    @@all << self
#  end

  def self.all
    @@all
  end

  def self.find(input)
    self.all[input-1]
  end

  def video_doc
    @video_doc ||= Nokogiri::HTML(open(self.video_url))
  end

  def description
    @description ||= @video_doc.search("#eow-description").text
  end

  def upload_date
    @upload_date ||= video_doc.search("#watch-uploader-info").text.gsub("Published on ", "").strip
  end

  def self.all_at_location
    self.all.collect! {|video| video.location == SEARCH_LINKS[SeClimbingVideos::CLI.location_input][:location]}
  end


#  def self.create_from_collection(video_array)
#    video_array.each{|video_hash| Video.new(video_hash)}
#  end
#
#  def add_video_attributes(attributes_hash)
#    attributes_hash.each{|key, value| self.send(("#{key}="), value)}
#    self
#  end

end
