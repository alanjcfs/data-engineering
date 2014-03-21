class FilesController < ApplicationController
  def new
  end

  def create
    file = params[:file].read
    @tabfile = file.split("\n")

    # Ignore the first line
    @tabfile[1..-1].each do |tabbed_data|
      normalize_to_database(tabbed_data.split("\t"))
    end

    redirect_to files_path
  end

  def index
    @items = Item.includes(:merchant).all
    @purchasers = Purchaser.all
    @merchants = Merchant.all
    @items_purchasers = ItemsPurchaser.includes(:item, :purchaser).all

    @gross_revenue = @items_purchasers.reduce(0) { |accumulator, items_purchased|
      accumulator + items_purchased.price * items_purchased.count
    } / 100.0

    respond_to do |format|
      format.html
    end
  end

  private
  def normalize_to_database(data)
    # purchaser name
    purchaser = Purchaser.where(name: data[0]).first_or_create
    # merchant address & merchant name
    merchant = Merchant.where(address: data[4], name: data[5]).first_or_create
    # item description & item price
    item = merchant.items.where("items.description LIKE ?", "%#{data[1]}%").
      first_or_create(price: (data[2].to_f * 100).to_i, description: data[1])

    # purchase count
    ItemsPurchaser.create(count: data[3], purchaser_id: purchaser.id, item_id: item.id)
  end
end
