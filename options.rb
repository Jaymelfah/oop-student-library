module Options
  def options(input)
    creation = Creation.new(@people, @book, @rental)
    case input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      @people.push(creation.create_person)
    when '4'
      @book.push(creation.create_book)
    when '5'
      @rentals.push(creation.create_rental)
    when '6'
      list_rentals
    else
      'Enter a number between from 1 to 7'
    end
  end
end
