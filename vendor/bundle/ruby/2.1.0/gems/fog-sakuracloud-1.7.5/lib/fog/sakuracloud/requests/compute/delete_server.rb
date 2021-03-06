# coding: utf-8

module Fog
  module Compute
    class SakuraCloud
      class Real
        def delete_server( id, force = false, disks = [] )
          body = { "Force" => force, 'WithDisk' => disks }

          request(
            :headers => {
              'Authorization' => "Basic #{@auth_encode}"
            },
            :expects  => [200],
            :method => 'DELETE',
            :path => "#{Fog::SakuraCloud.build_endpoint(@api_zone)}/server/#{id}",
            :body => Fog::JSON.encode(body)
          )
        end
      end # Real

      class Mock
        def delete_server( id, force = false, disks = [] )
          response = Excon::Response.new
          response.status = 200
          response.body = {
          }
          response
        end
      end
    end # SakuraCloud
  end # Volume
end # Fog
