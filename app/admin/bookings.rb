# frozen_string_literal: true

ActiveAdmin.register Booking do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :start_date, :end_date, :name, :contact_email, :cabin_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:start_date, :end_date, :name, :contact_email, :cabin_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
