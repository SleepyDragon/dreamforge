
# Define useful factories for testing purposes here:

# How to use:
# @user = Factory(:user)
Factory.define :user do |user|
  user.sequence(:name) { |n| "factory user #{n}" }
  user.sequence(:email) { |n| "factory.#{n}@example.com" }
  user.password 'foobar'
end

Factory.define :category do |category|
  category.name 'test category'
end

Factory.define :forum do |forum|
  forum.name 'test forum'
  forum.category Factory(:category)
end

Factory.define :topic do |topic|
  topic.title 'test topic'
  topic.forum Factory(:forum)
end

Factory.define :post do |post|
  post.content 'test post'
  post.topic Factory(:topic)
  post.user Factory(:user)
end