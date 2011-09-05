Given /^I am logged in as a supporter called "([^"]*)"$/ do |supporter_name|
  Given %{I have one supporter "#{supporter_name}@example.com" with password "password"}
  Given %{a logged in user "#{supporter_name}" with password "password"}

  User.last.supporter?.should be_true
end

Then /^I am able to view updates from my link family$/ do
  pending # express the regexp above with the code you wish you had
end
