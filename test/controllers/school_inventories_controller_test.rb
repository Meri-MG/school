require "test_helper"

class SchoolInventoriesControllerTest < ActionDispatch::IntegrationTest
  test "#index" do
    get school_inventories_path

    assert_response :success
  end

  test "#new" do
    get new_school_inventory_path

    assert_response :success
  end

  test "#show" do
    get school_inventory_path(school_inventories(:chair))

    assert_response :success
  end

  test "#edit" do
    get edit_school_inventory_path(school_inventories(:chair))

    assert_response :success
  end

  test "#create" do
    assert_difference 'SchoolInventory.count' do
      post school_inventories_path, params: { school_inventory: valid_school_inventory_attrs}
    end

    assert_response :redirect
    assert_match 'Chair', SchoolInventory.last.name
  end

  test "#create fails" do
    assert_no_difference 'SchoolInventory.count' do
      post school_inventories_path, params: { school_inventory: { name: 'Chair',
                                                               description: 'Table chairs for classroom'}}
    end

    assert_response :unprocessable_entity
  end

  test "#update" do
    student = school_inventories(:chair)

    put school_inventory_path(student), params: { school_inventory: { name: 'Mariam'}}

    assert_response :redirect
    assert_match 'Mariam', student.reload.name
  end

  test "#destroy" do
    student = school_inventories(:chair)

    delete school_inventory_path(student)

    assert_response :redirect
  end

  private

  def valid_school_inventory_attrs
    {
      name: 'Chair',
      description: 'Table chairs for classroom',
      quantity: 12,
      sponsored: 'unsponsored'
    }
  end
end
