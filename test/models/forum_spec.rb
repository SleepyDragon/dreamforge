describe Forum do
    it "does validate a forum with all information" do
      forum_with_all_information = Fabricate.build(:forum)
      forum_with_all_information.must_be_valid
    end

    it "does require a name" do
      forum_without_a_name = Fabricate.build(:forum, :name => nil)
      forum_without_a_name.wont_be_valid
    end

    it "doesn't require a subtitle" do
      forum_without_a_subtitle = Fabricate.build(:forum, :subtitle => nil)
      forum_without_a_subtitle.must_be_valid
    end

    it "does require a category" do
      forum_without_a_category = Fabricate.build(:forum, :category => nil)
      forum_without_a_category.wont_be_valid
    end

    it "does destroy all dependend topics" do
      forum = Fabricate(:forum)
      forum_id = forum.id
      forum.topics.each { |topic| topic.save }
      Topic.where(:forum_id => forum_id).wont_be_empty
      forum.destroy
      Topic.where(:forum_id => forum_id).must_be_empty
    end
end
