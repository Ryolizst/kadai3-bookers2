class BooksController < ApplicationController
     before_action :authenticate_user!
     #投稿の編集・削除を投稿者のみ
     before_action :correct_user, only: [:edit, :update, :destroy]
   
   def index
    @book = Book.new
    @books = Book.all
     @user = current_user
  end

 def create

@book = current_user.books.build(book_params)
  if @book.save
    #Rails.logger.debug "Book was successfully created: #{@book.inspect}"
    redirect_to book_path(@book), notice: 'Book was successfully created.'
  else
     #Rails.logger.debug "Failed to create book: #{@book.errors.full_messages}"
    @books = Book.all
    render :index
  end
end

def show
  @book = Book.find(params[:id])
  @user = @book.user#テスト追加
end

def edit
  @book = Book.find(params[:id])
end

 def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


 #投稿の編集・削除を投稿者のみ
 def correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path, alert: 'You are not authorized to edit this book.'
    end
  end
end