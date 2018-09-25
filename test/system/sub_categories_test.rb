require "application_system_test_case"

class SubCategoriesTest < ApplicationSystemTestCase
  setup do
    @sub_category = sub_categories(:one)
  end

  test "visiting the index" do
    visit sub_categories_url
    assert_selector "h1", text: "Sub Categories"
  end

  test "creating a Sub category" do
    visit sub_categories_url
    click_on "New Sub Category"

    fill_in "Category", with: @sub_category.category_id
    fill_in "Name", with: @sub_category.name
    click_on "Create Sub category"

    assert_text "Sub category was successfully created"
    click_on "Back"
  end

  test "updating a Sub category" do
    visit sub_categories_url
    click_on "Edit", match: :first

    fill_in "Category", with: @sub_category.category_id
    fill_in "Name", with: @sub_category.name
    click_on "Update Sub category"

    assert_text "Sub category was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub category" do
    visit sub_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub category was successfully destroyed"
  end
end
