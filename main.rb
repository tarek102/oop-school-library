require_relative 'app'

class Main
  def main
    start = App.new
    start.options
  end
end


main = Main.new
main.main