describe 'Static Page integration' do
  it "should render the root path" do
    visit root_path
    page.status_code.must_equal 200
  end
end

