require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order')
also_reload('./models/*')

# put placeholders roots LAST, otherwise the previous will not work

# index - all the pizzas
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# new = create a new pizza
get '/pizza-orders/new' do
  erb(:new)
end


# show - show one pizza
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# create - make a pizza-order
post '/pizza-orders/:id/update' do
  @order = PizzaOrder.new(params)
  @order.save
  erb(:create)
end

# edit - edit an existing pizza order
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# update - update a pizza-order
post '/pizza-orders/:id/edit' do
  @order = PizzaOrder.new(params)
  @order.update()
  erb(:update)
end

# edit - edit an existing pizza order
get '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete
  erb(:delete)
end

# # delete - delete a pizza-order
# post '/pizza-orders/:id/delete' do
#   @order = PizzaOrder.find(params[:id])
#   @order.delete
#   erb(:delete)
# end
