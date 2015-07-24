require 'grape'

class GrapeJuiceV1 < Grape::API
  format :json
  version 'v1', using: :path

  [:users, :statuses].each do |api_resource|
    resource api_resource do
      get do
        { :action => "#{api_resource} v1 index" }
      end

      params do
        requires :id, type: Integer, desc: "#{api_resource} id."
      end
      get ":id" do
        { :action => "#{api_resource} v1 action" }
      end
    end
  end
end
