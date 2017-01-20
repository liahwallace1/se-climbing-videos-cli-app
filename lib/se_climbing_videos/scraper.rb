require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page(webpage)
    html = Nokogiri::HTML(open("webpage"))
  end

  def get_videos_youtube
    self.get_page.css("li.div.yt-lockup-video")
    binding.pry
  end

  def get_videos_vimeo
    self.get_page.css()
  end

end

Scraper.new(https://www.youtube.com/results?sp=CAI%253D&q=Boone+NC+bouldering).get_videos_youtube
