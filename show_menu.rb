require_relative './run'

module ShowMenu
  include Run
  def show_menu
    puts ''
    print 'Press Enter to go back to menu'
    gets.chomp
    puts ''
    run
  end

  def get_data(file)
    path_file = "./data/#{file}.json"
    File.new(path_file, 'w+') unless File.exist?(path_file)
    File.write(path_file, '[]') if File.empty?(path_file)
    file_contents = File.read(path_file)
    JSON.parse(file_contents)
  end

  def update_data(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json = JSON.generate(data, opts)
    File.write("./data/#{file}.json", json)
  end

  def show_books
    get_data('books').map { |item| Book.new(item['title'], item['author']) }
  end
end
