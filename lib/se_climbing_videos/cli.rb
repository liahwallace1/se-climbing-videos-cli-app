#Our CLI Controller

class SeClimbingVideos::CLI

  attr_accessor :location_input

  def call
    puts "Welcome to SE Climbing Videos. This is a way to find the newest videos uploaded on Vimeo and Youtube for your favorite Southeast Bouldering spot."
    start
  end

  def start
    location_search
    print_videos
    select_video
  #  select_time
    select_new_video
    select_new_location
    goodbye
  end

  def location_search
    puts "Please enter the number of the bouldering area you would like to search:"
    puts "You can enter:"
    puts "1. Boone, NC"
    puts "2. Grayson Highlands, VA"
    puts "3. Horse Pens 40, AL"
    puts "4. Rocktown, GA"
    puts "5. Rumbling Bald, NC"
    puts "6. Stone Fort (LRC), TN"
    self.location_input = gets.strip

    if ["1", "2", "3", "4", "5", "6"].include?(@location_input)
      SeClimbingVideos::Scraper.new.make_videos(SeClimbingVideos::SEARCH_LINKS[@location_input][:link], SeClimbingVideos::SEARCH_LINKS[@location_input][:location])
  #  case @location_input
  #    when "1"
  #      make_videos(:boone)
  #      add_attributes_to_videos
  #      list_20_videos(:boone)
  #      puts "Search results for Boone, NC"
  #    when "2"
  #      make_videos(:grayson_highlands)
  #      add_attributes_to_videos
  #      list_20_videos(:grayson_highlands)
  #      puts "Search results for Grayson Highlands, VA"
  #    when "3"
  #      make_videos(:horse_pens_40)
  #      add_attributes_to_videos
  #      list_20_videos(:horse_pens_40)
  #      puts "Search results for Horse Pens 40, AL"
  #    when "4"
  #      make_videos(:rocktown)
  #      add_attributes_to_videos
  #      list_20_videos(:rocktown)
  #      puts "Search results for Rocktown, GA"
  #    when "5"
  #      make_videos
  #      add_attributes_to_videos
  #      list_20_videos(:rumbling_bald)
  #      puts "Search results for Rumbling Bald, NC"
  #    when "6"
  #      make_videos
  #      add_attributes_to_videos
  #      list_20_videos(:stone_fort)
  #      puts "Search results for Stone Fort (LRC), TN"
    elsif @location_input =="exit"
      goodbye
      exit
    else
      puts "Please enter a valid number. If you don't see your favorite location, send me an email so I can update the app!"
      location_search
    end
  end

#  def make_videos
#    video_array = SeClimbingVideos::Scraper.scrape_youtube_list(SEARCH_LINKS[@location_input][:youtube])
#    SeClimbingVideos::Video.create_from_collection(video_array)
#  end

#  def add_attributes_to_videos
#    Video.all.each do |video|
#        attributes = SeClimbingVideos::Scraper.scrape_youtube_video(video.video_url)
#        video.add_video_attributes(attributes)
#      end
#    end
#  end

  def print_videos
    puts "---Latest 20 videos from #{SeClimbingVideos::SEARCH_LINKS[@location_input][:location]}---"
    puts ""
 SeClimbingVideos::Video.all.each.with_index(1) do |video, i|
      if video.location == SeClimbingVideos::SEARCH_LINKS[@location_input][:location]
      puts "#{i}. #{video.name} - #{video.upload_user} - #{video.upload_date}"
      end
    end
  end

  def select_video
    puts "Please select which video from the list you would like to learn more about:"
    video_input = gets.strip

    if video_input.to_i > 0 and video_input.to_i < 21
      video = SeClimbingVideos::Video.find(video_input)
      display_video(video)
    elsif video_input == "exit"
      select_new_location
    else
      puts "Not sure which video you want to see more about, type list number or exit."
      select_video
    end
  end

  def display_video(video)
    puts ""
    puts "Video Name:     #{video.name}"
    puts ""
    puts "Location:       #{video.location}"
    puts "Upload Date:    #{video.upload_date}"
    puts "Uploaded By:    #{video.upload_user}"
    puts "Duration:       #{video.duration}"
    puts "Video URL:      #{video.video_url}"
    puts ""
    puts "Description:"
    puts "#{video.description}"
    puts ""
  end

  def select_new_video
    puts "Would you like to select another video from the list? (Y/N)"
    input = gets.strip.upcase
    case input
      when "Y"
        select_video
        select_new_video
      when "N"
        select_new_location
      when "exit"
        goodbye
        exit
      else
        "Please enter Y to search more videos or N to exit"
        select_new_video
    end
  end

#  def select_time
#    puts "You can pick far back you want your search to go."
#    puts "You can enter:"
#    puts "1. one week ago"
#    puts "2. one month ago"
#    puts "3. three months ago"
#    puts "4. six months ago"
#    puts "5. one year ago"
#    puts "6. forever"
#    @time = gets.strip.downcase
#    case @time
#      when "1"
#        puts "Provide videos uploaded in the past week"
#      when "2"
#        puts "Provide videos uploaded in the past month"
#      when "3"
#        puts "Provide videos uploaded in the past 3 months"
#      when "4"
#        puts "Provide videos uploaded in the past 6 months"
#      when "5"
#        puts "Provide videos uploaded in the past year"
#      when "6"
#        puts "Provide all videos uploaded for this location"
#      when "exit"
#        goodbye
#        exit
#      else
#        puts "Please enter a valid number."
#        select_time
#    end
#  end

  def select_new_location
    puts "Would you like to search for videos in a different location? (Y/N)"
    input = gets.strip.upcase
    case input
      when "Y"
        SeClimbingVideos::Video.reset
        start
      when "N"
        goodbye
        exit
      when "exit"
        goodbye
        exit
      else
        "Please enter Y to search more videos or N to exit"
        select_new_location
    end
  end

  def goodbye
    puts "Come back soon to see the newest climbing videos for your favorite area!"
  end

end
