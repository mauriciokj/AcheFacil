require 'test_helper'

class PrateleirasControllerTest < ActionController::TestCase
  setup do
    @prateleira = prateleiras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prateleiras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prateleira" do
    assert_difference('Prateleira.count') do
      post :create, prateleira: { descricao: @prateleira.descricao, posicao: @prateleira.posicao, tamanho: @prateleira.tamanho, x: @prateleira.x, y: @prateleira.y }
    end

    assert_redirected_to prateleira_path(assigns(:prateleira))
  end

  test "should show prateleira" do
    get :show, id: @prateleira
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prateleira
    assert_response :success
  end

  test "should update prateleira" do
    put :update, id: @prateleira, prateleira: { descricao: @prateleira.descricao, posicao: @prateleira.posicao, tamanho: @prateleira.tamanho, x: @prateleira.x, y: @prateleira.y }
    assert_redirected_to prateleira_path(assigns(:prateleira))
  end

  test "should destroy prateleira" do
    assert_difference('Prateleira.count', -1) do
      delete :destroy, id: @prateleira
    end

    assert_redirected_to prateleiras_path
  end
end
