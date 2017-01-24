#Our CLI Controller

class SeClimbingVideos::CLI

  def call
    puts "Welcome to SE Climbing Videos. This is a way to find the newest videos uploaded on Vimeo and Youtube for your favorite Southeast Bouldering spot."
    start
  end

  def start
    location_search
    list_videos
    display_video
  #  select_time
    display_new_video
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
    location_input = gets.strip
    case location_input
      when "1"
#        @location = "Boone, NC"
        puts "Search results for Boone, NC"
        make_videos(:boone))
      when "2"
#        @location = "Grayson Highlands, VA"
        puts "Search results for Grayson Highlands, VA"
        make_videos(:grayson_highlands)
      when "3"
#        @location = "Horse Pens 40, AL"
        puts "Search results for Horse Pens 40, AL"
        make_videos(:horse_pens_40)
      when "4"
#        @location = "Rocktown, GA"
        puts "Search results for Rocktown, GA"
        make_videos(:rocktown)
      when "5"
#        @location = "Rumbling Bald, NC"
        puts "Search results for Rumbling Bald, NC"
        make_videos(:rumbling_bald)
      when "6"
#        @location = "Stone Fort (LRC), TN"
        puts "Search results for Stone Fort (LRC), TN"
        make_videos(:stone_fort)
      when "exit"
        goodbye
        exit
      else
        puts "Please enter a valid number. If you don't see your favorite location, send us an email so we can update the app!"
        select_location
    end
  end

  def make_videos(location)
    youtube_array = SeClimbingVideos::Scraper.scrape_youtube_list(SEARCH_LINKS[location][:youtube])
    vimeo_array = SeClimbingVideos::Scraper.scrape_vimeo_list(SEARCH_LINKS[location][:vimeo])
    video_array = youtube_array + vimeo_array
    SeClimbingVideos::Video.create_from_collection(video_array)
  end

  def add_attributes_to_videos
    Video.all.each do |video|
      if video.origin == "Youtube"
        attributes = SeClimbingVideos::Scraper.scrape_youtube_video(video.video_url)
        video.add_video_attributes(attributes)
      elsif video.origin == "Vimeo"
        attributes = SeClimbingVideos::Scraper.scrape_vimeo_video(video.video_url)
        video.add_video_attributes(attributes)
      end
    end
  end

#  def list_videos
#    @video_array = SeClimbingVideos::Video.recent_videos
#    @videos.each.with_index(1) do |video, i|
#      puts "#{i}. #{video.name} - #{video.upload_user} - #{video.upload_date}"
#    end
#  end
#
  def display_video
    puts "Please select which video from the list you would like to learn more about:"
    video_input = gets.strip

    if video_input.to_i > 0
      puts "more info about video #{video_input}"
    elsif video_input == "list"
      list_videos
    else
      puts "Not sure which video you want to see more about, type list number or exit."
      list_videos
      select_video
    end
  end

  def display_new_video
    puts "Would you like to select another video from the list? (Y/N)"
    input = gets.strip.upcase
    case input
      when "Y"
        list_videos
        display_video
        display_new_video
      when "N"
        select_new_location
      else
        "Please enter Y to search more videos or N to exit"
        display_new_video
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
        start
      when "N"
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
