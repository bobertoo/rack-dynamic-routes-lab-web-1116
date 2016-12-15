class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_holder = req.path.split("/items/").last
      the_item = @@items.find {|item| item.name == item_holder}
      if the_item
        resp.write "#{the_item.price}\n"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
