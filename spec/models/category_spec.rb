require 'spec_helper'

describe Category do
  
  let(:invalid_category) { Category.new(:subtitle => 'my subtitle') }
  let(:valid_category) { Category.new(:name => 'my name') }
  
  it "does require a name" do
    invalid_category.should_not be_valid
  end
  
  it "doesn't require a subtitle" do
    valid_category.should be_valid
  end
  
end
