class SeClimbingVideos::Scraper

  attr_accessor :youtube_url, :vimeo_url

  def initialize(youtube_url, vimeo_url)
    @youtube_url = youtube_url
    @vimeo_url = vimeo_url
  end

#  def get_page
#    Nokogiri::HTML(open(@webpage))
#  end

  def self.scrape_youtube_list
    doc = Nokogiri::HTML(open(@youtube_url))

    doc.css("div.yt-lockup-content").collect do |item|
      video = SeClimbingVideos::Video.new
      video.name = doc.search("a.yt-uix-tile-link").attr("title").text
      video.upload_user = doc.search("div.yt-lockup-byline").text
      video.duration = doc.search("span.accessible-description").text.gsub(" - Duration: ", "").gsub(".", "")
      video.video_url = "https://www.youtube.com" +  doc.search("a.yt-uix-tile-link").attr("href").value
    end
  end

  def self.scrape_youtube_video

    description_doc = Nokogiri::HTML(open(video_url))
    video.description = description_doc.search("#eow-description").text
    video.upload_date = description_doc.search("#watch-uploader-info").text.gsub("Published on ", "").strip
  end


  def self.scrape_vimeo_list
    doc = Nokogiri::HTML(open("http://vimeo.com/search/sort:latest?q=boone+nc+bouldering"))

    doc.css("div.iris_video-vital").collect do |item|
      video = SeClimbingVideos::Video.new
      video.name = doc.search("span.iris_link-header").text
      video.upload_user = doc.search("a.iris_userinfo").text
      video.video_url = doc.search("a.iris_video-vital__overlay").attr("href").value
      video.duration = doc.search("span.iris_annotation__duration").text
    end
  end

  def self.scrape_vimeo_video

    description_doc = Nokogiri::HTML(open(video_url))
    video.description = description_doc.search("p.first").text
    video.upload_date = description_doc.search("time.clip-time").text.split(" ")
  end

#  def scrape_videos
#    videos = []
#
#    videos << self.get_videos_youtube
#    videos << self.get_videos_vimeo
#
#    videos
#  end
end

Scraper.new('https://www.youtube.com/results?sp=CAI%253D&q=Boone+NC+bouldering').get_videos_youtube
