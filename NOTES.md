How to Build a CLI Gem (from CLI Gem Walkthrough video)

1. Plan your gem, imagine your interface
2. Start with the project structure (google)
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover Objects.
8. Program

1. A command line interface to find videos for popular Southeast Bouldering locations. App with scrape videos from vimeo and youtube.
  - user types se_climbing_videos
  - Prompt: Enter the number for the location you would like to search. You can select:
      1. Boone, NC
      2. Grayson Highlands, VA
      3. Horse Pens 40, AL
      4. Rocktown, GA
      5. Rumbling Bald, NC
      6. Stone Fort (LRC), TN
  - Provides a list of videos for that area like this: (Initially sort my upload date)
      1. Video name - Uploaded by - Upload date
      2. Video name - Uploaded by - Upload date
  - Prompt: Which video would you like more information about? Please enter the number.
  - Provides user the description, length, and link to the selected video.

  - Questions I still have about usability
    - Should the user be allowed to sort?
    - Should I limit the output to the latest 100 videos? Will I need to add a More feature?
    - Should the user be able to enter a date range like last month, last year, forever?

2. You can make folders for Bundler gem by typing <bundle gem gem_name> into the terminal
  - https://bundler.io/v1.13/guides/creating_gem
  - http://railscasts.com/episodes/245-new-gem-with-bundler
  - I created <bundle gem se_climbing_videos> with a license and Code of Conduct.
  - I added a bin file, se_climbing_videos, and updated the permissions to allow this to execute with <chmod +x se_climbing_videos> and made sure it could run with "./bin/se_climbing_videos"

  3. We want our CLI file (bin/se_climbing_videos) to be as simple as possible.
    - first put "#!/usr/bin/env ruby" so it runs in ruby
    - require our environment that connects our bin file to all of our other files.
    - SeClimbingVideos::CLI.new.call
      - This should be all we need to run our file. Don't want to change this file in the future - program all of this in our lib files


    - - NOTE ON REQUIRING FILES:
      - bin/se_climbing_videos
          - require '.lib/environment'
      -THEREFORE, lib/environment.rb (renamed sc_climbing_videos.rb to environment for less confusion)
          - require_relative "./se_climbing_videos/version"
          - require_relative "./se_climbing_videos/cli"

  4. Our bin/se_climbing_videos file will now run a CLI Controller file - we need to make that.
    - In the lib/se_climbing_videos folder, we create a new ruby file called cli.rb. This is where we will put all the coding for how our CLI will work. (includes things like the prompts and what will occur in the CLI that the user sees and interacts with)

  5. To get our CLI Controller (cli.rb) file started, I created a class that inherits from the SeClimbingVideos class (without saying it is a type of SeClimbingVideo)
    - In that class we make a call method (which is used in our bin file). To get started and make sure it works, we just say that the call method puts "SE Climbing Videos"
    - we can use fake data to start listing out our methods we might want to use in the CLI


    Links to search:
    1. Boone, NC
      - Youtube: https://www.youtube.com/results?sp=CAI%253D&q=Boone+NC+bouldering
      - Vimeo: https://vimeo.com/search/sort:latest?q=Boone%2C+NC+bouldering
    2. Grayson Highlands, VA
      - Youtube: https://www.youtube.com/results?q=Grayson+Highlands+bouldering&sp=CAI%253D
      - Vimeo: https://vimeo.com/search/sort:latest?q=Grayson+Highlands+bouldering
    3. Horse Pens 40, AL
      - Youtube: https://www.youtube.com/results?q=horse+pens+40+bouldering&sp=CAI%253D
      - Vimeo: https://vimeo.com/search/sort:latest?q=Horse+Pens+40+bouldering
    4. Rocktown, GA
      - Youtube: https://www.youtube.com/results?q=Rocktown+bouldering&sp=CAI%253D
      - Vimeo: https://vimeo.com/search/sort:latest?q=Rocktown+bouldering
    5. Rumbling Bald, NC
      - Youtube: https://www.youtube.com/results?q=rumbling+bald+bouldering&sp=CAI%253D
      - Vimeo: https://vimeo.com/search/sort:latest?q=rumbling+bald+bouldering
    6. Stone Fort (LRC), TN
      - Youtube: https://www.youtube.com/results?sp=CAI%253D&q=Stone+Fort+LRC+bouldering
      - Vimeo: https://vimeo.com/search/sort:latest?q=stone+fort+lrc+bouldering
