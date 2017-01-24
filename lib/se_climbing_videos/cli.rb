#Our CLI Controller

class SeClimbingVideos::CLI

  attr_accessor :location, :videos

  def call
    puts "Welcome to SE Climbing Videos. This is a way to find the newest videos uploaded on Vimeo and Youtube for your favorite Southeast Bouldering spot."
    select_location
    list_videos
    select_video
  #  select_time
    select_new_video
    select_new_location
    goodbye
  end

  def select_location
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
        @location = "Boone, NC"
        puts "Execute search on Boone, NC"
        #SeClimbingVideos::Scraper.new("https://www.youtube.com/results?sp=CAI%253D&q=Boone+NC+bouldering", "https://vimeo.com/search/sort:latest?q=Boone%2C+NC+bouldering")
      when "2"
        @location = "Grayson Highlands, VA"
        puts "Execute search on Grayson Highlands, VA"
        #SeClimbingVideos::Scraper.new("https://www.youtube.com/results?q=Grayson+Highlands+bouldering&sp=CAI%253D", "https://vimeo.com/search/sort:latest?q=Grayson+Highlands+bouldering")
      when "3"
        @location = "Horse Pens 40, AL"
        puts "Execute search on Horse Pens 40, AL"
        #SeClimbingVideos::Scraper.new("https://www.youtube.com/results?q=horse+pens+40+bouldering&sp=CAI%253D", "https://vimeo.com/search/sort:latest?q=Horse+Pens+40+bouldering")
      when "4"
        @location = "Rocktown, GA"
        puts "Execute search on Rocktown, GA"
        #SeClimbingVideos::Scraper.new("https://www.youtube.com/results?q=Rocktown+bouldering&sp=CAI%253D", "https://vimeo.com/search/sort:latest?q=Rocktown+bouldering")
      when "5"
        @location = "Rumbling Bald, NC"
        puts "Execute search on Rumbling Bald, NC"
        #SeClimbingVideos::Scraper.new("https://www.youtube.com/results?q=rumbling+bald+bouldering&sp=CAI%253D", "https://vimeo.com/search/sort:latest?q=rumbling+bald+bouldering")
      when "6"
        @location = "Stone Fort (LRC), TN"
        puts "Execute search on Stone Fort (LRC), TN"
        #SeClimbingVideos::Scraper.new("https://www.youtube.com/results?sp=CAI%253D&q=Stone+Fort+LRC+bouldering", "https://vimeo.com/search/sort:latest?q=stone+fort+lrc+bouldering")
      when "exit"
        goodbye
        exit
      else
        puts "Please enter a valid number. If you don't see your favorite location, send us an email so we can update the app!"
        select_location
    end
  end

  def list_videos
    @videos = SeClimbingVideos::Video.recent_videos
    @videos.each.with_index(1) do |video, i|
      puts "#{i}. #{video.name} - #{video.upload_user} - #{video.upload_date}"
    end
  end

  def select_video
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

  def select_new_video
    puts "Would you like to select another video from the list? (Y/N)"
    input = gets.strip.upcase
    case input
      when "Y"
        list_videos
        select_video
        select_new_video
      when "N"
        select_new_location
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
        select_location
        select_time
        list_videos
        select_video
        select_new_video
        select_new_location
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
