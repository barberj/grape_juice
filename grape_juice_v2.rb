require 'grape'

class GrapeJuiceV2 < Grape::API
  format :json
  version 'v2', using: :path

  [:users, :statuses].each do |api_resource|
    resource api_resource do
      get do
        { :action => "#{api_resource} v2 index" }
      end

      params do
        requires :id, type: Integer, desc: "#{api_resource} id."
      end
      get ":id" do
        { :action => "#{api_resource} v2 action" }
      end
    end
  end
end
