require "./app"

def main
  app = App.new
  app.welcome_msg
  app.run
end

main()
