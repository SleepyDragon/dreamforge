Fabricator(:forum) do
  name "the pirates forum"
  subtitle "we talk about pirates here"
  category!
  topics!(:count => 1) { |forum, i| Fabricate(:topic, :forum => forum) }
end
