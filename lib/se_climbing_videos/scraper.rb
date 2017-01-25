class SeClimbingVideos::Scraper

  def get_page(link)
    Nokogiri::HTML(open(link))
  end

  def make_videos(link, location)
    self.get_page(link).css("div.yt-lockup-content").each do |video|
      SeClimbingVideos::Video.new_from_youtube_list(video, location)
    end
  end

end
