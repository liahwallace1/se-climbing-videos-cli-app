#Our CLI Controller

class SeClimbingVideos::CLI

  def call
    puts "Welcome to SE Climbing Videos. This is a way to find the newest videos uploaded on Vimeo and Youtube for your favorite Southeast Bouldering spot."
    select_location
    select_time
    new_selection
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
    @location = gets.strip.downcase
    case @location
      when "1"
        puts "Execute search on Boone, NC"
      when "2"
        puts "Execute search on Grayson Highlands, VA"
      when "3"
        puts "Execute search on Horse Pens 40, AL"
      when "4"
        puts "Execute search on Rocktown, GA"
      when "5"
        puts "Execute search on Rumbling Bald, NC"
      when "6"
        puts "Execute search on Stone Fort (LRC), TN"
      when "exit"
        goodbye
        exit
      else
        puts "Please enter a valid number. If you don't see your favorite location, send us an email so we can update the app!"
        select_location
    end
  end

  def select_time
    puts "You can pick far back you want your search to go."
    puts "You can enter:"
    puts "1. one week ago"
    puts "2. one month ago"
    puts "3. three months ago"
    puts "4. six months ago"
    puts "5. one year ago"
    puts "6. forever"
    @time = gets.strip.downcase
    case @time
      when "1"
        puts "Provide videos uploaded in the past week"
      when "2"
        puts "Provide videos uploaded in the past month"
      when "3"
        puts "Provide videos uploaded in the past 3 months"
      when "4"
        puts "Provide videos uploaded in the past 6 months"
      when "5"
        puts "Provide videos uploaded in the past year"
      when "6"
        puts "Provide all videos uploaded for this location"
      when "exit"
        goodbye
        exit
      else
        puts "Please enter a valid number."
        select_time
    end
  end

  def new_selection
    puts "Would you like to search for more videos? (Y/N)"
    input = gets.strip.upcase
    case input
      when "Y"
        select_location
        select_time
        new_selection
      when "N"
        goodbye
        exit
      else
        "Please enter Y to search more videos or N to exit"
        new_selection
    end
  end

  def goodbye
    puts "Come back soon to see the newest climbing videos for your favorite area!"
  end

end
