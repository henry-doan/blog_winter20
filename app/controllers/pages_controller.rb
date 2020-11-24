class PagesController < ApplicationController
  # GET all page 
  def index
    @pages = Page.all
    # render index.html.erb
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create 
    @page = Page.new(pages_params)
    if @page.save 
      redirect_to pages_path
    else
      render :new
    end
  end

  def edit
    @page = Page.find(params[:index])
  end

  private
    def pages_params
      params.require(:page).permit(:title, :author, :body)
    end
end
