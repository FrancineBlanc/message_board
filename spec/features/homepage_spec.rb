feature "home page" do
  scenario "Welcome page" do
    visit "/home"
    expect(page).to have_content "Welcome to the Boards!"
  end

  scenario "Entering user name and message" do
    visit "/home"
    expect(page).to have_content "Name:"
    expect(page).to have_content "Your post:"
    expect(page).to have_button "Add Post"
  end
end