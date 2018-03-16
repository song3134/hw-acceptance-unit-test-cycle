Feature: destroy movie
 
  As a rottenpotatoes user
  So that I can properly manage the list of movies
  I want to destroy movies

Background: movies in database
 
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
 
Scenario: destroy movies
  When I am on the details page for "Alien"
  And I press "Delete"
  Then I should see "Movie 'Alien' deleted."
  And I should not see "1979-05-25"