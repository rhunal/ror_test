module UsersHelper

  def editable_non_admin_columns
    details = %i[
      address_line
      street
      landmark
      city
      state
      pincode
    ]

    if current_user.is_admin?
      %i[
        name
        email
        password
        phone_number
      ].push(details).flatten
    else
      details
    end
  end
end
