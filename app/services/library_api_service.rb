class LibraryApiService
  def initialize(isbn)
    @isbn = isbn
  end

  def call
    response = HTTParty.get("https://openlibrary.org/isbn/#{@isbn}", headers: { 'accept' => 'application/json' })
    # binding.pry


    json_response = JSON.parse(response.body)
    data = {
      name: json_response["title"],
      isbn: @isbn,
      author: Author.find_or_create_by(name: json_response["authors"].first["name"]).id,
    }


    data
  end

  private

  def author(id)
    response = HTTParty.get("https://openlibrary.org/authors/#{id}", headers: { 'accept' => 'application/json' })
    author_response = JSON.parse(response.body)


  end

end
