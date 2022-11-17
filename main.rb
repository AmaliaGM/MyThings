require './app'
require './all_books'
require './all_movies'
require './all_music_albums'
require './json'

class Main
  include PreserveData

  def initialize
    @app = App.new
    @books = load_books
    @music_albums = load_music_albums
    @movies = load_movies
  end

  def menu
    puts ''
    puts 'thanks! for visit my things'
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - List all sources'
    puts '8 - Add a book'
    puts '9 - Add a music album'
    puts '10 - Add a movie'
    puts 'X - Exit'
  end

  # rubocop:disable Metrics
  def choose_options
    selected = gets.chomp
    case selected
    when '1' then @app.list_books(@books)
                  menu
                  choose_options
    when '2' then @app.music_albums(@music_albums)
                  menu
                  choose_options
    when '3' then @app.movies(@movies)
                  menu
                  choose_options
    when '4' then @app.genres(@genres)
                  menu
                  choose_options
    when '5' then @app.labels(@labels)
                  menu
                  choose_options
    when '6' then @app.authors(@authors)
                  menu
                  choose_options
    when '7' then @app.sources(@sources)
                  menu
                  choose_options
    when '8' then @app.create_book(@books)
                  menu
                  choose_option
    when '9' then @app.create_music_album(@music_albums)
                  menu
                  choose_options
    when '10' then @app.create_movie(@movies)
                  menu
                  choose_options
    when 'X' then abort('Thanks for comming by!')
    else
      puts 'error, select another number'
      choose_options
    end
  end
  # rubocop:enable Metrics-

  def show_app
    puts 'Welcome to School Library App'
    menu
    choose_options
  end
end

main = Main.new
puts main.run
