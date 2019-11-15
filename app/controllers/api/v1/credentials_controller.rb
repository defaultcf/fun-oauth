class Api::V1::CredentialsController < ApplicationController
  def me
    render json: User.find(doorkeeper_token&.resource_owner_id)
  end
end
