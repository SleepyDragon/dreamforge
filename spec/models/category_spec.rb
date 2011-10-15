require "spec_helper"

describe Category do
  it "does validate a category with all information" do
    category_with_all_information = Fabricate.build(:category)
    category_with_all_information.must_be_valid
  end

  it "does require a name" do
    category_without_a_name = Fabricate.build(:category, :name => nil)
    category_without_a_name.wont_be_valid
  end

  it "doesn't require a subtitle" do
    category_without_a_subtitle = Fabricate.build(:category, :subtitle => nil)
    category_without_a_subtitle.must_be_valid
  end

  # TODO: Test not implemented
  it "does destroy all dependent forums" do
    #category = Fabricate.build(:category)
    #category.forums.each { |forum| forum.save }
    #Forum.all.wont_be_empty
    #category.destroy
    #Forum.all.must_be_empty
  end
end
