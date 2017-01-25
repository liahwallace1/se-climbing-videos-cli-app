class SeClimbingVideos::Scraper

  attr_accessor :list_doc

  def make_videos(link)
    @list_doc = Nokogiri::HTML(open(link))

    doc.css("div.yt-lockup-content").each do |video|
      SeClimbingVideos::Video.new_from_youtube_list(video)
    end
  end

#  def self.scrape_youtube_list(youtube_search_url)
#    doc = Nokogiri::HTML(open(youtube_search_url))
#
#    youtube_videos = []
#
#    doc.css("div.yt-lockup-content").each do |video|
#      youtube_videos << {
#      :origin = "Youtube",
#      :name = doc.search("a.yt-uix-tile-link").attr("title").text,
#      :upload_user = doc.search("div.yt-lockup-byline").text,
#      :duration = doc.search("span.accessible-description").text.gsub(" - Duration: ", "").gsub(".", ""),
#      :video_url = "https://www.youtube.com" +  doc.search("a.yt-uix-tile-link").attr("href").value}
#    end
#    youtube_videos
#  end
#
#  def self.scrape_youtube_video(video_url)
#    video_doc = Nokogiri::HTML(open(video_url))
#
#    video_info = {
#      :description = video_doc.search("#eow-description").text,
#      :upload_date = video_doc.search("#watch-uploader-info").text.gsub("Published on ", "").strip
#      }
#
#    video_info
#  end

end
