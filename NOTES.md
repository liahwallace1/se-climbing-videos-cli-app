How to Build a CLI Gem (from CLI Gem Walkthrough video)

1. Plan your gem, imagine your interface
2. Start with the project structure (google)
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. Discover Objects.
8. Program

1. A command line interface to find videos for popular Southeast Bouldering locations. App with scrape videos from vimeo, youtube, and DPMClimbing.
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
