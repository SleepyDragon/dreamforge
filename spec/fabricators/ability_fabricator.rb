Fabricator(:ability) do
  name "Kamehameha"
  description "A powerful blast released to cursh your enemies"

  actions do
    { shoot: "BOOM!", punch: "SMACK!" }
  end
end
