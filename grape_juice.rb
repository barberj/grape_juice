require 'grape'

class GrapeJuice < Grape::API
  format :json
  version 'v1'

  resource :users do
    get do
      { :action => 'index' }
    end

    params do
      requires :id, type: Integer, desc: "User id."
    end
    get ":id" do
      { :action => 'read' }
    end
  end

  version 'v2'

  resource :users do
    get do
      { :action => 'v2_index' }
    end

    params do
      requires :id, type: Integer, desc: "User id."
    end
    get ":id" do
      { :action => 'v2_read' }
    end
  end
end
