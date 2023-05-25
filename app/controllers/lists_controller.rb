class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    # as bookmark belomgs to list
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      # with valid params : creates a new List and assigns a newly created list as @list and redirects to the created list
      redirect_to list_path(@list)
    else
      # with invalid params : assigns a newly created but unsaved list as @list and re-renders the 'new' template
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end

#   def index
#     @lists = List.all
#   end

#   def new
#     @list = List.new # Needed to instantiate the form_with
#   end

#   def edit; end

#   def create
#     @list = List.new(list_params)
#     @list.save # Will raise ActiveModel::ForbiddenAttributesError
#     # No need for app/views/lists/create.html.erb
#     redirect_to list_path(@list)
#   end

#   # view details of the lists
#   def show
#     @list = List.find(params[:id])
#   end

#   def destroy
#     # need to find id before deleting
#     @list = List.find(params[:id])
#     @list.destroy
#     redirect_to lists_path
#   end

#   private

#   def list_params
#     params.require(:list).permit(:name)
#   end
# end
