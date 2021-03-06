class BooksController < ApplicationController

  def index
    if params[:search].blank?
      @books = Book.all
    else
      #@books = Book.search(params[:search]) comment: if you want to use elastic_search
      @books = Book.joins(:author).
        where('title LIKE :search_param OR authors.name LIKE :search_param', search_param: params[:search])
    end
    @paginatable_array = Kaminari.paginate_array(@books).page(params[:page]).per(3) #change value if want 10 or more
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :published)
  end
end
