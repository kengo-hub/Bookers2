class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user

  end

  def show
     @book = Book.find(params[:id])
     @book_ = Book.new
     @user = @book.user
     
  end


  def create

    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end


