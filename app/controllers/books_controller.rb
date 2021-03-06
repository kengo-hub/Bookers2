class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @comments = BookComment.all

  end

  def show
     @book = Book.find(params[:id])
     @book_new = Book.new
     @user = @book.user
     @book_comment = BookComment.new
     @comments = BookComment.all


  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
      flash[:notice] = "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render 'edit'
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
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
    params.require(:book).permit(:title, :body)
  end

end