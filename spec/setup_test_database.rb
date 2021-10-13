require "pg"

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: "message_board_test")
  connection.exec("TRUNCATE posts;")
end