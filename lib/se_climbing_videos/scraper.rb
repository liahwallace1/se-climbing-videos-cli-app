class SeClimbingVideos::Scraper

  attr_accessor :youtube_url, :vimeo_url

  def initialize(youtube_url, vimeo_url)
    @youtube_url = youtube_url
    @vimeo_url = vimeo_url
  end

#  def get_page
#    Nokogiri::HTML(open(@webpage))
#  end

  def self.get_videos_youtube
    doc = Nokogiri::HTML(open(@webpage))
  end

  def self.get_videos_vimeo
    self.get_page.css()
  end

  def scrape_videos
    videos = []

    videos << self.get_videos_youtube
    videos << self.get_videos_vimeo

    videos
end

Scraper.new('https://www.youtube.com/results?sp=CAI%253D&q=Boone+NC+bouldering').get_videos_youtube
