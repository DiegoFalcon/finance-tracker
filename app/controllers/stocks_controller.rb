class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have enter an empty stock"
    else
      @stock = Stock.new_form_lookup(params[:stock])
      flash.now[:danger] = "You have enter an incorrect symbol" unless @stock
    end
    show_format
  end

  def show_format
    respond_to do |format|
      format.js{render partial: 'users/result'}
    end
  end
end
