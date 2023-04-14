//
//  Content.swift
//  Whiskease
//
//  Created by Mark Riggleman on 4/8/23.
//


import Foundation

struct Story {
    let storyText: String //text of the story
    let choice1: String //text for the first choice
    let choice1Destination: Int //where does this choice go
    let choice2: String //text for the first choice
    let choice2Destination: Int //where does this choice go
    let choice3: String
    let choice3Destination: Int
    let storyImage: String
    let endOfStory: Bool
}


let stories = [
    //Page 0
    Story(storyText: "Let's find the perfect whiskey for you! Are you looking for a specific style of whiskey?",
          choice1: "Yes",
          choice1Destination: 1,
          choice2: "No",
          choice2Destination: 2,
          choice3: "N/A",
          choice3Destination: 0,
          storyImage: "",
          endOfStory: false),
    
    //Page 1
        Story(storyText: "Which style of whiskey are you looking for?",
              choice1: "Bourbon or Rye",
              choice1Destination: 3,
              choice2: "Irish",
              choice2Destination: 12,
              choice3:"Scotch",
              choice3Destination: 2,
              storyImage: "",
              endOfStory: false),

    //Page 2
        Story(storyText: "Do you like smoky flavors such as bbq and bacon?",
              choice1: "Yes",
              choice1Destination: 4,
              choice2: "No",
              choice2Destination: 3,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 3
        Story(storyText: "Great choice! Now, do you prefer bold flavors or smooth finshes?",
              choice1: "Bold flavor",
              choice1Destination: 7,
              choice2: "Smooth finish",
              choice2Destination: 6,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 4
        Story(storyText: "Perfect! So you like smoky flavors. In whiskey circles this is refered to as peat or peatiness. How much do you like these bold, smokey flavors?",
              choice1: "A little. I like a hint of smoke.",
              choice1Destination: 5,
              choice2: "A lot. I want a campfire in a glass.",
              choice2Destination: 10,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 5
        Story(storyText: "Do you like sweet flavors like honey?",
              choice1: "Yes",
              choice1Destination: 8,
              choice2: "No",
              choice2Destination: 9,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 6
        Story(storyText: "Do you have a preference between American and European whiskeys?",
              choice1: "American",
              choice1Destination: 11,
              choice2: "European",
              choice2Destination: 12,
              choice3: "No preference",
              choice3Destination: 13,
              storyImage: "",
              endOfStory: false),
    
    //Page 7
        Story(storyText: "Based on your answers, we believe you'll love rye whiskeys and bourbons with high rye content. These tend whiskeys have bolder flavors than many bourbons but are smoother than a scotch. Now, are you interested in seeing the most popular brands or some lesser known ones?",
              choice1: "Greatest Hits",
              choice1Destination: 20,
              choice2: "B Sides",
              choice2Destination: 21,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 8
        Story(storyText: "We think you’d really enjoy Speysides. These are scotches from a specific region. While Speysides are made in the Highlands of Scotland, these scotches are considered separate and distinct from Highland whiskies. Now, are you interested in seeing the most popular brands or some lesser known ones?",
              choice1: "Greatest Hits",
              choice1Destination: 22,
              choice2: "B Sides",
              choice2Destination: 23,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 9
        Story(storyText: "We think you would love a Highland malt. Highland malts encompass a broad range of whiskys but they tend to have a delightful balance of smoke, salt, and fruit flavors. Now, are you interested in seeing the most popular brands or some lesser known ones?",
              choice1: "Greatest Hits",
              choice1Destination: 24,
              choice2: "B Sides",
              choice2Destination: 25,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 10
        Story(storyText: "We think you would love an Islay: boldly peaty whiskys from an island off the West coast of Scotland. Now, are you interested in seeing the most popular brands or some lesser known ones?",
              choice1: "Greatest Hits",
              choice1Destination: 26,
              choice2: "B Sides",
              choice2Destination: 27,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 11
        Story(storyText: "We think you would love a nice, smooth bourbon. Bourbons are triple-distilled for extra smoothness.. Now, are you interested in seeing the most popular brands or some lesser known ones?",
              choice1: "Greatest Hits",
              choice1Destination: 14,
              choice2: "B Sides",
              choice2Destination: 15,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 12
        Story(storyText: "We think you'll love a nice Irish whiskey. Ireland is the homeland of whiskey and the word itself comes from the Irish phrase: uisce bheatha i.e. water of life. Now, are you interested in seeing the most popular brands or some lesser known ones?",
              choice1: "Greatest Hits",
              choice1Destination: 16,
              choice2: "B Sides",
              choice2Destination: 17,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 13
        Story(storyText: "It sounds like you're looking for a smooth sipping whiskey. Both bourbons and Irish whiskeys are triple-distilled for a smoother sipping experience compared to Scotch. Now, are you interested in seeing the most popular brands or some lesser known ones?",
              choice1: "Greatest Hits",
              choice1Destination: 18,
              choice2: "B Sides",
              choice2Destination: 19,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 14
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $35",
              choice1Destination: 46,
              choice2: "$35 - $75",
              choice2Destination: 47,
              choice3: "Over $75",
              choice3Destination: 48,
              storyImage: "",
              endOfStory: false),
    
    //Page 15
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $35",
              choice1Destination: 49,
              choice2: "$35 - $75",
              choice2Destination: 50,
              choice3: "Over $75",
              choice3Destination: 51,
              storyImage: "",
              endOfStory: false),
    
    //Page 16
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $35",
              choice1Destination: 52,
              choice2: "$35 - $75",
              choice2Destination: 53,
              choice3: "Over $75",
              choice3Destination: 54,
              storyImage: "",
              endOfStory: false),
    
    //Page 17
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $35",
              choice1Destination: 55,
              choice2: "$35 - $75",
              choice2Destination: 56,
              choice3: "Over $75",
              choice3Destination: 57,
              storyImage: "",
              endOfStory: false),
    
    //Page 18
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $35",
              choice1Destination: 58,
              choice2: "$35 - $75",
              choice2Destination: 59,
              choice3: "Over $75",
              choice3Destination: 60,
              storyImage: "",
              endOfStory: false),
    
    //Page 19
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $35",
              choice1Destination: 61,
              choice2: "$35 - $75",
              choice2Destination: 62,
              choice3: "Over $75",
              choice3Destination: 63,
              storyImage: "",
              endOfStory: false),
    
    //Page 20
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $35",
              choice1Destination: 28,
              choice2: "$35 - $75",
              choice2Destination: 29,
              choice3: "Over $75",
              choice3Destination: 30,
              storyImage: "",
              endOfStory: false),
    
    //Page 21
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $35",
              choice1Destination: 31,
              choice2: "$35 - $75",
              choice2Destination: 32,
              choice3: "Over $75",
              choice3Destination: 33,
              storyImage: "",
              endOfStory: false),
    
    //Page 22
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $75",
              choice1Destination: 34,
              choice2: "Over $75",
              choice2Destination: 35,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 23
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $75",
              choice1Destination: 36,
              choice2: "Over $75",
              choice2Destination: 37,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),
    
    //Page 24
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $75",
              choice1Destination: 38,
              choice2: "Over $75",
              choice2Destination: 39,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),

    //Page 25
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $75",
              choice1Destination: 40,
              choice2: "Over $75",
              choice2Destination: 41,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),

    //Page 26
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $75",
              choice1Destination: 42,
              choice2: "Over $75",
              choice2Destination: 43,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),


    //Page 27
        Story(storyText: "One last question before we make some recommendations and it's an important one. How much are you looking to spend?",
              choice1: "Under $75",
              choice1Destination: 44,
              choice2: "Over $75",
              choice2Destination: 45,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "",
              endOfStory: false),

    //Page 28
        Story(storyText: "Here are some well-known ryes and bourbons that we love that average under $35:",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "rye",
              endOfStory: false),

    //Page 29
        Story(storyText: "Here are some well-known ryes and bourbons that we love that average between $35 and $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "rye2",
              endOfStory: false),

    //Page 30
        Story(storyText: "Here are some well-known ryes and bourbons we love that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "rye3",
              endOfStory: false),

    //Page 31
        Story(storyText: "Here are some cool ryes and bourbons we love that average under $35.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "rye4",
              endOfStory: false),

    //Page 32
        Story(storyText: "Here are some cool ryes and bourbons we love that average between $35 and $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "rye5",
              endOfStory: false),
    
    //Page 33
        Story(storyText: "Here are our favorite ryes and bourbons that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "rye6",
              endOfStory: false),
    
    //Page 34
        Story(storyText: "Here are our favorite well-known Speyside single malts that average under $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "speyside1",
              endOfStory: false),
    
    //Page 35
        Story(storyText: "Here are our favorite well-known Speyside single malts that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "speyside2",
              endOfStory: false),
    
    //Page 36
        Story(storyText: "Here are some cool Speyside single malts that average under $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "speyside3",
              endOfStory: false),
    
    //Page 37
        Story(storyText: "Here are some cool Speyside single malts that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "speyside4",
              endOfStory: false),
    
    //Page 38
        Story(storyText: "Here are our favorite popular Highland single malts that average under $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "highland",
              endOfStory: false),
    
    //Page 39
        Story(storyText: "Here are our favorite popular Highland single malts that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "highland2",
              endOfStory: false),
    
    //Page 40
        Story(storyText: "Here are some Highland single malts that average under $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "highland3",
              endOfStory: false),
    
    //Page 41
        Story(storyText: "Here are some Highland single malts that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "highland4",
              endOfStory: false),
    
    //Page 42
        Story(storyText: "Here are our top picks for popular Islay single malts that average under $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "islay",
              endOfStory: false),
    
    //Page 43
        Story(storyText: "Here are our top picks for popular Islay single malts that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "islay2",
              endOfStory: false),
    
    //Page 44
        Story(storyText: "Here are some cool Islay single malts that average under $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "islay3",
              endOfStory: false),
    
    //Page 45
        Story(storyText: "Here are some cool Islay single malts that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "islay4",
              endOfStory: false),
    
    //Page 46
        Story(storyText: "Here are our favorite popular bourbons that average under $35.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "bourbon1",
              endOfStory: false),
    
    //Page 47
        Story(storyText: "Here are our favorite popular bourbons that average between $35 and $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "bourbon2",
              endOfStory: false),
    
    //Page 48
        Story(storyText: "Here are our favorite popular bourbons that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "bourbon3",
              endOfStory: false),
    
    //Page 49
        Story(storyText: "Here are some cool bourbons that average under $35.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "bourbon4",
              endOfStory: false),
    
    //Page 50
        Story(storyText: "Here are our favorite popular bourbons that average between $35 and $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "bourbon5",
              endOfStory: false),
    
    //Page 51
        Story(storyText: "Here are our favorite popular bourbons that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "bourbon6",
              endOfStory: false),
    
    //Page 52
        Story(storyText: "Here are our favorite Irish whiskeys that average under $35.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "irish1",
              endOfStory: false),
    
    //Page 53
        Story(storyText: "Here are our favorite Irish whiskeys that average under between $35 and $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "irish2",
              endOfStory: false),
    
    //Page 54
        Story(storyText: "Here are our favorite Irish whiskeys that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "irish3",
              endOfStory: false),
    
    //Page 55
        Story(storyText: "Here are some cool Irish whiskeys that average under $35.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "irish4",
              endOfStory: false),
    
    //Page 56
        Story(storyText: "Here are some cool Irish whiskeys that average between $35 and $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "irish5",
              endOfStory: false),
    
    //Page 57
        Story(storyText: "Here are some cool Irish whiskeys that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "irish6",
              endOfStory: false),
    
    //Page 58
        Story(storyText: "Here are some popular lighter-bodied whiskeys that average under $35.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "smooth1",
              endOfStory: false),
    
    //Page 59
        Story(storyText: "Here are some popular lighter-bodied whiskeys that average between $35 and $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "smooth2",
              endOfStory: false),
    
    //Page 60
        Story(storyText: "Here are some popular lighter-bodied whiskeys that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "smooth3",
              endOfStory: false),
    
    //Page 61
        Story(storyText: "Here are some popular lighter-bodied whiskeys that average under $35.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "smooth4",
              endOfStory: false),
    
    //Page 62
        Story(storyText: "Here are some popular lighter-bodied whiskeys that average between $35 and $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "smooth5",
              endOfStory: false),
    
    //Page 63
        Story(storyText: "Here are some popular lighter-bodied whiskeys that average over $75.",
              choice1: "N/A",
              choice1Destination: 0,
              choice2: "N/A",
              choice2Destination: 0,
              choice3: "N/A",
              choice3Destination: 0,
              storyImage: "smooth6",
              endOfStory: false)
    ]
