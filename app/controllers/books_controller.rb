class BooksController < ApplicationController
  before_action :authenticate_user!
 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
  flash[:notice] = "You have creatad book successfully."
  redirect_to book_path(@book.id)
  else
  @books = Book.all
  @user = current_user
  render action: :index
  end
 end

 def show
  @book_new = Book.new
  @book = Book.find(params[:id])
  @user = @book.user
 end

 def edit
   @book = Book.find(params[:id])
   if @book.user_id == current_user.id

   else
    redirect_to books_path
    end
 end

 def destroy
 	book = Book.find(params[:id])
 	book.destroy
 	redirect_to books_path
 end

 def index
  @book = Book.new
  @books = Book.all
  @user = current_user
 end

 def update
  book = Book.find(params[:id])
  if book.update(book_params)
  flash[:notice] = "You have updated book successfully."
  redirect_to book_path
  else
  @book = book
  render "edit"
  end
 end

 private
 def book_params
 	 params.require(:book).permit(:title, :body)

 end

end
