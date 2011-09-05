Given /^I am logged in as a supporter called "([^"]*)"$/ do |supporter_name|
  Given %{I have one supporter "#{supporter_name}@example.com" with password "password"}
  Given %{a logged in user "#{supporter_name}" with password "password"}
  @supporter = User.last

  @supporter.supporter?.should be_true
end

Then /^I cannot access the rest of the site$/ do
  page.should have_no_css("#menu")
  visit people_url
  page.should have_content "cannot access"
end

def add_link_family_contacts_household(supporter)
  @household = Household.create! :caretaker => "Charlie"
  @household.people << Person.create!(:name => "Polly", :gender => "Female")
  @household.people << Person.create!(:name => "Peter", :gender => "Male")
  @household.link_family_contact = @supporter
  @household.comments << Comment.new
  @household.save!
end

Then /^I am able to view updates from my link family$/ do
  add_link_family_contacts_household(@supporter)
  page.should have_content("update from uganda!")
end

