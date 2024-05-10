class LibraryApiService
  def initialize(isbn)
    @isbn = isbn
  end

  def call
    response = HTTParty.get("https://openlibrary.org/isbn/#{@isbn}", headers: { 'accept' => 'application/json' })
    # binding.pry


    json_response = JSON.parse(response.body)
    data = {
      title: json_response["title"],
      isbn: @isbn,
      author: author(json_response["authors"][0]["key"]),
      genre: genre(json_response["subjects"][0]),
    }


    data
  end

  private

  def author(id)
    response = HTTParty.get("https://openlibrary.org#{id}", headers: { 'accept' => 'application/json' })
    author_response = JSON.parse(response.body)
    author = Author.find_or_create_by(name: author_response["name"])

  end

  def genre(name)
    Genre.find_or_create_by(name: name)
  end

end
