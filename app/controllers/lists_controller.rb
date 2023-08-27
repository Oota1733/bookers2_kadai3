class ListsController < ApplicationController
  def new
     @list = List.new
  end

  def create

    list = List.new(list_params)

    list.save

    redirect_to '/top'
  end

  def index

    

    user = User.new(list_params)

    user.save

    redirect_to '/edit'

  end

  def show
    
   
    
  end

  def edit
  end
end
