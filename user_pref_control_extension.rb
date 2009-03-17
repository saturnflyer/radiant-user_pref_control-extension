# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class UserPrefControlExtension < Radiant::Extension
  version "1.0"
  description "Allow other extensions to provide user preferences"
  url "http://saturnflyer.com/"
  
  def activate
    Admin::PreferencesController.class_eval {
      private
      
      def valid_params?
        hash = (params[:user] || {}).symbolize_keys
        protected_keys = %w(login created_at updated_at created_by_id updated_by_id admin developer notes lock_version salt session_token)
        unless Radiant::Config['user.protected_attributes'].blank?
          protected_keys = Radiant::Config['user.protected_attributes']
          protected_keys = protected_keys.split(',')
          protected_keys.map! { |k| k.strip.downcase.underscore }
        end        
        protected_keys.each do |att|
          return false if hash.include?(att.to_sym)
        end
      end
    }
  end
  
  def deactivate
  end
  
end
