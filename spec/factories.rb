Factory.define :user do |user|
  user.name "Perich van der Palots"
  user.email "ppalotes@example.com"
  user.password "noseque"
  user.password_confirmation "noseque"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end
