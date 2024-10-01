require "test_helper"

class SchoolInventoryTest < ActiveSupport::TestCase
  test "validations" do
    school_inventory = SchoolInventory.new

    assert_not school_inventory.valid?
    assert_includes school_inventory.errors[:name], "can't be blank"
    assert_includes school_inventory.errors[:description], "can't be blank"
    assert_includes school_inventory.errors[:quantity], "can't be blank"
    assert_includes school_inventory.errors[:sponsored], "can't be blank"

    school_inventory = SchoolInventory.new(name: 'Chair', description: 'Table chairs for the classroom', quantity: 12, sponsored: true)

    assert school_inventory.save!
  end
end
