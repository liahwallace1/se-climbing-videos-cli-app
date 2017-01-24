class SeClimbingVideos::Scraper

#  attr_accessor :youtube_url, :vimeo_url
#
#  def initialize(youtube_url, vimeo_url)
#    @youtube_url = youtube_url
#    @vimeo_url = vimeo_url
#  end

  def self.scrape_youtube_list(youtube_search_url)
    doc = Nokogiri::HTML(open(youtube_search_url))

    youtube_videos = []

    doc.css("div.yt-lockup-content").each do |video|
      youtube_videos << {
      :origin = "Youtube",
      :name = doc.search("a.yt-uix-tile-link").attr("title").text,
      :upload_user = doc.search("div.yt-lockup-byline").text,
      :duration = doc.search("span.accessible-description").text.gsub(" - Duration: ", "").gsub(".", ""),
      :video_url = "https://www.youtube.com" +  doc.search("a.yt-uix-tile-link").attr("href").value}
    end
    youtube_videos
  end

  def self.scrape_youtube_video(video_url)
    video_doc = Nokogiri::HTML(open(video_url))

    video_info = {
      :description = video_doc.search("#eow-description").text,
      :upload_date = video_doc.search("#watch-uploader-info").text.gsub("Published on ", "").strip
      }

    video_info
  end


  def self.scrape_vimeo_list
    doc = Nokogiri::HTML(open("http://vimeo.com/search/sort:latest?q=boone+nc+bouldering"))

    vimeo_videos = []

    doc.css("div.iris_video-vital").collect do |video|
      vimeo_videos << {
      :origin = "Vimeo",
      :name = doc.search("span.iris_link-header").text,
      :upload_user = doc.search("a.iris_userinfo").text,
      :duration = doc.search("span.iris_annotation__duration").text,
      :video_url = doc.search("a.iris_video-vital__overlay").attr("href").value
    }
    end
    vimeo_videos
  end

  def self.scrape_vimeo_video(video_url)
    video_doc = Nokogiri::HTML(open(video_url))

    video_info = {
    :description = description_doc.search("p.first").text,
    :upload_date = description_doc.search("time.clip-time").text.split(" ")
    }

    video_info
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
