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

When /I (un)?check the following ratings: (.*)/ do |check, rating_list|
  rating_list.split( ',' ).each_with_index{|item, index = 0| 
  # log.debug(index)
  # log.debug(check)
  # log.debug(item)
   if "check"==check
     step %Q{I check "ratings_#{item}" }
     step %Q{the "ratings_#{item}" checkbox must be checked} 
   else
     step %Q{I uncheck "ratings_#{field}"}
     step %Q{the "ratings_#{field}" checkbox must not be checked}
   end
  }
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /I can see (all|none) of the movies/ do |choice|
  film_number = 0
  film_number = Movie.all.size if choice == "all"
  page.find(:xpath, "//table[@id=\"movies\"]/tbody[count(tr) = #{film_number} ]")
end
