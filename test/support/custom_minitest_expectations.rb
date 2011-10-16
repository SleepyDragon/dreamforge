module MiniTest::Assertions
  def assert_valid(obj, msg = nil)
    msg = message(msg) { "Expected #{mu_pp(obj)} to be valid" }
    assert obj.valid?, msg
  end

  def refute_valid(obj, msg = nil)
    msg = message(msg) { "Expected #{mu_pp(obj)} to be invalid" }
    assert !obj.valid?, msg
  end
end

# Define the assertions as expectations
module MiniTest::Expectations
  infect_an_assertion :assert_valid, :must_be_valid
  infect_an_assertion :refute_valid, :wont_be_valid
end

# Add the expectations to all objects
class Object
  include MiniTest::Expectations
end
