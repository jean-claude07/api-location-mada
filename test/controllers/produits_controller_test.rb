require 'test_helper'

class ProduitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produit = produits(:one)
  end

  test "should get index" do
    get produits_url, as: :json
    assert_response :success
  end

  test "should create produit" do
    assert_difference('Produit.count') do
      post produits_url, params: { produit: { cout: @produit.cout, description: @produit.description, nom: @produit.nom, string: @produit.string } }, as: :json
    end

    assert_response 201
  end

  test "should show produit" do
    get produit_url(@produit), as: :json
    assert_response :success
  end

  test "should update produit" do
    patch produit_url(@produit), params: { produit: { cout: @produit.cout, description: @produit.description, nom: @produit.nom, string: @produit.string } }, as: :json
    assert_response 200
  end

  test "should destroy produit" do
    assert_difference('Produit.count', -1) do
      delete produit_url(@produit), as: :json
    end

    assert_response 204
  end
end
