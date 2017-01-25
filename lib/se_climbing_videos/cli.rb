class SeClimbingVideos::CLI

  attr_accessor :location_input

  def call
    puts "Welcome to SE Climbing Videos. This is a way to find the newest videos uploaded on Youtube for your favorite Southeast Bouldering spot."
    start
  end

  def start
    location_search
    print_videos
    select_video
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

    elsif @location_input =="exit"
      goodbye
      exit
    else
      puts "Please enter a valid number. If you don't see your favorite location, send me an email so I can update the app!"
      location_search
    end
  end

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
