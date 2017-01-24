require_relative '../config/environment'

module SeClimbingVideos
  SEARCH_LINKS = {
    :boone => {
      location: "Boone, NC",
      youtube: "https://www.youtube.com/results?sp=CAI%253D&q=Boone+NC+bouldering",
      vimeo: "https://vimeo.com/search/sort:latest?q=Boone%2C+NC+bouldering"
    },
    :grayson_highlands => {
      location: "Grayson Highlands, VA",
      youtube: "https://www.youtube.com/results?q=Grayson+Highlands+bouldering&sp=CAI%253D",
      vimeo: "https://vimeo.com/search/sort:latest?q=Grayson+Highlands+bouldering"
    },
    :horse_pens_40 => {
      location: "Horse Pens 40, AL",
      youtube: "https://www.youtube.com/results?q=horse+pens+40+bouldering&sp=CAI%253D",
      vimeo: "https://vimeo.com/search/sort:latest?q=Horse+Pens+40+bouldering"
    },
    :rocktown => {
      location: "Rocktown, GA",
      youtube: "https://www.youtube.com/results?q=Rocktown+bouldering&sp=CAI%253D",
      vimeo: "https://vimeo.com/search/sort:latest?q=Rocktown+bouldering"
    },
    :rumbling_bald => {
      location: "Rumbling Bald, NC",
      youtube: "https://www.youtube.com/results?q=rumbling+bald+bouldering&sp=CAI%253D",
      vimeo: "https://vimeo.com/search/sort:latest?q=rumbling+bald+bouldering"
    },
    :stone_fort => {
      location: "Stone Fort (LRC), TN",
      youtube: "https://www.youtube.com/results?sp=CAI%253D&q=Stone+Fort+LRC+bouldering",
      vimeo: "https://vimeo.com/search/sort:latest?q=stone+fort+lrc+bouldering"
    }
  }
end
