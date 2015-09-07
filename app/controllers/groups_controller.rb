class GroupsController < ApplicationController

   before_action :set_group, only: [:show, :edit, :update, :destroy]

   def index
       @groups = Group.all
   end

   def show
   end

   def new
      @group = Group.new
   end

   def create
      @group = Group.new(group_params)
      if @group.save
      redirect_to groups_path
      else
      render 'new'
      end 
   end 

   def edit
   end

   def update
       if @group.update(group_params)
       redirect_to groups_path
       else
       render 'edit'
       end
   end

   def destroy
       @group.destroy
       redirect_to groups_path
   end

   private

   def group_params
       params[:group].permit(:title)
   end

   def set_group
       @group = Group.find(params[:id])
   end
end
