require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class DocomoCloud < OmniAuth::Strategies::OAuth2

      option :name, 'docomo_cloud'

      option :client_options, {
        site:           'https://api.smt.docomo.ne.jp',
        authorize_path: '/api/login',
        token_url:      '/1/access_token'
      }

      uid{ access_token.to_s }

      info do
        {
          :name => raw_info['name'],
          :email => raw_info['email']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end