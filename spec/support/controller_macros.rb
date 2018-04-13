module ControllerMacros
  def sign_in_user
    before do
      @user = create(:user)  #Create with fabric FactoryBot
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in @user
    end
  end
end