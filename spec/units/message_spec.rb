require "message"
describe Messages do
  describe "#show_posts" do
    it "displays all of the posts" do
      connection = PG.connect(dbname: 'message_board_test')
      connection.exec("INSERT INTO posts(name, post, post_date) VALUES('Tina Belcher', 'I need new glasses', '11/10/2021')")
      messages = Messages.show_posts
      post = messages.map { |row| row[:post] }
      expect(post).to include "I need new glasses"
    end
  end
  
  describe "#create_post" do
    it "creates a new post" do
      name = "Linda Belcher"
      post = "I have a sister called Gail"
      Messages.create(name, post)
      messages = Messages.show_posts
      post_message = messages.map { |row| row[:post] }
      expect(post_message).to include "I have a sister called Gail"
    end
  end
end