module BeezupApi
  module Api

    module QueryHelpers

        def order_path(market_place, account_id, beezup_order_uuid)
          "/#{market_place}/#{account_id}/#{beezup_order_uuid}"
        end

        def simple_query(path, options={})
          headers = options.delete(:headers) || {}
          params  = options

          get(path, params, headers)
        end

        def order_query(options={})
          headers = options.delete(:headers) || {}
          params  = to_query(options)
          path = order_path(options.delete(:market_place),
                            options.delete(:account_id),
                            options.delete(:beezup_order_uuid))
          get(path, params, headers)
        end

    end
  end
end
