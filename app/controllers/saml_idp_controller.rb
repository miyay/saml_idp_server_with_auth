class SamlIdpController < SamlIdp::IdpController

  def idp_authenticate(email, password)
    user = ::User.where(email: params[:email]).first
    user && user.valid_password?(params[:password]) ? user : nil
  end

  def idp_make_saml_response(user)
    encode_SAMLResponse(user.email)
  end

end
