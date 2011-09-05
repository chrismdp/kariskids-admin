Feature: Supporter reads updates
In order to keep up to date with what's happening with my family
As a member of a supporting family
I want to log into the service and be able to read updates about my family, with an email automatically sent to the supporting family.

Scenario: Supporter reads updates
  Given I am logged in as a supporter called "Simon"
  Then I am able to view updates from my link family

Scenario: Supporter receives email from family
Scenario: Supporter cannot see 'private' notes
Scenario: Supporter can only see updates for their own link family
Scenario: Administrators can see everything

