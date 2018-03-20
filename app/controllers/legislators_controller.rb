class LegislatorsController < ApplicationController
  def index
    @legislators = Legislator.all
    if params[:sortField].present?
      sortHash = {}
      sortHash[params[:sortField].to_sym] = params[:sortDirection].to_sym
      @legislators = @legislators.order(sortHash)
    end
    if params[:searchValue].present?
      search = "%#{params[:searchValue]}%"
      @legislators = @legislators.where('official_name ILIKE ?', search)
    end
    @total = @legislators.count

    @legislators = @legislators.page(params[:page]).per(params[:perPage])
    @draw = params[:draw]
  end
end
