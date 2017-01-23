class SeClimbingVideos::Scraper

  attr_accessor :webpage

  def initialize(webpage)
    @webpage = webpage
  end

  def get_page
    Nokogiri::HTML(open(@webpage))
  end

  def get_videos_youtube
    self.get_page.css("li.div.yt-lockup-video")
  end
binding.pry
  def get_videos_vimeo
    self.get_page.css()
  end

end

Scraper.new('https://www.youtube.com/results?sp=CAI%253D&q=Boone+NC+bouldering').get_videos_youtube
