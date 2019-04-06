
Given(/^I am posting a SOAP request to the calculator webservice$/) do
  @calculator = @ws
  @calculator.get_actions
end

When(/^I am sending addition requests for "([^"]*)" and "([^"]*)"$/) do |int_1, int_2|
  @calculator.add_request(int_1, int_2)
end

Then(/^I should get sum of the inputs in the response$/) do
  @calculator.verify_response_add
end

When(/^I am sending multiplication request for "([^"]*)" and "([^"]*)"$/) do |int_1, int_2|
  @calculator.multiply_request(int_1, int_2)
end

Then(/^I should get product of the inputs in the response$/) do
  @calculator.verify_response_multiplication
end

When(/^I am sending "([^"]*)" and "([^"]*)" to the addition soap request$/) do |char_1, char_2|
  @calculator.add_request(char_1, char_2)
end

Then(/^Instead of sum of the inputs, I should get an error in the response$/) do
  "Webservice testing"
end