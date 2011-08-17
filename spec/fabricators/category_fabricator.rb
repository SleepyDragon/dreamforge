Fabricator(:category) do
  name "wonderful name"
  forums(:count => 3) { |category, i| Fabricate(:forum, :category => category) }
end
