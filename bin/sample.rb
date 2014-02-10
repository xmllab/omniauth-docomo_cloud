lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth'
require 'omniauth/docomo_cloud'

strategy = OmniAuth::Strategies::DocomoCloud.new(nil, '000000000089','q489oFNT4yoe')

p strategy.client.auth_code.authorize_url(redirect_uri:'https://iphone3d.now.tl/users/auth/docomo_cloud/callback')

p strategy.authorize_params
