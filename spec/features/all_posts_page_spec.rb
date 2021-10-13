require "pg"

feature "Viewing posts" do
  scenario "A user can see all posts" do
    connection = PG.connect(dbname: "message_board_test")

    connection.exec("INSERT INTO posts(name, post, post_date) VALUES('Gene Belcher', 'I love playing the keyboard', '10/10/2021');")

    visit('/view-posts')

    expect(page).to have_content "I love playing the keyboard"
  end
end