
class Application

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path.match(/items/)
        # .split("/items/").last grabs the what the user typed after the /
        # sets it to the variable item_name
        item_name = req.path.split("/items/").last
        # looks in the @@items, if iteration.name == item_name then item.price   
        if item =@@items.find{|i| i.name == item_name}
          resp.write item.price
        else 
          resp.status = 400
          resp.write "Item not found"
        end
      else
        resp.status=404
        resp.write "Route not found"
      end
      resp.finish
    end
  
  end