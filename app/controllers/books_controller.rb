class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)

    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index

    end
  end

  def index

  @user = current_user
  @users = User.all
  @books = Book.all
  @book = Book.new



  end

  def show

     @book = Book.find(params[:id])
     @user = @book.user



  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
     @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book.id)


    else
    
      render :edit

    end

  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to '/books'

  end

 private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
   def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
   end






end

