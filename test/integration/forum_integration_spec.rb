describe "Forum integration" do

  describe "index" do
    before do
      @categories = [ Fabricate(:category, :name => "My first category"),
                      Fabricate(:category, :name => "My second category")]

      visit forums_path
    end

    it "should be successful" do
      page.status_code.must_equal 200
    end

    it "should show all category headers" do
      category_table_headers = all("table.category thead")

      category_table_headers.each_index do |category_table_index|
        category_table_header = category_table_headers[category_table_index]
        category = @categories[category_table_index]

        category_table_header.must_have_content category.name
      end

      category_table_headers.length.must_equal 2
    end

    it "should show the corresponding forums for each category" do
      within "table.category tbody" do
        page.must_have_content "#{@categories.first.name} 1"
        page.must_have_content "#{@categories.first.name} 2"
      end
    end

    it "should link to the correct forums" do
      within "table.category tbody tr" do
        page.must_have_link_to forum_path(@categories.first.forums.first)
      end
    end

  end

end
