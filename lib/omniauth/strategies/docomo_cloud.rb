require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class DocomoCloud < OmniAuth::Strategies::OAuth2

      API_SERVER     = 'https://api.smt.docomo.ne.jp'
      ACCOUNT_SERVER = 'https://account-api.smt.docomo.ne.jp'

      option :name, 'docomo_cloud'

      option :authorize_options, [:display]

      option :client_options, {
        site:          API_SERVER,
        authorize_url: '/api/login',
        token_url:     "#{ACCOUNT_SERVER}/1/access_token"
      }

      uid{ access_token.to_s }

      info do
        {
          result: raw_info['result'],
          err_cd: raw_info['err_cd'],
          id:     raw_info['data']['id']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def authorize_params
        super.tap do |params|
          params[:display] ||= 'pc'
        end
      end

      def raw_info
        @raw_info ||= access_token.get("#{ACCOUNT_SERVER}/1/userid/get").parsed
      end

    end
  end
end
