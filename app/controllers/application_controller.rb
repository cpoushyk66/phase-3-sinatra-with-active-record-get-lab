class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes

    get '/bakeries' do
      bakeries = Bakery.all
      bakeries.to_json
    end

    get '/bakeries/:id' do
      bakery = Bakery.find(params[:id])
      bakery.to_json(include: :baked_goods)
    end

    get '/baked_goods/by_price' do
      priced_goods = BakedGood.all.order(price: :desc)
      priced_goods.to_json
    end

    get '/baked_goods/most_expensive' do
      pricey_good = BakedGood.all.order(price: :desc).first
      pricey_good.to_json
    end
end
