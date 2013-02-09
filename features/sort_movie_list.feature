Feature: display list of movies sorted by different criteria
 
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page

Scenario: sort movies alphabetically
  When I follow "Movie Title"
  Then I should be on the home page
  And I can see all of the movies
  And I can see "When Harry Met Sally" after "The Terminator"
  And I can see "The Terminator" after "The Incredibles"
  And I can see "The Incredibles" after "The Help"
  And I can see "The Help" after "Raiders of the Lost Ark"
  And I can see "Raiders of the Lost Ark" after "Chocolat"
  And I can see "Chocolat" after "Chicken Run"
  And I can see "Chicken Run" after "Amelie"
  And I can see "Amelie" after "Aladdin"
  And I can see "Aladdin" after "2001: A Space Odyssey"
 

  # your steps here

Scenario: sort movies in increasing order of release date
  When I follow "Release Date"
  Then I should be on the home page
  And I can see all of the movies
  And I can see "The Help" after "The Incredibles"
  And I can see "The Incredibles" after "Amelie"
  And I can see "Amelie" after "Chocolat"
  And I can see "Chocolat" after "Chicken Run"
  And I can see "Chicken Run" after "Aladdin"
  And I can see "Aladdin" after "When Harry Met Sally"
  And I can see "When Harry Met Sally" after "The Terminator"
  And I can see "The Terminator" after "Raiders of the Lost Ark"
  And I can see "Raiders of the Lost Ark" after "2001: A Space Odyssey"

