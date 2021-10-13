require "pg"

class Messages
  @@connection
  def self.show_posts
    self.establish_connection
    result = connection.exec("SELECT * FROM posts;")
    result.map do |row| 
      {name: row["name"],
      post: row["post"]}
    end
  end

  def self.create(name, post)
    self.establish_connection
    connection.exec("INSERT INTO posts(\"name\", post, post_date ) VALUES ('#{name}', '#{post}', '14/10/2021');")
    
  end

  private
  def self.connection
    @@connection
  end

  def self.establish_connection
    if ENV['ENVIRONMENT'] == "test"
      @@connection = PG.connect(dbname: 'message_board_test')
    else
      @@connection = PG.connect(dbname: 'message_board')
    end
  end
end