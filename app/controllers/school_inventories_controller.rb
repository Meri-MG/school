# frozen_string_literal: true

class SchoolInventoriesController < ApplicationController
  def index
    @school_inventories = SchoolInventory.all
    @pagy, @school_inventories = pagy(@school_inventories)
  end

  def new
    @school_inventory = SchoolInventory.new
  end

  def show
    @school_inventory = SchoolInventory.find(params[:id])
  end

  def edit
    @school_inventory = SchoolInventory.find(params[:id])
  end

  def create
    @school_inventory = SchoolInventory.create(school_inventory_params)

    if @school_inventory.save
      redirect_to @school_inventory, notice: 'Student was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @school_inventory = SchoolInventory.find(params[:id])

    @school_inventory.update(school_inventory_params)

    redirect_to school_inventories_path(@school_inventory)
  end

  def destroy
    @school_inventory = SchoolInventory.find(params[:id])
    @school_inventory.destroy!

    redirect_to school_inventories_path
  end

  def sponsor_individual_student
    @school_inventory = SchoolInventory.find(params[:id])
  end

  private

  def school_inventory_params
    params.require(:school_inventory)
          .permit(:name, :description, :sponsored, :quantity)
  end
end
