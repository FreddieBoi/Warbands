# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Test"
  user.email                 "test@test.com"
  user.password              "testing"
  user.password_confirmation "testing"
end
