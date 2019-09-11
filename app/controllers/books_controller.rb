class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  # def new
  # end

  def create
  	   @book = Book.new(book_params)


  	if @book.save
  		flash[:notice] = "The Book was successfully created"
  	   redirect_to book_path(@book)
  	else
  		@books =Book.all
  		render action: :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  	# flash[:notice] = "The Book was successfully edited"
  	# redirect_to book_path(book)
  end

  def update
  	@book = Book.find(params[:id])

  	if 	@book.update(book_params)
  	flash[:notice] = "The Book was successfully edited"
  	redirect_to book_path(@book), method: :patch

  else
  	 @books = Book.all
  	 render action: :edit
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

private
	def book_params
		params.require(:book). permit(:title, :body)
	end

end
