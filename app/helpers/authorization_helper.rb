require_relative '../utils/protected_action'

module AuthorizationHelper
  def protect!(credentials={})
    return if authorized? || development?

    guard = Authorization::ProtectedAction.new(self, credentials)
    guard.check!
    request.env['REMOTE_USER'] = guard.remote_user
  end

  def authorized?
    request.env['REMOTE_USER']
  end
end
