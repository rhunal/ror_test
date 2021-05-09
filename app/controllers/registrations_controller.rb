class RegistrationsController < Devise::RegistrationsController

  private
  def sign_up_params
    params.require(:user).permit(
      :email,
      :password,
      :name,
      :profile_picture,
      :phone_number,
      :address_line,
      :street,
      :landmark,
      :city,
      :state,
      :pincode
    )
  end
end