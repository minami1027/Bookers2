class BooksController < ApplicationController
  before_action  :authenticate_user!, :except=>[:top]
  before_action :book_user, only: [:edit, :update]


  def show
  	@books = Book.all
    @book = Book.find(params[:id])
    @booknew = Book.new
    @user = current_user
  end

  def index
    @user = current_user
  	@books = Book.all
    @booknew = Book.new
  end

  def create
  	@booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    if @booknew.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@booknew.id)
    else
    @books = Book.all
    @book = Book.new
    @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
    else
    render :edit
    end
  end


  def destroy
  	@book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
   end

  private
   def book_params
    params.require(:book).permit(:title, :body, :profile_image)
   end

   def book_user
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end
  end
