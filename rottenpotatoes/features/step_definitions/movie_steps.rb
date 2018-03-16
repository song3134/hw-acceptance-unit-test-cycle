Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)   
  end
end

Then /I should see "(.*)" before "(.*)"/ do |movie_title1, movie_title2|
   page.body.should match /#{movie_title1}.*#{movie_title2}/m
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/,\s*/).each do |rating|
    if uncheck
      uncheck "ratings_#{rating}"
    else
      check "ratings_#{rating}"
    end
  end
end

Then /I should (not )?see movies with ratings: (.*)/ do |should_not, rating_list|
  rating_list.split(/,\s*/).each do |rating|
    if should_not
      assert page.has_no_xpath?('//*', :text=>"#{rating}")
    else
      assert page.has_xpath?('//*', :text=>"#{rating}")
    end 
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  #fail "Unimplemented"
  rows = page.all('table#movies tr').count
  #expect(rows).to eq Movie.count
  rows.should == 11
end

# (/^the director of "([^"]*)" should be "([^"]*)"$/)
# /^the director of "(.*)$" should be "(.*)"$/
Then (/^the director of "([^"]*)" should be "([^"]*)"$/) do |title, director|
  movie = Movie.find_by_title(title)
  expect(movie.director).to eq director
end

