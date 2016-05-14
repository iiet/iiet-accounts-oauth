require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class IietAccounts < OmniAuth::Strategies::OAuth2
      option :name, :iiet_accounts

      option :client_options, {
                                :site => 'https://accounts.iiet.pl',
                                :authorize_url => '/oauth/authorize'
                            }

      uid { raw_info['user_id'] }

      info do
        {
          username: raw_info['login'],
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          email: raw_info['email'],
          transcript_number: raw_info['transcript_number'],
          start_year: raw_info['start_year'],
          groups: raw_info['groups']
        }
      end

      option :authorize_params, { scope: ['public','extended','transcript_number'].join(" ") }

      def raw_info
        @raw_info ||= access_token.get('/oauth/v1/extended').parsed.merge(access_token.get('/oauth/v1/transcript_number').parsed)
      end

      def callback_url
        super.split('?').first
      end
    end
  end
end
