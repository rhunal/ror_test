class UsersGrid < BaseGrid

  scope do
    User
  end

  filter(:name, :string)
  filter(:email, :string)

  column(:name, html: true) do |record|
    link_to(record.name, profile_user_url(record))
  end

  column(:email)
  column(:phone_number)
  column(:city)
  date_column(:created_at)

  column(:actions, :html => true) do |record|
    content_tag :div, class: 'btn-group' do
      concat link_to('Edit', edit_polymorphic_url(record), class: 'btn btn-primary btn-sm')
    end
  end
end
