feature "home page" do
  scenario "Welcome page" do
    visit "/"
    expect(page).to have_content "Welcome to the Boards!"
  end
end