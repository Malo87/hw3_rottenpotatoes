# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |film|
  Movie.create!(film)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I can see "(.*)" after "(.*)"/ do |match1, match2|
  assert page.body.index(match2) < page.body.index(match1)
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"


Then /I can see (all|none) of the movies/ do |choice|
  film_number = 0
  film_number = Movie.all.size if choice == "all"
  page.find(:xpath, "//table[@id=\"movies\"]/tbody[count(tr) = #{film_number} ]")
end
