require 'test_helper'

class PaxesControllerTest < ActionController::TestCase
  setup do
    @pax = paxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pax" do
    assert_difference('Pax.count') do
      post :create, pax: { adulte: @pax.adulte, date_de_naissance: @pax.date_de_naissance, enfant: @pax.enfant, flight_id: @pax.flight_id, lieu_de_naissance: @pax.lieu_de_naissance, nom: @pax.nom, observations: @pax.observations, prenom: @pax.prenom, resa_id: @pax.resa_id }
    end

    assert_redirected_to pax_path(assigns(:pax))
  end

  test "should show pax" do
    get :show, id: @pax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pax
    assert_response :success
  end

  test "should update pax" do
    patch :update, id: @pax, pax: { adulte: @pax.adulte, date_de_naissance: @pax.date_de_naissance, enfant: @pax.enfant, flight_id: @pax.flight_id, lieu_de_naissance: @pax.lieu_de_naissance, nom: @pax.nom, observations: @pax.observations, prenom: @pax.prenom, resa_id: @pax.resa_id }
    assert_redirected_to pax_path(assigns(:pax))
  end

  test "should destroy pax" do
    assert_difference('Pax.count', -1) do
      delete :destroy, id: @pax
    end

    assert_redirected_to paxes_path
  end
end
